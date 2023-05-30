report 50021 "Kbank Export FTL"
{

    ProcessingOnly = True;

    dataset
    {
        dataitem("Gen. Journal Batch"; "Gen. Journal Batch")
        {
            DataItemTableView = SORTING("Journal Template Name", Name);
            RequestFilterFields = "Journal Template Name", Name;
            dataitem("Gen. Journal Line"; "Gen. Journal Line")
            {
                DataItemLink = "Journal Template Name" = FIELD("Journal Template Name"), "Journal Batch Name" = FIELD(Name);
                DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Line No.") ORDER(Ascending);

                dataitem("NWTH Apply WHT Entry"; "NWTH Apply WHT Entry")
                {
                    DataItemLink = "Original Document No." = FIELD("Document No.");
                    DataItemTableView = SORTING("Entry No.") ORDER(Ascending) WHERE("WHT %" = FILTER(<> 0));

                    trigger OnAfterGetRecord()
                    var
                        GenJLN: Record "Gen. Journal Line";
                    begin
                        case "NWTH Apply WHT Entry"."WHT Report" of
                            "NWTH Apply WHT Entry"."WHT Report"::"Por Ngor Dor 1":
                                TaxFormG := '01';
                            "NWTH Apply WHT Entry"."WHT Report"::"Por Ngor Dor 2":
                                TaxFormG := '03';
                            "NWTH Apply WHT Entry"."WHT Report"::"Por Ngor Dor 3":
                                TaxFormG := '05';
                            "NWTH Apply WHT Entry"."WHT Report"::"Por Ngor Dor 53":
                                TaxFormG := '07';
                        end;

                        PurchInvLine.Reset();
                        PurchInvLine.SetRange("Document No.", "NWTH Apply WHT Entry"."NWTH Ref. Document No.");
                        PurchInvLine.SetRange("Line No.", "NWTH Apply WHT Entry"."NWTH Ref. Line No.");
                        If not PurchInvLine.FindFirst() then
                            If "NWTH Apply WHT Entry"."Include Vat Amount" then
                                PurchInvLine."Amount Including VAT" := "NWTH Apply WHT Entry".Base + ("NWTH Apply WHT Entry".Base * 7 / 100)
                            else
                                PurchInvLine."Amount Including VAT" := "NWTH Apply WHT Entry".Base;

                        FTL_WHT();
                        OutStreamExportTextG.WriteText(ValueG);
                        OutStreamExportTextG.WriteText();
                        //--Write WHT Line
                    end;
                }
                dataitem("Gen. Journal Line2"; "Gen. Journal Line")
                {
                    DataItemLinkReference = "Gen. Journal Line";
                    DataItemLink = "Document No." = field("Document No."), "Recipient Bank Account" = field("Recipient Bank Account");

                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                        VendorBankAccountL: Record "Vendor Bank Account";
                    begin
                        If "Gen. Journal Line2"."Account Type" = "Gen. Journal Line2"."Account Type"::Vendor then begin
                            VendorBankAccountL.SetRange(Code, "Gen. Journal Line2"."Recipient Bank Account");
                            VendorBankAccountL.SetRange("Vendor No.", "Gen. Journal Line2"."Account No.");
                            If VendorBankAccountL.FindFirst() then;
                            VendorBankAccountPhone := VendorBankAccountL."Phone No.";
                            VendorBankAccountSMSG := Format(VendorBankAccountL."SMS Language");
                            If VendorBankAccountL."SMS Language" <> VendorBankAccountL."SMS Language"::" " then begin
                                FTL_MESSAGEINF();
                                OutStreamExportTextG.WriteText(ValueG);
                                OutStreamExportTextG.WriteText;
                            end else
                                CurrReport.Skip();
                        end;
                    end;
                }


                trigger OnAfterGetRecord()
                begin
                    //++++++++++++++++++++ Get value ++++++++++++++++++++

                    Clear(VendorBankAccountFaxNoG);
                    Clear(VendorBankAccountEmailG);
                    Clear(VendorBankAccountNoG);
                    Clear(VendorBankAccountNameG);
                    Clear(VendorBankAccountG);
                    Clear(BankAccountRepG);
                    Clear(EmployeeRepG);

                    If "Account Type" = "Account Type"::Vendor then begin
                        VendorBankAccountG.Reset();
                        VendorBankAccountG.SetRange(Code, "Recipient Bank Account");
                        VendorBankAccountG.SetRange("Vendor No.", "Account No.");
                        If VendorBankAccountG.FindFirst() then;
                        VendorBankAccountNoG := VendorBankAccountG."Bank Account No.";
                        VendorBankAccountNameG := VendorBankAccountG.Name;
                        VendorBankAccountFaxNoG := VendorBankAccountG."Fax No.";
                        VendorBankAccountEmailG := VendorBankAccountG."E-Mail";


                    end else
                        If "Account Type" = "Account Type"::"Bank Account" then begin
                            if BankAccountRepG.Get("Account No.") then;
                            VendorBankAccountNoG := BankAccountRepG."Bank Account No.";
                            VendorBankAccountNameG := BankAccountRepG."NWTH 2nd Name";
                            VendorBankAccountFaxNoG := BankAccountRepG."Fax No.";
                            VendorBankAccountEmailG := BankAccountRepG."E-Mail";

                        end else
                            If "Account Type" = "Account Type"::Employee then begin
                                if EmployeeRepG.Get("Account No.") then;
                                VendorBankAccountNoG := EmployeeRepG."Bank Account No.";
                                VendorBankAccountNameG := EmployeeRepG."First Name" + ' ' + EmployeeRepG."Last Name";
                                VendorBankAccountFaxNoG := EmployeeRepG."Fax No.";
                                VendorBankAccountEmailG := EmployeeRepG."E-Mail";

                            End;

                    if StrLen(VendorBankAccountNameG) > 50 then //Old 100
                        VendorBankAccountNameG := CopyStr(VendorBankAccountNameG, 1, 50); //Old 100

                    //++++++++++ calculate amount exclude wht amount / line ++++++++++
                    Clear(WHTCountG);
                    Clear(AmountG);
                    Clear(AmountAfterVatG);
                    Clear(AmountBeforeVatG);
                    Clear(VatAmountG);
                    Clear(WHTBaseG);
                    Clear(SmartCLineAmtG);

                    VendorLedgerEntryG.Reset;
                    VendorLedgerEntryG.SetCurrentKey("Entry No.");
                    VendorLedgerEntryG.SetRange("Applies-to ID", "Document No.");
                    VendorLedgerEntryG.SetRange("Vendor No.", "Account No.");
                    if VendorLedgerEntryG.FindSet then begin
                        repeat
                            AmountG += Abs(VendorLedgerEntryG."Amount to Apply");
                            AmountAfterVatG += Abs(VendorLedgerEntryG."Amount to Apply");

                            VATEntryG.Reset;
                            VATEntryG.SetCurrentKey("Document No.", "Posting Date");
                            VATEntryG.SetRange("Document No.", VendorLedgerEntryG."Document No.");
                            VATEntryG.SetRange("Posting Date", VendorLedgerEntryG."Posting Date");
                            if VATEntryG.FindSet then
                                repeat
                                    AmountBeforeVatG += VATEntryG.Base;
                                    VatAmountG += VATEntryG.Amount;
                                    if VATEntryG.Amount = 0 then
                                        VatAmountG += VATEntryG."Unrealized Amount";
                                until VATEntryG.Next = 0;
                        until VendorLedgerEntryG.Next = 0;
                        AmountBeforeVatG := AmountAfterVatG - VatAmountG;
                    end else begin
                        AmountG := "Amount (LCY)";
                        AmountBeforeVatG := "Amount (LCY)";
                        AmountAfterVatG := "Amount (LCY)" - VatAmountG;
                    end;

                    Clear(WHTAmountG);
                    Clear(WHTDescriptionG);
                    Clear(WHTProductPostingGroupG.Description);
                    NWTHApplyWHTEntryG.Reset;
                    NWTHApplyWHTEntryG.SetCurrentKey("Entry No.");
                    NWTHApplyWHTEntryG.SetRange("Original Document No.", "Gen. Journal Line"."Document No.");
                    NWTHApplyWHTEntryG.SetRange("Bill-to/Pay-to No.", "Gen. Journal Line"."Account No.");
                    NWTHApplyWHTEntryG.SetFilter("WHT %", '<>%1', 0);
                    if NWTHApplyWHTEntryG.FindSet then
                        repeat
                            WHTAmountG += NWTHApplyWHTEntryG.Amount;
                            WHTBaseG += NWTHApplyWHTEntryG.Base;
                            Clear(WHTProductPostingGroupG);
                            if WHTProductPostingGroupG.Get(NWTHApplyWHTEntryG."WHT Prod. Posting Group") then begin
                                if StrPos(WHTDescriptionG, WHTProductPostingGroupG.Description) <= 0 then begin
                                    if StrLen(WHTDescriptionG) > 0 then
                                        WHTDescriptionG += '/';
                                    WHTDescriptionG += WHTProductPostingGroupG.Description;
                                end;
                                if StrLen(WHTDescriptionG) > 35 then
                                    WHTDescriptionG := CopyStr(WHTDescriptionG, 1, 35);
                            end;
                        until NWTHApplyWHTEntryG.Next = 0;
                    //AmountAfterVatG := AmountG;
                    AmountG := AmountG - WHTAmountG;
                    SmartCLineAmtG := AmountAfterVatG - WHTAmountG;

                    //---------- calculate amount exclude wht amount / line ----------

                    NWTHApplyWHTEntryG.Reset;
                    NWTHApplyWHTEntryG.SetCurrentKey("Entry No.");
                    NWTHApplyWHTEntryG.SetRange("Original Document No.", "Gen. Journal Line"."Document No.");
                    NWTHApplyWHTEntryG.SetRange("Bill-to/Pay-to No.", "Gen. Journal Line"."Account No.");
                    NWTHApplyWHTEntryG.SetFilter("WHT %", '<>%1', 0);
                    WHTCountG := NWTHApplyWHTEntryG.Count;

                    Clear(WHTCertificaseNoG);
                    Clear(WHTTypeG);
                    Clear(PayeeAddress1);
                    Clear(PayeeAddress2);
                    Clear(PayeeAddress3);
                    NWTHApplyWHTEntry2G.Reset;
                    NWTHApplyWHTEntry2G.SetCurrentKey("Entry No.");
                    NWTHApplyWHTEntry2G.SetRange("Original Document No.", "Gen. Journal Line"."Document No.");
                    NWTHApplyWHTEntry2G.SetRange("Bill-to/Pay-to No.", "Gen. Journal Line"."Account No.");
                    NWTHApplyWHTEntry2G.SetFilter("WHT %", '<>%1', 0);
                    if NWTHApplyWHTEntry2G.FindFirst then begin
                        WHTCertificaseNoG := NWTHApplyWHTEntry2G."WHT Certificate No.";
                        WHTTypeG := Format(NWTHApplyWHTEntryG."NWTH WHT Term");
                    end;

                    Clear(TaxIdG);
                    Clear(VendorAddressG);
                    Clear(WHTFormIdG);
                    Clear(PersonalIdG);
                    Clear(CompanyTaxIdG);
                    Clear(STSWHTFormIdG);
                    ChequePayeeG := "Gen. Journal Line"."NWTH Payee Name";
                    Clear(VendorG);
                    if VendorG.Get("Gen. Journal Line"."Account No.") then begin
                        if ChequePayeeG = '' then
                            ChequePayeeG := VendorG.Name;
                        if VendorG."NWTH WHT Bus. Posting Group" = 'COMPANY' then begin
                            WHTFormIdG := '53';
                            TaxIdG := DelChr(VendorG."VAT Registration No.", '=', '-');
                            CompanyTaxIdG := DelChr(VendorG."VAT Registration No.", '=', '-');
                            if StrLen(CompanyTaxIdG) > 13 then //Old 10
                                CompanyTaxIdG := CopyStr(CompanyTaxIdG, 1, 13); //Old 10
                            if WHTAmountG > 0 then
                                STSWHTFormIdG := '53';
                        end else
                            if VendorG."NWTH WHT Bus. Posting Group" = 'PERSONAL' then begin
                                WHTFormIdG := '';
                                TaxIdG := DelChr(VendorG."VAT Registration No.", '=', '-');
                                PersonalIdG := DelChr(VendorG."VAT Registration No.", '=', '-');
                                if StrLen(PersonalIdG) > 13 then
                                    PersonalIdG := CopyStr(PersonalIdG, 1, 13);
                                if WHTAmountG > 0 then
                                    STSWHTFormIdG := '03';
                            end;
                        PersonalIdG := VendorG."VAT Registration No.";
                        CompanyTaxIdG := Vendorg."VAT Registration No.";

                        TaxIdG := VendorG."VAT Registration No.";

                        TaxIdG := DelChr(TaxIdG, '=', '-');
                        if StrLen(TaxIdG) > 13 then
                            TaxIdG := CopyStr(TaxIdG, 1, 13);

                        VendorAddressG := DelChr(StrSubstNo('%1 %2 %3 %4', VendorG.Address, VendorG."Address 2", VendorG.City, VendorG."Post Code"), '=', ',');
                        if StrLen(VendorAddressG) > 120 then
                            VendorAddressG := CopyStr(VendorAddressG, 1, 120);

                        if (WHTAmountG > 0) and (WHTBaseG > 0) then begin
                            PayeeAddress1 := VendorG.Address;
                            PayeeAddress2 := VendorG."Address 2";
                            PayeeAddress3 := VendorG.City + ' ' + VendorG."Post Code";
                        end;

                        // //Get fax no. and e-mail no.
                        // if "Gen. Journal Line"."Advice Mode" = "Gen. Journal Line"."Advice Mode"::F then
                        //     VendorBankAccountFaxNoG := VendorG."Fax No."
                        // else
                        //     if "Gen. Journal Line"."Advice Mode" = "Gen. Journal Line"."Advice Mode"::E then
                        //         VendorBankAccountEmailG := VendorG."E-Mail";

                    end;


                    Clear(PaymentJournalCountG);
                    GenJournalLine3G.Reset;
                    GenJournalLine3G.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");
                    GenJournalLine3G.SetRange("Journal Template Name", "Gen. Journal Line"."Journal Template Name");
                    GenJournalLine3G.SetRange("Journal Batch Name", "Gen. Journal Line"."Journal Batch Name");
                    PaymentJournalCountG := GenJournalLine3G.Count;
                    //-------------------- Get value --------------------

                    if "Advice Mode" = "Advice Mode"::F then
                        VendorBankAccountFaxNoG := VendorBankAccountFaxNoG
                    else
                        VendorBankAccountFaxNoG := '';

                    if "Advice Mode" = "Advice Mode"::E then
                        VendorBankAccountEmailG := VendorBankAccountEmailG
                    Else
                        VendorBankAccountEmailG := '';

                    //++++++++++++++++++++ Write detail ++++++++++++++++++++
                    FTL_Details("Line No.",
                                "Posting Date",
                                VendorBankAccountNoG,
                                AmountG,
                                VendorBankAccountNameG,
                                WHTCountG,
                                "Document No.",
                                Format("Advice Mode"),
                                VendorBankAccountFaxNoG,
                                VendorBankAccountEmailG,
                                AmountBeforeVatG,
                                WHTAmountG,
                                AmountAfterVatG);

                    OutStreamExportTextG.WriteText(ValueG);
                    OutStreamExportTextG.WriteText;
                    I += 1;
                end;

                trigger OnPreDataItem()
                begin
                    I := 1;
                    Clear(TotalInvoiceExclVatG);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //++++++++++++++++++++ Write Header ++++++++++++++++++++

                //+++++ calculate amount exclude wht amount ++++
                TestField("Ebanking Type", "Ebanking Type"::FTL);
                Clear(TotalCreditTermsCountG);
                Clear(TotalAmountG);
                Clear(TotalWHTAmountG);
                GenJournalLineG.Reset;
                GenJournalLineG.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");
                GenJournalLineG.SetRange("Journal Template Name", "Journal Template Name");
                GenJournalLineG.SetRange("Journal Batch Name", Name);
                if GenJournalLineG.FindSet then begin
                    BankAccountG.Get(GenJournalLineG."Bal. Account No."); // Kbank !
                    PostingDate := GenJournalLineG."Posting Date";
                    ChargeofAC := Format(GenJournalLineG."Charges For A/C of");
                    repeat
                        VendorLedgerEntryG.RESET;
                        VendorLedgerEntryG.SETCURRENTKEY("Entry No.");
                        VendorLedgerEntryG.SETRANGE("Applies-to ID", GenJournalLineG."Document No.");
                        VendorLedgerEntryG.SETRANGE("Buy-from Vendor No.", GenJournalLineG."Account No.");
                        IF VendorLedgerEntryG.FINDSET THEN begin
                            REPEAT
                                TotalAmountG += ABS(VendorLedgerEntryG."Amount to Apply");
                            UNTIL VendorLedgerEntryG.NEXT = 0;
                        end else begin
                            TotalAmountG += GenJournalLineG."Amount (LCY)";
                        end;
                        NWTHApplyWHTEntryG.Reset;
                        NWTHApplyWHTEntryG.SetCurrentKey("Entry No.");
                        NWTHApplyWHTEntryG.SetRange("Original Document No.", GenJournalLineG."Document No.");
                        NWTHApplyWHTEntryG.SetRange("Bill-to/Pay-to No.", GenJournalLineG."Account No.");
                        NWTHApplyWHTEntryG.SetFilter("WHT %", '<>%1', 0);
                        if NWTHApplyWHTEntryG.FindSet then
                            repeat
                                TotalWHTAmountG += NWTHApplyWHTEntryG.Amount;
                            until NWTHApplyWHTEntryG.Next = 0;
                    until GenJournalLineG.Next = 0;
                end;

                TotalAmtHdrG := TotalAmountG - TotalWHTAmountG;
                TotalAmountG := TotalAmountG - TotalWHTAmountG;

                //----- calculate amount exclude wht amount -----
                GenJournalLine2G.Reset;
                GenJournalLine2G.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");
                GenJournalLine2G.SetRange("Journal Template Name", "Journal Template Name");
                GenJournalLine2G.SetRange("Journal Batch Name", Name);
                TotalCreditTermsCountG := GenJournalLine2G.Count;
                ExtensionFileNameG := 'txt';
                FTL_Header(BankAccountG."Bank Account No.", TotalAmtHdrG, PostingDate, TotalCreditTermsCountG, ChargeofAC);
                OutStreamExportTextG.WriteText(ValueG);
                OutStreamExportTextG.WriteText;
                //-------------------- Write Header --------------------


            end;

        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        FileNameG := StrSubstNo('%1_%2.%3', "Gen. Journal Batch"."Ebanking Type", Format(CurrentDateTime, 0, '<Year4><Month,2><Day,2><Hours24><Minutes,2><Seconds,2>'), ExtensionFileNameG);
        InStreamExportTextG := TempBlob.CreateInStream();
        CopyStream(OutStreamExportTextG, InStreamExportTextG);
        DownloadFromStream(InStreamExportTextG, 'Save File to ...', '', 'All Files (*.*)|*.*', FileNameG);
    end;

    trigger OnPreReport()
    begin
        Clear(FileNameG);
        Clear(ExtensionFileNameG);
        OutStreamExportTextG := TempBlob.CreateOutStream(TextEncoding::Windows);
        CompanyInformationG.Get;
    end;

    var
        PurchInvLine: Record "Purch. Inv. Line";
        EmployeeRepG2: Record Employee;
        BankAccountRepG2: Record "Bank Account";
        VendorBankAccountG2: Record "Vendor Bank Account";
        EmployeeRepG: Record Employee;
        BankAccountRepG: Record "Bank Account";
        TempFileG: File;
        InStreamExportTextG: InStream;
        OutStreamExportTextG: OutStream;
        TempFileOutG: File;
        ValueG: Text;
        FileNameG: Text;
        ExtensionFileNameG: Text;
        CompanyInformationG: Record "Company Information";
        BankAccountG: Record "Bank Account";
        BankAccountNoG: Code[20];
        VendorBankAccountG: Record "Vendor Bank Account";
        VendorBankAccountNoG: Code[20];
        TaxFormG: Text;
        WHTProductPostingGroupG: Record "NWTH WHT Prod. Posting Group";
        VendorLedgerEntryG: Record "Vendor Ledger Entry";
        NWTHApplyWHTEntryG: Record "NWTH Apply WHT Entry";
        NWTHApplyWHTEntry2G: Record "NWTH Apply WHT Entry";
        NWTHApplyWHTEntry3G: Record "NWTH Apply WHT Entry";
        VATEntryG: Record "VAT Entry";
        WHTEntryG: Record "NWTH WHT Entry";
        BankAccountLedgerEntryG: Record "Bank Account Ledger Entry";
        AmountG: Decimal;
        WHTAmountG: Decimal;
        GenJournalLineG: Record "Gen. Journal Line";
        TotalAmountG: Decimal;
        TotalWHTAmountG: Decimal;
        I: Integer;
        WHTCountG: Integer;
        TotalCreditTermsCountG: Integer;
        GenJournalLine2G: Record "Gen. Journal Line";
        VendorG: Record Vendor;
        ChequePayeeG: Text;
        InvoiceAmountG: Text;
        ProcessingModeG: Text;
        WHTFormIdG: Text;
        WHTCertificaseNoG: Text;
        VendorAddressG: Text;
        TaxIdG: Text;
        CompanyTaxIdG: Text;
        PersonalIdG: Text;
        VendorBankAccountSMSG: Text;
        VendorBankAccountNameG: Text;
        VendorBankAccountFaxNoG: Text;
        VendorBankAccountEmailG: Text;
        VendorBankAccountPhone: Text;
        GNLDocumentNoG: Text;
        GNLDocumentNoFindPositionG: Integer;
        AmountBeforeVatG: Decimal;
        AmountAfterVatG: Decimal;
        InvoiceVatG: Decimal;
        InvoiceWhtG: Decimal;
        STSPaymentServiceTypeG: Text;
        PayeeNameG: Text;
        PayeeBankLocalClearingCodeG: Text;
        PayeeBranchCodeG: Text;
        PayeeACNoG: Text;
        STSWHTFormIdG: Text;
        VatAmountG: Decimal;
        WHTBaseG: Decimal;
        WHTTypeG: Text;
        WHTDescriptionG: Text;
        PayeeAddress1: Text;
        PayeeAddress2: Text;
        PayeeAddress3: Text;
        CheckNOG: Text;
        NetAmountG: Decimal;
        PostingDateG: Date;
        PaymentJournalCountG: Integer;
        GenJournalLine3G: Record "Gen. Journal Line";
        InvoiceExclVatG: Decimal;
        TotalInvoiceExclVatG: Decimal;
        TotalAmtHdrG: Decimal;
        SmartCLineAmtG: Decimal;
        PostingDate: Date;
        ChargeofAC: Text[1];
        TempBlob: codeunit "Temp Blob";

    local procedure FTL_Header(BankAccNo: Code[20]; TotalAmtDeductWHT: Decimal; PostingDate: Date; TotalLine: Integer; ChargeAc: Text[1])
    begin
        Clear(ValueG);
        ValueG := StrSubstNo('%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16',
        /*1*/       'H',
        /*2*/       'FTL',
        /*3*/       PadStr('', 16, ' '),
        /*4*/       '000000',
        /*5*/       PadStr('', 14, ' '),
        /*6*/       PadStr(DelChr(BankAccNo, '=', '-'), 10, ' '),
        /*7*/       ' ',
        /*8*/       PadStr('', 15 - StrLen(DelChr(Format(TotalAmtDeductWHT, 0, '<Precision,2:2><Standard Format,2>'), '=', '.')), '0') + DelChr(Format(TotalAmtDeductWHT, 0, '<Precision,2:2><Standard Format,2>'), '=', '.'),
        /*9*/       ' ',
        /*10*/      Format(Today, 0, '<Year><Month,2><Day,2>'),
        /*11*/      PadStr('', 25, ' '),
        /*12*/      PadStr(CompanyInformationG.Name, 50, ' '),
        /*13*/      Format(PostingDate, 0, '<Year><Month,2><Day,2>'),
        /*14*/      PadStr('', 18 - StrLen(Format(TotalLine)), '0') + Format(TotalLine),
        /*15*/      Format(ChargeAc),
        /*16*/      PadStr('', 5, ' '));
    end;

    local procedure FTL_Details(LineNo: Integer; PostingDate: Date; VendorBankAccNo: Code[20]; PVAmt: Decimal; VendorBankAccountNameG: Text[50]; VATWHTLineCnt: Decimal; DocNo: Code[16]; AdviceMode: Text[1]; FaxNo: Text[50]; Email: Text[50]; AmtBeforeVATWHT: Decimal; TotalVATWHT: Decimal; AmtAfterVATWHT: Decimal)
    begin
        Clear(ValueG);
        ValueG := StrSubstNo('%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20%21%22%23',
        /*1*/       'D',
        /*2*/       PadStr('', 6 - StrLen(Format(LineNo / 10000)), '0') + Format(LineNo / 10000),
        /*3*/       PadStr('', 14, ' '),
        /*4*/       PadStr(DelChr(VendorBankAccNo, '=', '-'), 10, ' '),
        /*5*/       ' ',
        /*6*/       PadStr('', 15 - StrLen(DelChr(Format(AmountG, 0, '<Precision,2:2><Standard Format,2>'), '=', '.')), '0') + DelChr(Format(AmountG, 0, '<Precision,2:2><Standard Format,2>'), '=', '.'),
        /*7*/       ' ',
        /*8*/       Format(Today, 0, '<Year><Month,2><Day,2>'),
        /*9*/       PadStr('', 25, ' '),
        /*10*/      PadStr(VendorBankAccountNameG, 50, ' '),
        /*11*/      Format(PostingDate, 0, '<Year><Month,2><Day,2>'),
        /*12*/      PadStr('', 3 - StrLen(Format(VATWHTLineCnt)), '0') + Format(VATWHTLineCnt),
        /*13*/      PadStr(Format(DocNo), 16, ' '),
        /*14*/      PadStr('', 50, ' '),
        /*15*/      AdviceMode,
        /*16*/      PadStr(FaxNo, 50, ' '),
        /*17*/      PadStr(Email, 50, ' '),
        /*18*/      PadStr('', 13 - StrLen(Format(AmtBeforeVATWHT, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(AmtBeforeVATWHT, 0, '<Precision,2:2><Standard Format,2>'),
        /*19*/      PadStr('', 13 - StrLen(Format(TotalVATWHT, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(TotalVATWHT, 0, '<Precision,2:2><Standard Format,2>'),
        /*20*/      PadStr('', 13 - StrLen(Format(AmtAfterVATWHT, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(AmtAfterVATWHT, 0, '<Precision,2:2><Standard Format,2>'),
        /*21*/      PadStr('', 10, ' '),
        /*22*/      PadStr(TaxIdG, 13, ' '),
        /*23-26*/   PadStr(VendorAddressG, 120, ' '));
    end;

    local procedure FTL_WHT()
    begin
        Clear(ValueG);
        ValueG := StrSubstNo('%1%2%3%4%5%6%7%8%9',
        /*1*/       'T',
        /*2*/       PadStr(TaxFormG, 2, ' '),
        /*3*/       PadStr(Format("NWTH Apply WHT Entry"."NWTH Ref. Line No."), 10, ' '),
        /*4*/       PadStr('', 6 - StrLen(Format("NWTH Apply WHT Entry"."WHT %", 0, '<Precision,2:2><Standard Format,2>')), '0') + Format("NWTH Apply WHT Entry"."WHT %", 0, '<Precision,2:2><Standard Format,2>'),
        /*5*/       PadStr("NWTH Apply WHT Entry"."WHT Prod. Posting Group", 40, ' '), //SPR MARK
        /*6*/       PadStr('', 13 - StrLen(Format("NWTH Apply WHT Entry".Base, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format("NWTH Apply WHT Entry".Base, 0, '<Precision,2:2><Standard Format,2>'),
        /*7*/       PadStr('', 13 - StrLen(Format("NWTH Apply WHT Entry".Amount, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format("NWTH Apply WHT Entry".Amount, 0, '<Precision,2:2><Standard Format,2>'),
        /*8*/       PadStr('', 13 - StrLen(Format(PurchInvLine."Amount Including VAT", 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(PurchInvLine."Amount Including VAT", 0, '<Precision,2:2><Standard Format,2>'),
        /*9*/       PadStr(CopyStr(Format("NWTH Apply WHT Entry"."NWTH WHT Term"), 2, 1), 1, ' '));
    end;

    local procedure FTL_MESSAGEINF()
    begin
        Clear(ValueG);
        ValueG := StrSubstNo('%1%2%3',
        /*1*/       'M',
        /*2*/       PadStr(VendorBankAccountPhone, 54, ' '),
        /*3*/       PadStr(Format(VendorBankAccountSMSG), 2, ' '));
    end;
}

