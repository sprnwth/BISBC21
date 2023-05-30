report 50017 "BIS Dist.Credit Purch. Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'รายงานซื้อเชื่อแบบแจกแจง';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = sorting("Posting Date", "No.");
            RequestFilterFields = "Posting Date";
            column(SIV_No; "No.")
            {
            }
            //      column()
            column(SIV_Posting_Date; "Posting Date")
            {
            }
            column(SIV_Vendor_Invoice_No_; "Vendor Invoice No.")
            {
            }
            column(SIV_Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {
            }
            column(SIV_Sell_to_Customer_Name; "Purch. Inv. Header"."Buy-from Vendor Name")
            {
            }
            column(SIV_Currency_Code; "Currency Code")
            {
            }
            column(SIV_Amount; Amount)
            {
            }
            column(VatAmount; "Amount Including VAT" - Amount)
            {
            }
            column(SIV_Invoice_Discount_Amount; "Invoice Discount Amount")
            {
            }
            column(SIV_Amount_Including_VAT; "Amount Including VAT")
            {
            }
            column(LineNo; LineNo)
            {
            }
            column(LineTotal; LineTotal)
            {
            }
            column(StartDate; StartDate)
            {

            }
            column(EndDate; EndDate)
            {

            }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(SIVL_No_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Unit_Price; "Direct Unit Cost")
                {

                }
                column(Line_Discount_Amount; "Line Discount Amount" + "Inv. Discount Amount")
                {

                }
                column(Type; Type)
                {

                }
                column(Line_Amount; Amount)
                {
                }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                {

                }
                


                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    If "No." <> '' then begin
                        LineNo += 1;
                        LineTotal += 1;
                    End;
                end;

            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin

            end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(LineNo);
                CalcFields(Amount, "Amount Including VAT", "Invoice Discount Amount")

            end;



        }
    }

    requestpage
    {
        SaveValues = True;
        layout
        {

            area(Content)
            {

            }
        }


    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/BIS Dist.Credit Purch.rdlc';
        }
    }
    trigger OnInitReport()
    var
        myInt: Integer;
    begin

    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        StartDate := "Purch. Inv. Header".GetRangeMin("Posting Date");
        EndDate := "Purch. Inv. Header".GetRangeMax("Posting Date");
    end;

    var
        myInt: Integer;
        LineNo: Integer;
        LineTotal: Integer;
        StartDate: Date;
        EndDate: Date;
}