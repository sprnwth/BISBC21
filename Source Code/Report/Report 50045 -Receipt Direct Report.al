report 50045 "Recept. Direct Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/ReportLayout/ReceiptDirect.rdl';
    //WordLayout = './Source Code/ReportLayout/NWTH OriginalReceiptTaxInvoice.docx';
    Caption = 'Receipt (Direct)';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("NWTH Posted Journal"; "NWTH Posted Journal")
        {
            DataItemTableView = SORTING("Document Type", "Source Code", "Document No.", "Posting Date");
            column(Document_No_; "Document No.")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }


            column(ReportCaption; ReportCaptionG)
            {
            }
            column(ReportCaptionGThai; ReportCaptionGThai)
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
            column(SaleInvH_CustomerNo; Customer."No.")
            {
            }
            column(SaleInvH_CustomerName; Customer.Name)
            {
            }
            column(SaleInvH_CustomerAddr1; Customer.Address + ' ' + Customer."Address 2")
            {
            }
            column(SaleInvH_CustomerAddr2; Customer.City + ' ' + Customer."Post Code")
            {
            }
            column(Customer_VATNo; Customer."VAT Registration No.")
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                column(Description; Description)
                {

                }
                // column(Document_No_; "Document No.")
                // {

                // }
                column(Credit_Amount; "Credit Amount")
                {

                }
            }

            trigger OnAfterGetRecord()

            begin
                GLEntry.Reset();
                GLEntry.setrange("Document No.", "Document No.");
                if GLEntry.FindSet() then
                    repeat
                        if Not Customer.get(GLEntry."Direct Customer No.") then
                            Customer.Init();

                    until GLEntry.Next() = 0;

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


    end;

    trigger OnInitReport()

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
        Customer: Record Customer;
        GLEntry: Record "G/L Entry";

}

