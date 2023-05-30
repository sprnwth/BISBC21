report 50030 "Customer Credit"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Customer Credit';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            CalcFields = "Original Amt. (LCY)", "Amount (LCY)";
            RequestFilterFields = "Posting Date", "Customer No.", "Salesperson Code";
            DataItemTableView = sorting("Posting Date") where("Document Type" = filter(Invoice | "Credit Memo"));
            column(CompName; CompanyinfoG."NWTH 2nd Name")
            {

            }
            column(RemainCredit; RemainCredit)
            {

            }
            column(ReportNameG; ReportNameG)
            {

            }
            column(PrintDatetext; PrintDatetext)
            {

            }
            column(Customer_No_; "Customer No.")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Salesperson_Code; SalespersonG.Name)
            {

            }
            column(Credit_Limit; CustomerG."Credit Limit (LCY)")
            {

            }
            column(Bal_Credit_Limit; CustomerG."Credit Limit (LCY)")
            {

            }
            column(InvoiceDate; "Posting Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(PaymentTermCodeG; PaymentTermCodeG)
            {

            }
            column(Due_Date; "Due Date")
            {

            }
            column(Original_Amount; "Original Amt. (LCY)")
            {

            }
            column(CmtText; CmtText)
            {

            }
            dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
            {
                DataItemLink = "Cust. Ledger Entry No." = field("Entry No.");
                DataItemTableView = sorting("Posting Date") where("Document Type" = filter(Payment | ''), "Entry Type" = filter(Application));
                column(Receive_Date; "Posting Date")
                {

                }
                column(Document_No_D; "Document No.")
                {

                }
                column(Payment_Method_Code_D; CustLedgerEntryG."Payment Method Code")
                {

                }
                column(CheckNoG_D; CheckNoG)
                {

                }
                column(CheckDateG_D; CheckDateG)
                {

                }
                column(Amount_D; "Amount (LCY)")
                {

                }
                column(Remaining_Amount; RemainingAmountG)
                {

                }
                column(BankChq; BankChqG)
                {

                }
                column(CheckAmount; CheckAmount)
                {

                }
                column(CheckStatusText; CheckStatusText)
                {

                }
                column(CheqDays; CheqDays)
                {

                }
                column(AgingDays; AgingDays)
                {

                }
                column(OverdueDays; OverdueDays)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Clear(CheckDateG);
                    Clear(CheckNoG);
                    Clear(BankChqG);
                    CheckStatusText := '';

                    RemainingAmountG -= Abs("Amount (LCY)");

                    CheckLederEntryG.Reset();
                    CheckLederEntryG.SetRange("Document No.", "Document No.");
                    CheckLederEntryG.setrange("Posting Date", "Posting Date");
                    if CheckLederEntryG.FindFirst() then begin
                        CheckLederEntryG.CalcFields("Check Status");
                        CheckStatusText := Format(CheckLederEntryG."Check Status");
                        CheckAmount := CheckLederEntryG.Amount;
                        BankChqG := CheckLederEntryG."Bank Account No.";
                        CheckNoG := CheckLederEntryG."Check No.";
                    end;

                    AgingDays := 0;
                    CheqDays := 0;
                    OverdueDays := 0;
                    if ("Posting Date" <> 0D) and ("Cust. Ledger Entry"."Posting Date" <> 0D) then
                        AgingDays := "Posting Date" - "Cust. Ledger Entry"."Posting Date";
                    if (CheckDateG <> 0D) and ("Cust. Ledger Entry"."Posting Date" <> 0D) then
                        CheqDays := CheckDateG - "Cust. Ledger Entry"."Posting Date";
                    if (EndingDate <> 0D) and ("Cust. Ledger Entry"."Due Date" <> 0D )then
                        OverdueDays := EndingDate - "Cust. Ledger Entry"."Due Date";
                end;

            }

            trigger OnAfterGetRecord()
            begin
                RemainCredit := 0;
                if CustomerG.get("Customer No.") then begin
                    RemainCredit := Customerg.CalcAvailableCredit();
                end;


                if SalespersonG.get("Salesperson Code") then;

                if "Document Type" = "Document Type"::Invoice then begin
                    if PostedSalesInvoiceHG.get("Document No.") then
                        PaymentTermCodeG := PostedSalesInvoiceHG."Payment Terms Code";
                end else begin
                    if PostedSalesCreditHG.get("Document No.") then
                        PaymentTermCodeG := PostedSalesCreditHG."Payment Terms Code";
                end;

                RemainingAmountG := "Original Amt. (LCY)";
                CmtText := '';
                SalesCommentLine.Reset();
                SalesCommentLine.setFilter("Document Type", '%1|%2', SalesCommentLine."Document Type"::"Posted Invoice"
                                                                , SalesCommentLine."Document Type"::"Posted Credit Memo");
                SalesCommentLine.setrange("No.", "Document No.");
                if SalesCommentLine.FindFirst() then begin
                    CmtText := SalesCommentLine.Comment;
                end;

            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/CustomerCredit.rdlc';
        }
    }
    trigger OnPreReport()
    var

    begin


        CompanyinfoG.get();

        Day := DATE2DMY(Today(), 1);
        Month := DATE2DMY(Today(), 2);
        Year := DATE2DMY(Today(), 3);

        case Month of
            1:
                Monthtext := 'มกราคม';
            2:
                Monthtext := 'กุมภาพันธ์';
            3:
                Monthtext := 'มีนาคม';
            4:
                Monthtext := 'เมษายน';
            5:
                Monthtext := 'พฤษภาคม';
            6:
                Monthtext := 'มิถุนายน';
            7:
                Monthtext := 'กรกฎาคม';
            8:
                Monthtext := 'สิงหาคม';
            9:
                Monthtext := 'กันยายน';
            10:
                Monthtext := 'ตุลาคม';
            11:
                Monthtext := 'พฤศจิกายน';
            12:
                Monthtext := 'ธันวาคม';
        end;

        PrintDatetext := Format(Day) + ' ' + Monthtext + ' ' + Format(Year);
        EndingDate := "Cust. Ledger Entry".GetRangeMax("Posting Date");
    end;

    var
        CustomerG: Record Customer;
        SalespersonG: Record "Salesperson/Purchaser";
        CompanyinfoG: Record "Company Information";
        CustLedgerEntryG: Record "Cust. Ledger Entry";
        PostedSalesInvoiceHG: Record "Sales Invoice Header";
        PostedSalesCreditHG: Record "Sales Cr.Memo Header";
        ReportNameG: Label 'รายงานการ์ดลูกหนี้';
        Day: Integer;
        Month: Integer;
        Year: Integer;
        Monthtext: text;
        PrintDatetext: text;
        PaymentTermCodeG: Text;
        CheckNoG: Text;
        CheckDateG: Date;
        RemainingAmountG: Decimal;
        BankChqG: Text;
        SumOriginalAmountG: Decimal;
        CheckLederEntryG: Record "Check Ledger Entry";
        SunCheckPrintG: Decimal;
        SunCheckReturnG: Decimal;
        CheckAmount: Decimal;
        CheckStatusText: Text;
        AgingDays: Integer;
        CheqDays: Integer;
        OverdueDays: Integer;
        RemainCredit: Decimal;
        EndingDate: Date;
        CmtText: Text;
        //SalesInvHdr: Record "Sales Invoice Header";
        //SalesCrHdr: Record "Sales Cr.Memo Header";
        SalesCommentLine: Record "Sales Comment Line";
}