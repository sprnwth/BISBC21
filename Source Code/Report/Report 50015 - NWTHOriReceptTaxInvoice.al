report 50015 "Report Ori.Recept.Tax Invoice"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/ReportLayout/NWTH OriginalReceiptTaxInvoice.rdlc';
    WordLayout = './Source Code/ReportLayout/NWTH OriginalReceiptTaxInvoice.docx';
    Caption = 'Receipt';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(TotalSection; "Integer")
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = FILTER(1 .. 2));
            column(Loop; Number)
            {

            }
            column(ReportCaption; ReportCaptionG)
            {
            }
            column(ReportCaptionGThai; ReportCaptionGThai)
            {
            }
            column(Number_TotalSection; TotalSection.Number)
            {
            }
            column(TotalAmtTxt; TotalAmountTxt)
            {
            }
            column(TotalSaleInvH_PostingDescp; '')
            {
            }
            column(TotalAmt; TotalAmt)
            {
            }
            column(TotalRemAmt; TotalRemAmt)
            {
            }
            column(TotalPaidAmt; TotalPaidAmt)
            {
            }

            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemTableView = SORTING("Document No.");

                RequestFilterFields = "Document No.";
                column(EntryNo_CustLedgerEntry; "Cust. Ledger Entry"."Entry No.")
                {
                }
                column(DocumentNo_CustLedgerEntry; "Cust. Ledger Entry"."Document No.")
                {
                }
                column(Cash; Cash)
                {
                }
                column(Transfer; Transfer)
                {
                }
                column(ByCheck; ByCheck)
                {
                }
                column(PostDateG; PostDateG)
                {
                }
                column(CheckNo; CheckNo)
                {
                }
                column(PostingDesc; PostingDesc)
                {

                }

                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No.");
                    //DataItemTableView = SORTING("Cust. Ledger Entry No.", "Posting Date") WHERE("Entry Type" = CONST(Application), "Document Type" = CONST(Payment));
                    DataItemTableView = SORTING("Cust. Ledger Entry No.", "Posting Date") WHERE("Entry Type" = CONST(Application));
                    column(EntryNo_DetailedCustLedgEntry; "Detailed Cust. Ledg. Entry"."Entry No.")
                    {
                    }
                    column(CustLedgerEntryNo_DetailedCustLedgEntry; "Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.")
                    {
                    }

                    dataitem(SalesInv; "Cust. Ledger Entry")
                    {
                        // DataItemLink = "Document No." = FIELD("Document No.");
                        DataItemTableView = SORTING("Document No.") ORDER(Ascending);

                        column(CompanyInfo_Pic; CompanyInformationG.Picture)
                        {
                        }

                        column(CompanyInfo_1; CompanyInfoG[1])
                        {
                        }
                        column(CompanyInfo_2; CompanyInfoG[2])
                        {
                        }
                        column(CompanyInfo_3; CompanyInfoG[3])
                        {
                        }
                        column(CompanyInfo_4; CompanyInfoG[4])
                        {
                        }
                        column(CompanyInfo_5; CompanyInfoG[5])
                        {
                        }
                        column(CompanyInfo_6; CompanyInfoG[6])
                        {
                        }
                        column(CompanyInfo_7; CompanyInfoG[7])
                        {
                        }
                        column(CompanyInfo_8; CompanyInfoG[8])
                        {
                        }
                        column(CompanyInfo_9; CompanyInfoG[9])
                        {

                        }
                        column(SaleInvH_CustomerNo; "Customer No.")
                        {
                        }
                        column(SaleInvH_CustomerName; CustomerNameG)
                        {
                        }
                        column(SaleInvH_CustomerAddr1; CustomerG.Address + ' ' + CustomerG."Address 2")
                        {
                        }
                        column(SaleInvH_CustomerAddr2; CustomerG.City + ' ' + CustomerG."Post Code")
                        {
                        }
                        column(Customer_VATNo; CustomerG."VAT Registration No.")
                        {
                        }
                        column(SaleInvH_No; "Document No.")
                        {
                        }
                        column(SaleInvH_DocDate; Format("Posting Date"))
                        {
                        }
                        column(SaleInvH_ExtDocNo; "External Document No.")
                        {
                        }
                        column(SaleInvH_PaymentTerm; PaymentG.Description)
                        {
                        }
                        column(SaleInvH_DueDate; Format("Due Date"))
                        {
                        }
                        column(SalePerson_Name; SalesPersonG.Name)
                        {
                        }
                        column(SaleInvH_ShipToName; customerg.Name)
                        {
                        }
                        column(SaleInvH_ShipToAddr1; customerG.Address + CustomerG."Address 2")
                        {
                        }
                        column(SaleInvH_ShipToAddr2; Customerg.City + ' ' + Customerg."Post Code")
                        {
                        }
                        column(SaleInvH_PostingDescp; '')
                        {
                        }
                        column(Amount_SalesInvoiceHeader; Amount)
                        {
                        }
                        column(AmountIncludingVAT_SalesInvoiceHeader; Amount)
                        {
                        }
                        column(PaidAmt; PaidAmt)
                        {
                        }
                        column(Currency_Code; CurrencyCode)
                        {

                        }
                        column(RemainingAmount; InvRemAmt)
                        {
                        }
                        column(BillNo; CustLedgerEntryInv."NWTH Billing No.")
                        {
                        }
                        column(InvP; InvP)
                        {
                        }
                        column(ReceiptTypeG; NWTHCashReceiptTypeG)
                        {

                        }

                        column(VAT7; VAT7)
                        {

                        }
                        column(VATAmount7; VATAmount7)
                        {

                        }
                        column(VATAmount0; VATAmount0)
                        {

                        }
                        column(CalBasevat0; CalBasevat0)
                        {

                        }
                        column(CalBasevat7; CalBasevat7)
                        {

                        }
                        column(calvat7; calvat7)
                        {

                        }
                        column(TextInvoice; TextInvoiceG)
                        {

                        }
                        column(BankName; BankNameG)
                        {
                        }
                        column(SumInv; SumInv)
                        {

                        }
                        column(CheckAccountL; CheckAccountL)
                        {

                        }
                        column(ChcekAccountDate; ChcekAccountDate)
                        {

                        }
                        column(VATPercentG; VATPercentG)
                        {

                        }
                        column(SumVatG; SumVatG)
                        {

                        }
                        column(UseSignature; UseSignature)
                        {
                        }
                        column(UseStamp; UseStamp)
                        {

                        }


                        trigger OnAfterGetRecord()
                        begin

                            if "Customer No." <> "Cust. Ledger Entry"."Customer No." then
                                CurrReport.Skip();

                            CalcFields(Amount, "Amount (LCY)");

                            CountryG.Reset();
                            CountryG.SetRange(Code, CompanyInformationG."Country/Region Code");
                            If CountryG.FindFirst() then
                                SalesPersonG.Reset();
                            CompanyInformationG.Get();
                            CompanyInformationG.CalcFields(Picture);
                            IF CompanyInformationG."NWTH Branch Code" <> '' then begin
                                CompanyInfoG[1] := CompanyInformationG.Name + '(Head Office)';
                                CompanyInfoG[2] := 'Address : ' + CompanyInformationG.Address + ' ' + CompanyInformationG."Address 2" + ' ' + CompanyInformationG.City + ' ' + CompanyInformationG."Post Code";
                                CompanyInfoG[3] := CompanyInformationG."VAT Registration No.";
                                if CompanyInformationG."Phone No." = '' then
                                    CompanyInfoG[4] := ''
                                else
                                    CompanyInfoG[4] := 'Tel: ' + CompanyInformationG."Phone No.";

                                if CompanyInformationG."Fax No." = '' then
                                    CompanyInfoG[5] := ''
                                else
                                    CompanyInfoG[5] := 'Fax: ' + CompanyInformationG."Fax No.";

                                CompanyInfoG[6] := CompanyInformationG."NWTH 2nd Name" + '(สำนักงานใหญ่) ';
                                CompanyInfoG[7] := 'ที่อยู่ : ' + CompanyInformationG."NWTH 2nd Address" + ' ' + CompanyInformationG."NWTH 2nd Address 2" + ' ' + CompanyInformationG."Post Code";
                                CompanyInfoG[8] := CompanyInformationG.Name;
                                CompanyInfoG[9] := CompanyInformationG."NWTH 2nd Name";
                                if ("NWTH Company Branch Code" <> '') and ("NWTH Company Branch Code" <> '00000') then
                                    if NWTHCompanyBranchInfoG.Get("NWTH Company Branch Code") then begin
                                        Clear(CompanyInfoG);
                                        CompanyInfoG[1] := NWTHCompanyBranchInfoG.Name + '(Branch ' + "NWTH Company Branch Code" + ')';
                                        CompanyInfoG[2] := 'Address : ' + NWTHCompanyBranchInfoG.Address + ' ' + NWTHCompanyBranchInfoG."Address 2" + ' ' + NWTHCompanyBranchInfoG.City + ' ' + NWTHCompanyBranchInfoG."Post Code";
                                        CompanyInfoG[3] := NWTHCompanyBranchInfoG."VAT Registration No.";
                                        CompanyInfoG[4] := NWTHCompanyBranchInfoG."Phone No.";
                                        CompanyInfoG[5] := NWTHCompanyBranchInfoG."Fax No.";
                                        CompanyInfoG[6] := NWTHCompanyBranchInfoG."NWTH 2nd Name" + '(สาขา ' + "NWTH Company Branch Code" + ')';
                                        CompanyInfoG[7] := 'ที่อยู่ : ' + NWTHCompanyBranchInfoG."NWTH 2nd Address" + ' ' + NWTHCompanyBranchInfoG."NWTH 2nd Address 2" + ' ' + NWTHCompanyBranchInfoG."Post Code";
                                        CompanyInfoG[8] := NWTHCompanyBranchInfoG.Name;
                                        CompanyInfoG[9] := NWTHCompanyBranchInfoG."NWTH 2nd Name";
                                    end;
                            End else begin
                                CompanyInfoG[1] := CompanyInformationG.Name;
                                CompanyInfoG[2] := 'Address : ' + CompanyInformationG.Address + ' ' + CompanyInformationG."Address 2" + ' ' + CompanyInformationG.City + ' ' + CompanyInformationG."Post Code";
                                CompanyInfoG[3] := CompanyInformationG."VAT Registration No.";
                                if CompanyInformationG."Phone No." = '' then
                                    CompanyInfoG[4] := ''
                                else
                                    CompanyInfoG[4] := 'Tel: ' + CompanyInformationG."Phone No.";

                                if CompanyInformationG."Fax No." = '' then
                                    CompanyInfoG[5] := ''
                                else
                                    CompanyInfoG[5] := 'Fax: ' + CompanyInformationG."Fax No.";

                                CompanyInfoG[6] := CompanyInformationG."NWTH 2nd Name";
                                CompanyInfoG[7] := 'ที่อยู่ : ' + CompanyInformationG."NWTH 2nd Address" + ' ' + CompanyInformationG."NWTH 2nd Address 2" + ' ' + CompanyInformationG."Post Code";
                                CompanyInfoG[8] := CompanyInformationG.Name;
                                CompanyInfoG[9] := CompanyInformationG."NWTH 2nd Name";
                                if ("NWTH Company Branch Code" <> '') and ("NWTH Company Branch Code" <> '00000') then
                                    if NWTHCompanyBranchInfoG.Get("NWTH Company Branch Code") then begin
                                        Clear(CompanyInfoG);
                                        CompanyInfoG[1] := NWTHCompanyBranchInfoG.Name;
                                        CompanyInfoG[2] := 'Address : ' + NWTHCompanyBranchInfoG.Address + ' ' + NWTHCompanyBranchInfoG."Address 2" + ' ' + NWTHCompanyBranchInfoG.City + ' ' + NWTHCompanyBranchInfoG."Post Code";
                                        CompanyInfoG[3] := NWTHCompanyBranchInfoG."VAT Registration No.";
                                        CompanyInfoG[4] := NWTHCompanyBranchInfoG."Phone No.";
                                        CompanyInfoG[5] := NWTHCompanyBranchInfoG."Fax No.";
                                        CompanyInfoG[6] := NWTHCompanyBranchInfoG."NWTH 2nd Name";
                                        CompanyInfoG[7] := 'ที่อยู่ : ' + NWTHCompanyBranchInfoG."NWTH 2nd Address" + ' ' + NWTHCompanyBranchInfoG."NWTH 2nd Address 2" + ' ' + NWTHCompanyBranchInfoG."Post Code";
                                        CompanyInfoG[8] := NWTHCompanyBranchInfoG.Name;
                                        CompanyInfoG[9] := NWTHCompanyBranchInfoG."NWTH 2nd Name";
                                    end;
                            end;


                            if CustomerG.Get("Customer No.") then;
                            //if PaymentG.Get("Payment Terms Code") then;
                            if SalesPersonG.Get("Salesperson Code") then;

                            //SSI
                            Clear(CustomerNameG);
                            CustomerNameG := CustomerG.Name + ' ' + CustomerG."Name 2";
                            if CustomerG."NWTH Branch Code" <> '' then
                                if CustomerG."NWTH Branch Code" = '00000' then
                                    CustomerNameG += '(สำนักงานใหญ่)'
                                else
                                    CustomerNameG += '(สาขา ' + CustomerG."NWTH Branch Code" + ')';


                            //SSI

                            PaidAmt := 0;
                            InvRemAmt := 0;
                            CustLedgerEntryInv.Reset();
                            CustLedgerEntryInv.SetRange("Document No.", "Document No.");
                            CustLedgerEntryInv.setfilter("Date Filter", '..%1', "Cust. Ledger Entry"."Posting Date");
                            if CustLedgerEntryInv.findfirst() then begin
                                CustLedgerEntryInv.CalcFields("Remaining Amt. (LCY)");
                                InvRemAmt := CustLedgerEntryInv."Remaining Amt. (LCY)";
                            end;
                            Clear(InvP);
                            InvP := -"Detailed Cust. Ledg. Entry".Amount;
                            TotalRemAmt += InvRemAmt;
                            TotalPaidAmt += Invp;
                            TotalAmt += Amount;
                            // AutoNo += 1;
                            // AmountL := "Amount (LCY)";
                            // SumInv += InvP;
                            // CalBasevat7 += (InvP * 7) / 107;

                            SaledInvoiceHDRG.Reset();
                            SaledInvoiceHDRG.SetRange("No.", "Document No.");
                            if SaledInvoiceHDRG.FindFirst() then begin
                                saleinvLine.Reset();
                                saleinvLine.SetRange("Document No.", SaledInvoiceHDRG."No.");
                                saleinvLine.SetFilter("No.", '<>%1', '');
                                if saleinvLine.FindFirst() then
                                    repeat
                                        //Clear(VAT7);
                                        if saleinvLine."VAT %" = 7 then begin
                                            VATAmount7 += saleinvLine."Amount Including VAT";
                                            VAT7 += (saleinvLine."Line Amount" * 7) / 100;
                                        end else
                                            VATAmount0 += saleinvLine."Line Amount";
                                        If SaledInvoiceHDRG."Prepayment Invoice" <> true then
                                            PostingDesc := saleinvLine.Description + '' + saleinvLine."Description 2"
                                        else
                                            PostingDesc := SaledInvoiceHDRG."Posting Description";  //SWA
                                                                                                    // Message(PostingDesc);
                                    until saleinvLine.Next() = 0;
                                // DescriptionSaleInv := saleinvLine.Description;  //SWA

                            end;

                            Clear(CalBasevat7);
                            Clear(SumInv);
                            DetailedCustLedgEntryL.Reset();
                            DetailedCustLedgEntryL.SetRange("Document No.", "Cust. Ledger Entry"."Document No.");
                            DetailedCustLedgEntryL.SetFilter("Entry Type", '<>Initial Entry');
                            DetailedCustLedgEntryL.SetFilter("Initial Document Type", '<>Payment');
                            if DetailedCustLedgEntryL.FindFirst() then
                                repeat
                                    if DetailedCustLedgEntryL."Initial Document Type" <> DetailedCustLedgEntryL."Initial Document Type"::" " then
                                        SumInv += -DetailedCustLedgEntryL.Amount
                                until DetailedCustLedgEntryL.Next() = 0;

                            VatEntryG.Reset();
                            VatEntryG.SetRange("Document No.", "Cust. Ledger Entry"."Document No.");
                            if VatEntryG.FindFirst() then
                                repeat
                                    if VatEntryG."Document Type" = VatEntryG."Document Type"::Payment then
                                        SumVatG += -VatEntryG.Amount
                                    else
                                        SumVatG += VatEntryG.Amount;
                                    VatSetup.Reset();
                                    VatSetup.SetRange("VAT Bus. Posting Group", VatEntryG."VAT Bus. Posting Group");
                                    VatSetup.SetRange("VAT Prod. Posting Group", VatEntryG."VAT Prod. Posting Group");
                                    if VatSetup.FindFirst() then
                                        VATPercentG := VatSetup."VAT %";
                                until VatEntryG.Next() = 0;
                            TotalAmountTxt := NWTHLocalizedCoreG.FormatNoTextVoucher(SumInv);
                            if SalesInv."Currency Code" = '' then begin
                                GenledgerSetup.get();
                                CurrencyCode := GenledgerSetup."LCY Code";
                            end
                            else
                                CurrencyCode := SalesInv."Currency Code";
                            CalBasevat7 := (SumInv * 7) / 107;
                            CheckLedgerL.Reset();
                            CheckLedgerL.SetRange("Document No.", "Cust. Ledger Entry"."Document No.");
                            if CheckLedgerL.FindFirst() then begin
                                CheckAccountL := CheckLedgerL."Check No.";
                                ChcekAccountDate := CheckLedgerL."Check Date";
                            end;
                            //Message('%1', SalesInv."Document No.");

                        end;


                        trigger OnPreDataItem()
                        begin
                            if DetailedCustLedgEntry."Document No." = '' then
                                CurrReport.Break();
                            SetRange("Document No.", DetailedCustLedgEntry."Document No.");
                            // AutoNo := 0;
                        end;
                    }
                    dataitem(SalesCrToInv; "Sales Cr.Memo Header")
                    {
                        DataItemTableView = SORTING("No.");
                        column(No_SalesCrToInv; SalesCrToInv."No.")
                        {
                        }
                        column(Amount_SalesCrToInv; SalesCrToInv.Amount)
                        {
                        }
                        column(AmountIncludingVAT_SalesCrToInv; -SalesCrToInv."Amount Including VAT")
                        {
                        }
                        column(DocumentDate_SalesCrToInv; Format(SalesCrToInv."Document Date"))
                        {
                        }
                        column(DueDate_SalesCrToInv; Format(SalesCrToInv."Due Date"))
                        {
                        }
                        column(RemainingAmountCrToInv; CustLedgerEntryInv."Remaining Amount")
                        {
                        }
                        column(CrAppP; CrAppP)
                        {
                        }
                        column(AppliestoDocNo_SalesCrToInv; SalesCrToInv."Applies-to Doc. No.")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            CalcFields(Amount, "Amount Including VAT");

                            PaidAmt := 0;
                            PaidAmt := "Amount Including VAT";
                            CrAppP := 0;
                            //CrAppP := -PaidAmt;


                            TotalAmt += -"Amount Including VAT";
                            TotalRemAmt += -CustLedgerEntryInv."Remaining Amount";
                            // AutoNo += 1;
                        end;

                        trigger OnPreDataItem()
                        begin
                            //SetRange("Applies-to Doc. No.", "Sales Invoice Header"."No.");
                            CurrReport.Break();
                        end;
                    }
                    dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
                    {
                        DataItemTableView = SORTING("No.");
                        column(No_SalesCrMemoHeader; "Sales Cr.Memo Header"."No.")
                        {
                        }
                        column(Amount_SalesCrMemoHeader; "Sales Cr.Memo Header".Amount)
                        {
                        }
                        column(AmountIncludingVAT_SalesCrMemoHeader; -"Sales Cr.Memo Header"."Amount Including VAT")
                        {
                        }
                        column(DocumentDate_SalesCrMemoHeader; Format("Sales Cr.Memo Header"."Document Date"))
                        {
                        }
                        column(DueDate_SalesCrMemoHeader; Format("Sales Cr.Memo Header"."Due Date"))
                        {
                        }
                        column(BillNoCr; CustLedgerEntryInv."NWTH Billing No.")
                        {
                        }
                        column(RemainingAmountCr; CustLedgerEntryInv."Remaining Amount")
                        {
                        }
                        column(PaidAmtCr; PaidAmt)
                        {
                        }
                        column(CrP; CrP)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            CalcFields(Amount, "Amount Including VAT");

                            CustLedgerEntryInv.Reset();
                            CustLedgerEntryInv.SetRange("Document No.", "No.");
                            if CustLedgerEntryInv.FindFirst() then
                                CustLedgerEntryInv.CalcFields("Remaining Amount")
                            else
                                CustLedgerEntryInv.Init();

                            PaidAmt := 0;
                            PaidAmt := -("Amount Including VAT" - CustLedgerEntryInv."Remaining Amount");
                            CrP := PaidAmt;
                            TotalPaidAmt += CrP;


                            TotalAmt += -"Amount Including VAT";
                            TotalRemAmt += -CustLedgerEntryInv."Remaining Amount";
                            // AutoNo += 1;


                        end;

                        trigger OnPreDataItem()
                        begin
                            CurrReport.Break();
                            if DetailedCustLedgEntry."Document No." = '' then
                                CurrReport.Break();
                            SetRange("No.", DetailedCustLedgEntry."Document No.");

                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        DetailedCustLedgEntry.Reset();
                        DetailedCustLedgEntry.SetRange("Cust. Ledger Entry No.", "Cust. Ledger Entry No.");
                        DetailedCustLedgEntry.SetRange("Entry Type", DetailedCustLedgEntry."Entry Type"::"Initial Entry");
                        DetailedCustLedgEntry.SetRange("Document Type", DetailedCustLedgEntry."Document Type"::Invoice, DetailedCustLedgEntry."Document Type"::"Credit Memo");
                        if not DetailedCustLedgEntry.FindFirst() then
                            CurrReport.Skip();
                    end;
                }
                trigger OnAfterGetRecord()
                begin
                    NWTHPostedJournalG.Reset();
                    NWTHPostedJournalG.SetCurrentKey("Document Type", "Source Code", "Document No.", "Posting Date");
                    NWTHPostedJournalG.SetRange("Document Type", "Cust. Ledger Entry"."Document Type");
                    NWTHPostedJournalG.SetRange("Document No.", "Cust. Ledger Entry"."Document No.");
                    if NWTHPostedJournalG.FindFirst() then
                        PostDateG := NWTHPostedJournalG."Posting Date";
                    CalcFields("Remaining Amount");

                    IF TempDocument = "Cust. Ledger Entry"."Document No." ThEN
                        CurrReport.Skip();

                    TempDocument := "Cust. Ledger Entry"."Document No.";
                end;
            }

            trigger OnAfterGetRecord()
            begin

                if TotalSection.Number > 1 then
                    if TextInvoiceG = TextInvoiceG::"Original Receipt" then begin
                        ReportCaptionG := 'Receipt(Copy)';
                        ReportCaptionGThai := 'สำเนาใบเสร็จรับเงิน'
                    end
                    else begin
                        ReportCaptionG := 'Receipt/Tax Invoice(Copy)';
                        ReportCaptionGThai := 'สำเนาใบเสร็จรับเงิน/ใบกำกับภาษี';
                    end;
                // UserVerify.Reset();
                // UserVerify.SetRange("User Security ID", "Sales Invoice Header".SystemModifiedBy);
                // If UserVerify.FindFirst() then;



                Clear(SumVatG);
                Clear(TempDocument);

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Option)
                {
                    field(TextInvoice; TextInvoiceG)
                    {
                        ToolTip = 'Report Type';
                        Caption = 'Report Type';
                        OptionCaption = 'Original Receipt,Original Receipt/Tax Invoice';
                        ApplicationArea = All;
                    }
                    field(UseSignature; UseSignature)
                    {
                        ApplicationArea = All;
                        Caption = 'Use Signature';
                    }
                    field(UseStamp; UseStamp)
                    {
                        ApplicationArea = All;
                        Caption = 'Use Company Stamp';
                    }
                    field(ReceiptTypeG; NWTHCashReceiptTypeG)
                    {
                        ToolTip = 'Payment By';
                        Caption = 'Payment By';
                        ApplicationArea = All;
                    }
                    field(BankName; BankNameG)
                    {
                        ToolTip = 'Bankname For Payment By Check';
                        Caption = 'Bankname For Payment By Check';
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if TextInvoiceG = TextInvoiceG::"Original Receipt" then begin
            ReportCaptionG := 'Original Receipt';
            ReportCaptionGThai := 'ต้นฉบับใบเสร็จรับเงิน';
        end;

        if TextInvoiceG = TextInvoiceG::"Original Receipt/Tax Invoice" then begin
            ReportCaptionG := 'Original Receipt/Tax Invoice';
            ReportCaptionGThai := 'ต้นฉบับใบเสร็จรับเงิน/ใบกำกับภาษี';
        end;


        // ReportCaptionG := ReportCaption1;
        // if ReportNameG = ReportNameG::"Copy Invoice" then
        //     ReportCaptionG := ReportCaption2;
        // MaxLineG := 32;
    end;

    trigger OnInitReport()
    var
    // myInt: Integer;
    begin

        UseSignature := true;
        UseStamp := true;
    end;


    var
        UseSignature: Boolean;
        UseStamp: Boolean;
        UserVerify: Record User;
        UserCreate: Record User;
        UsersetupAuthor: Record "User Setup";
        UsersetupVerify: Record "User Setup";
        UsersetupCreate: Record "User Setup";
        CompanyInformationG: Record "Company Information";
        NWTHCompanyBranchInfoG: Record "NWTH Company Branch";
        CustLedgerEntryInv: Record "Cust. Ledger Entry";
        VatEntryG: Record "VAT Entry";
        GenledgerSetup: Record "General Ledger Setup";
        VatSetup: Record "VAT Posting Setup";
        CustomerG: Record Customer;
        CheckLedgerL: Record "Check Ledger Entry";
        PaymentG: Record "Payment Terms";
        SalesPersonG: Record "Salesperson/Purchaser";
        CountryG: Record "Country/Region";
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        DetailedCustLedgEntryL: Record "Detailed Cust. Ledg. Entry";
        NWTHPostedJournalG: Record "NWTH Posted Journal";
        saleinvLine: Record "Sales Invoice Line";
        SaleCrMemoLine: Record "Sales Cr.Memo Line";
        SaledInvoiceHDRG: Record "Sales Invoice Header";
        NWTHLocalizedCoreG: Codeunit "NWTH Localized Core";
        CompanyInfoG: array[9] of Text; //PAR  array[6] of Text[250]
        TotalAmountTxt: Text;
        ReportCaptionG: Text;
        ReportCaptionGThai: Text;
        SumVatG: Decimal;
        TempDocument: Code[20];
        Cash: Text;
        Transfer: Text;
        ByCheck: Text;
        CheckNo: Text;
        CustomerNameG: Text;
        PostDateG: Date;
        PaidAmt: Decimal;
        TotalAmt: Decimal;
        VATPercentG: Decimal;
        CurrencyCode: Code[10];
        TotalRemAmt: Decimal;
        TotalPaidAmt: Decimal;
        InvP: Decimal;
        CrAppP: Decimal;
        CrP: Decimal;
        InvRemAmt: Decimal;

        DescriptionSaleInv: Text;
        DescriptionSaleCR: Text;
        NWTHCashReceiptTypeG: Enum "NWTH Cash Receipt Type";
        PostingDesc: Text;
        VAT7: Decimal;
        VATAmount7: Decimal;
        VATAmount0: Decimal;
        CalBasevat7: Decimal;
        CalBasevat0: Decimal;
        Calvat7: Decimal;
        TextInvoiceG: Option "Original Receipt","Original Receipt/Tax Invoice";
        SumInv: Decimal;
        CheckAccountL: Code[20];
        ChcekAccountDate: Date;
        BankNameG: Text[100];

}

