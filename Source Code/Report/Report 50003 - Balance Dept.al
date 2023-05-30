report 50003 BalanceDept
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No."; //, "Salesperson Code";
            column(Customer_Name; Name)
            {

            }
            column(Balance; "Balance (LCY)")
            {

            }
            column(Totaltext; Totaltext)
            {

            }
            column(CompanyName; CompanyInfo."NWTH 2nd Name")
            {

            }
            column(Email; CompanyInfo."E-Mail")
            {

            }
            column(PhoneNo; CompanyInfo."Phone No.")
            {

            }
            column(Datetext; Datetext)
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
                // group(GroupName)
                // {
                //     field(Name; SourceExpression)
                //     {
                //         ApplicationArea = All;

                //     }
                // }
            }
        }

        actions
        {
            area(processing)
            {
                // action(ActionName)
                // {
                //     ApplicationArea = All;

                // }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './SourceCode/ReportLayout/ReportBalanceDept.rdl';  //'./Report/Layout/ReportBalanceDept.rdl';
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompanyInfo.get;


        //Process Convert date to th-format
        Day := DATE2DMY(Today, 1);
        Month := DATE2DMY(Today, 2);
        Year := DATE2DMY(Today, 3) + 543;

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

        Datetext := 'วันที่ ' + Format(Day) + ' ' + Monthtext + ' ' + Format(Year);
        //End Process Convert date to th-format
    end;

    var
        myInt: Integer;

        NaviworldCore: Codeunit "NWTH Localized Core";
        Totaltext: Text;

        CompanyInfo: Record "Company Information";
        //SalesPersonInfo: Record "Salesperson/Purchaser";

        Day: Integer;
        Month: Integer;
        Year: Integer;
        Monthtext: text;
        Datetext: text;
}