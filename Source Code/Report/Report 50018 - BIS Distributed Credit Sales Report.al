report 50018 "BIS Dist.Credit Sales Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'รายงานขายเชื่อแบบแจกแจง';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = sorting("Posting Date", "No.");
            RequestFilterFields = "Posting Date";
            column(SIV_No; "No.")
            {
            }
            column(SIV_Posting_Date; "Posting Date")
            {
            }
            column(SIV_Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {
            }
            column(SIV_Sell_to_Customer_Name; "Sell-to Customer Name")
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
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
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
                column(Unit_Price; "Unit Price")
                {
                }
                column(Type; Type)
                {
                }
                column(Line_Discount_Amount; "Line Discount Amount" + "Inv. Discount Amount")
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

                    End;                        // Message('%1   %2   %3', LineNo, "Document No.", Description);
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
            LayoutFile = './Source Code/ReportLayout/BIS Dist.Credit Sales.rdlc';
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
        StartDate := "Sales Invoice Header".GetRangeMin("Posting Date");
        EndDate := "Sales Invoice Header".GetRangeMax("Posting Date");
    end;

    var
        myInt: Integer;
        LineNo: Integer;
        LineTotal: Integer;
        StartDate: Date;
        EndDate: Date;
}