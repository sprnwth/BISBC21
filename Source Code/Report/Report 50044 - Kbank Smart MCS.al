report 50044 "Kbank Smart MCS"
{
    DefaultLayout = RDLC;
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
                    DataItemLink = "Original Document No." = FIELD("Document No."), "Bill-to/Pay-to No." = FIELD("Account No.");
                    DataItemTableView = SORTING("Entry No.") ORDER(Ascending) WHERE("WHT %" = FILTER(<> 0));

                    trigger OnAfterGetRecord()
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
                        Clear(WHTProductPostingGroupG);
                        if WHTProductPostingGroupG.Get("WHT Prod. Posting Group") then;

                        PurchInvLine.Reset();
                        PurchInvLine.SetRange("Document No.", "NWTH Apply WHT Entry"."NWTH Ref. Document No.");
                        PurchInvLine.SetRange("Line No.", "NWTH Apply WHT Entry"."NWTH Ref. Line No.");
                        If not PurchInvLine.FindFirst() then
                            If "NWTH Apply WHT Entry"."Include Vat Amount" then
                                PurchInvLine."Amount Including VAT" := "NWTH Apply WHT Entry".Base + ("NWTH Apply WHT Entry".Base * 7 / 100)
                            else
                                PurchInvLine."Amount Including VAT" := "NWTH Apply WHT Entry".Base;

                        //++Write
                        SmartCredit_WHT;
                        OutStreamExportTextG.WriteText(ValueG);
                        OutStreamExportTextG.WriteText;
                        //--Write
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
                    VendorLedgerEntryG.SetRange("Applies-to ID", "Gen. Journal Line"."Document No.");
                    VendorLedgerEntryG.SetRange("Buy-from Vendor No.", "Gen. Journal Line"."Account No.");
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
                                //TaxIdG := DELCHR(VendorG."ID No.",'=','-');
                                TaxIdG := DelChr(VendorG."VAT Registration No.", '=', '-');
                                //PersonalIdG := DELCHR(VendorG."ID No.",'=','-');
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
                        if StrLen(TaxIdG) > 10 then
                            TaxIdG := CopyStr(TaxIdG, 1, 10);

                        VendorAddressG := DelChr(StrSubstNo('%1 %2 %3 %4', VendorG.Address, VendorG."Address 2", VendorG.City, VendorG."Post Code"), '=', ',');
                        if StrLen(VendorAddressG) > 120 then
                            VendorAddressG := CopyStr(VendorAddressG, 1, 120);

                        if (WHTAmountG > 0) and (WHTBaseG > 0) then begin
                            PayeeAddress1 := VendorG.Address;
                            PayeeAddress2 := VendorG."Address 2";
                            PayeeAddress3 := VendorG.City + ' ' + VendorG."Post Code";
                        end;

                        //Get fax no. and e-mail no.
                        // if "Gen. Journal Line"."Advice Mode" = "Gen. Journal Line"."Advice Mode"::F then
                        //     VendorBankAccountFaxNoG := VendorG."Fax No."
                        // else
                        //     if "Gen. Journal Line"."Advice Mode" = "Gen. Journal Line"."Advice Mode"::E then
                        //         VendorBankAccountEmailG := VendorG."E-Mail";

                    end;


                    Clear(PaymentJournalCountG);
                    GenJournalLine3G.Reset;
                    GenJournalLine3G.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");
                    GenJournalLine3G.SetRange("Journal Template Name", "Journal Template Name");
                    GenJournalLine3G.SetRange("Journal Batch Name", "Journal Batch Name");
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
                    I += 1;
                    SmartCredit_Details(I, VendorBankAccountNameG, SmartCLineAmtG, VendorBankAccountNoG, "Document No.", CompanyTaxIdG);
                    OutStreamExportTextG.WriteText(ValueG);
                    OutStreamExportTextG.WriteText;
                    //-------------------- Write detail --------------------


                end;

                trigger OnPreDataItem()
                begin
                    I := 0;
                    Clear(TotalInvoiceExclVatG);
                end;
            }


            trigger OnAfterGetRecord()
            begin
                //++++++++++++++++++++ Write Header ++++++++++++++++++++

                //+++++ calculate amount exclude wht amount ++++
                //TestField("Ebanking Type", "Ebanking Type"::"Smart Credit");
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

                SmartCredit_Header(BankAccountG."Bank Account No.",
                                    PostingDate,
                                    TotalCreditTermsCountG,
                                    TotalAmtHdrG,
                                    ChargeofAC);

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
        VendorBankAccountFaxNoG: Text;
        VendorBankAccountEmailG: Text;
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
        VendorBankAccountSMSG: Text;
        VendorBankAccountNameG: Text;
        VendorBankAccountPhone: Text;
        EmployeeRepG2: Record Employee;
        BankAccountRepG2: Record "Bank Account";
        VendorBankAccountG2: Record "Vendor Bank Account";
        EmployeeRepG: Record Employee;
        BankAccountRepG: Record "Bank Account";

    local procedure SmartCredit_Header(BankAccNo: Code[20]; PostingDate: Date; LineCnt: Integer; TotalAmt: Decimal; ChargeAC: Text[1])
    begin
        Clear(ValueG);

        ValueG := StrSubstNo('%1%2%3%4%5%6%7%8%9',
        /*1*/       'H',
        /*2*/       'MCS',
        /*3*/       PadStr('', 10 - StrLen(DelChr(BankAccountG."Bank Account No.", '=', '-')), ' ') + DelChr(BankAccountG."Bank Account No.", '=', '-'),
        /*4*/       PadStr('', 16, ' '),
        /*5*/       PadStr(Format(PostingDate, 0, '<Day,2>-<Month,2>-<Year4>'), 10, ' '),
        /*6*/       PadStr('', 5, ' '),
        /*7*/       PadStr('', 18 - StrLen(Format(LineCnt)), '0') + Format(LineCnt),
        /*8*/       PadStr('', 18 - StrLen(Format(TotalAmt, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(TotalAmt, 0, '<Precision,2:2><Standard Format,2>'),
        /*9*/      Format(ChargeAC));

    end;

    local procedure SmartCredit_Details(SeqNo: Integer; VendorName: Text[100]; Amt: Decimal; BankAccNo: code[20]; DocNo: Code[20]; TaxID: Code[20])
    var
        SeqNoText: Text[5];
    begin
        SeqNoText := PadStr('', 5 - strlen(Format(SeqNo)), '0') + format(SeqNo);
        Clear(ValueG);
        ValueG := StrSubstNo('%1%2%3%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%19%20',
        /*1*/       'D',
        /*2*/       PadStr(SeqNoText, 10, ' '),
        /*3*/       PadStr('', 13 - StrLen(Format(Amt, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(Amt, 0, '<Precision,2:2><Standard Format,2>'),
        /*4*/       PadStr(VendorName, 80, ' '),
        /*5-8*/     PadStr(VendorAddressG, 120, ' '),
        /*9*/       PadStr('', 20 - strlen(BankAccNo), '0') + BankAccNo,
        /*10*/      PadStr(DocNo, 16, ' '),
        /*11*/      PadStr('', 13, ' '), //PersonalID
        /*12*/      PadStr(VendorBankAccountG."Branch Code.", 4, ' '),
        /*13*/      PadStr(VendorBankAccountG."Transit No.", 3, ' '),
        /*14*/      PadStr('', 255, ' '),
        /*15*/      PadStr(CompanyTaxIdG, 10, ' '), //Old 10 Change to 10 again
        /*16*/      PadStr('', 50, ' '),
        /*17*/      PadStr(Format("Gen. Journal Line"."Advice Mode"), 1, ' '),
        /*18*/      PadStr(VendorBankAccountFaxNoG, 50, ' '),
        /*19*/      PadStr(VendorBankAccountEmailG, 50, ' '),
        /*20*/      PadStr('', 13 - StrLen(Format(AmountBeforeVatG, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(AmountBeforeVatG, 0, '<Precision,2:2><Standard Format,2>'),
        /*21*/      PadStr('', 13 - StrLen(Format(WHTAmountG, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(WHTAmountG, 0, '<Precision,2:2><Standard Format,2>'),
        /*22*/      PadStr('', 13 - StrLen(Format(AmountAfterVatG, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(AmountAfterVatG, 0, '<Precision,2:2><Standard Format,2>'),
        /*23*/      PadStr('', 3 - StrLen(Format(WHTCountG)), '0') + Format(WHTCountG));

    end;

    local procedure SmartCredit_WHT()
    begin
        Clear(ValueG);
        ValueG := StrSubstNo('%1%2%3%4%5%6%7%8%9',
        /*1*/       'T',
        /*2*/       PadStr(TaxFormG, 2, ' '),
        /*3*/       PadStr("NWTH Apply WHT Entry"."WHT Report Line No", 10, ' '),
        /*4*/       PadStr('', 6 - StrLen(Format("NWTH Apply WHT Entry"."WHT %", 0, '<Precision,2:2><Standard Format,2>')), '0') + Format("NWTH Apply WHT Entry"."WHT %", 0, '<Precision,2:2><Standard Format,2>'),
        /*5*/       PadStr(WHTProductPostingGroupG.Description, 40, ' '),
        /*6*/       PadStr('', 13 - StrLen(Format("NWTH Apply WHT Entry".Base, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format("NWTH Apply WHT Entry".Base, 0, '<Precision,2:2><Standard Format,2>'),
        /*7*/       PadStr('', 13 - StrLen(Format("NWTH Apply WHT Entry".Amount, 0, '<Precision,2:2><Standard Format,2>')), '0') + Format("NWTH Apply WHT Entry".Amount, 0, '<Precision,2:2><Standard Format,2>'),
        /*8*/       PadStr('', 13 - StrLen(Format(PurchInvLine."Amount Including VAT", 0, '<Precision,2:2><Standard Format,2>')), '0') + Format(PurchInvLine."Amount Including VAT", 0, '<Precision,2:2><Standard Format,2>'),
        /*9*/       PadStr(CopyStr(Format("NWTH Apply WHT Entry"."NWTH WHT Term"), 2, 1), 1, ' '));

    end;

}

