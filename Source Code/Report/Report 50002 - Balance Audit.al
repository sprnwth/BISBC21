report 50002 BalanceAudit
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset //19.5
    {
        // dataitem(Customer;Customer)
        // {
        //     RequestFilterFields = "No.";

        // }
        dataitem(Customer; Customer)
        {

            RequestFilterFields = "No.", "Balance (LCY)";

            column(Customer_Name; Name)
            {

            }
            column(Balance__LCY_; "Balance (LCY)")
            {

            }
            column(Totaltext; Totaltext)
            {

            }

            column(OverDueDatetext; OverDueDatetext)
            {

            }
            column(Email; CompanyInfo."E-Mail")
            {

            }
            column(PhoneNo; CompanyInfo."Phone No.")
            {

            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Totaltext := NaviworldCore.FormatNoTextVoucher("Balance (LCY)");
            end;




        }
    }


    requestpage
    {
        layout
        {
            area(Content)
            {

                group(Option)
                {
                    Caption = 'Options';
                    field(OverDueDate; OverDueDate) //Date Input
                    {
                    }
                }

            }
        }

        // var

        // actions
        // {
        //     area(processing)
        //     {
        //         action(ActionName)
        //         {
        //             ApplicationArea = All;

        //         }
        //     }
        // }
    }



    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './SourceCode/ReportLayout/ReportBalanceAudit.rdl';  //'./Report/Layout/ReportBalanceAudit.rdl';
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompanyInfo.get;

        //Process Convert date to th-format
        Day := DATE2DMY(OverDueDate, 1);
        Month := DATE2DMY(OverDueDate, 2);
        Year := DATE2DMY(OverDueDate, 3) + 543;

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

        OverDueDatetext := Format(Day) + ' ' + Monthtext + ' ' + Format(Year);
        //End Process Convert date to th-format

    end;

    var

        myInt: Integer;

        NaviworldCore: Codeunit "NWTH Localized Core";
        Totaltext: Text;

        CompanyInfo: Record "Company Information";

        //Convert date to th-format
        OverDueDate: Date;
        Day: Integer;
        Month: Integer;
        Year: Integer;
        Monthtext: text;
        OverDueDatetext: text;
}