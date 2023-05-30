report 50016 "Report Ori.Recept.Non Apply"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/ReportLayout/NWTH Ori.Recept.Non Apply.rdl';
    Caption = 'Receipt';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(TotalSection; "Integer")
        {
            DataItemTableView = sorting(Number) order(ascending) where(Number = filter(1));
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
            // column(TotalAmtTxt; TotalAmountTxt)
            // {
            // }
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
            // dataitem("NWTH Posted Journal"; "NWTH Posted Journal")
            // {

            //     DataItemTableView = SORTING("Document No.");
            //     RequestFilterFields = "Document No.";
            //dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemTableView = sorting("Document No.", "Posting Date") where("Credit Amount" = filter(<> 0));

                //DataItemLink = "Document No." = FIELD("Document No.");
                RequestFilterFields = "Document No.";
                column(Document_No_; "Document No.")
                {

                }
                // column(ReportCaption; ReportCaptionG)
                // {

                // }
                column(Posting_Date; "Posting Date")
                {

                }
                column(Description; Description)
                {

                }
                column(Credit_Amount__LCY_; Amount)
                {

                }
                column(SumAmountL; SumAmountL)
                {

                }
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
                column(SaleInvH_CustomerNo; CustomerG."No.")
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
                column(SaleInvH_DocDate; Format("Posting Date"))
                {
                }
                column(SaleInvH_ExtDocNo; "External Document No.")
                {
                }
                column(SaleInvH_PaymentTerm; PaymentG.Description)
                {
                }
                column(SaleInvH_DueDate; Format("Posting Date"))
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
                column(Amount_SalesInvoiceHeader; ("Credit Amount"))
                {
                }
                column(AmountIncludingVAT_SalesInvoiceHeader; "Credit Amount")
                {
                }
                column(PaidAmt; PaidAmt)
                {
                }
                column(RemainingAmount; InvRemAmt)
                {
                }
                column(BillNo; CustLedgerEntryInv."NWTH Billing No.")
                {
                }
                column(ReceiptTypeG; CashReceiptTypeG)
                {
                }
                column(TotalAmtTxt; TotalAmountTxt)
                {
                }
                column(CheckAccountL; CheckAccountL)
                {

                }
                column(ChcekAccountDate; ChcekAccountDate)
                {

                }
                column(BankName; BankNameG)
                {

                }
                column(CalBasevat7; CalBasevat7)
                {

                }
                column(Currency_Code; CurrencyCode)
                {

                }
                column(TextInvoice; TextInvoiceG)
                {

                }
                column(UseSignature; UseSignature)
                {

                }
                column(UseStamp; UseStamp)
                {

                }



                trigger OnAfterGetRecord()
                var

                begin
                    CountryG.Reset();
                    CountryG.SetRange(Code, CompanyInformationG."Country/Region Code");
                    // If CountryG.FindFirst() then begin
                    // end;
                    SalesPersonG.Reset();
                    CompanyInformationG.Get();
                    CompanyInformationG.CalcFields(Picture);
                    CompanyInfoG[1] := CompanyInformationG.Name + ' (HEAD OFFICE)';
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


                    if CustomerG.Get("Direct Customer No.") then;
                    //if PaymentG.Get("Payment Terms Code") then;
                    //if SalesPersonG.Get("Salesperson Code") then;

                    //SSI
                    Clear(CustomerNameG);
                    CustomerNameG := CustomerG.Name + ' ' + CustomerG."Name 2";
                    if (CustomerG."NWTH Branch Code" = '00000') or (CustomerG."NWTH Branch Code" = '') then
                        CustomerNameG += ' (สำนักงานใหญ่)'
                    else
                        CustomerNameG += '(สาขา ' + CustomerG."NWTH Branch Code" + ')';
                    //{ PAR  
                    //AmountL := "Cust. Ledger Entry".Amount;
                    //SumAmountL += "Cust. Ledger Entry".Amount * -1;
                    TotalAmt += "Credit Amount";
                    TotalAmountTxt := NWTHLocalizedCoreG.FormatNoTextVoucher(TotalAmt);
                    // if "Cust. Ledger Entry"."Currency Code" = '' then begin
                    GenledgerSetup.get();
                    CurrencyCode := GenledgerSetup."LCY Code";
                    // end
                    // else
                    //     CurrencyCode := "Cust. Ledger Entry"."Currency Code";

                    CheckLedgerL.Reset();
                    CheckLedgerL.SetRange("Document No.", "Document No.");
                    if CheckLedgerL.FindFirst() then begin
                        CheckAccountL := CheckLedgerL."Check No.";
                        ChcekAccountDate := CheckLedgerL."Check Date";
                    end;
                    Clear(CalBasevat7);
                    CalBasevat7 := (TotalAmt * 7) / 107;
                    //} PAR     
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
                    Caption = 'Option';
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
                    field(ReceiptTypeG; CashReceiptTypeG)
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
        CompanyInformationG: Record "Company Information";
        NWTHCompanyBranchInfoG: Record "NWTH Company Branch";
        CustomerG: Record Customer;
        PaymentG: Record "Payment Terms";
        SalesPersonG: Record "Salesperson/Purchaser";
        CountryG: Record "Country/Region";
        GenledgerSetup: Record "General Ledger Setup";
        CustLedgerEntryInv: Record "Cust. Ledger Entry";
        CheckLedgerL: Record "Check Ledger Entry";
        NWTHLocalizedCoreG: Codeunit "NWTH Localized Core";
        CompanyInfoG: array[9] of Text; //PAR  array[6] of Text[250]
        TotalAmountTxt: Text;
        ReportCaptionG: Text[250];
        ReportCaptionGThai: Text[250];
        // CaptionG: Text[200];
        CurrencyCode: Code[10];
        CustomerNameG: Text;
        SumAmountL: Decimal;
        PaidAmt: Decimal;
        TotalAmt: Decimal;
        TotalRemAmt: Decimal;
        TotalPaidAmt: Decimal;
        InvRemAmt: Decimal;
        CashReceiptTypeG: Enum "NWTH Cash Receipt Type";
        CalBasevat7: Decimal;
        TextInvoiceG: Option "Original Receipt","Original Receipt/Tax Invoice";
        CheckAccountL: Code[20];
        ChcekAccountDate: Date;
        BankNameG: Text[100];
}