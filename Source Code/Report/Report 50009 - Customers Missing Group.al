report 50009 CustomersMissingGroup
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Report Customers Missing Group';

    dataset
    {
        dataitem(DataItemName; Customer)
        {
            column(ItemNo; "No.")
            {

            }
            column(CustomerPostingGroup; "Customer Posting Group")
            {

            }
            column(GenBusPostingGroup; "Gen. Bus. Posting Group")
            {

            }
            column(VatBusPostingGroup; "VAT Bus. Posting Group")
            {

            }

            trigger OnAfterGetRecord()

            begin
                if ("Customer Posting Group" <> '') and
                ("Gen. Bus. Posting Group" <> '') and
                ("VAT Bus. Posting Group" <> '') then begin
                    if (GetVendorPostingGroup.Get("Customer Posting Group")) and
                    (GetGenBusPostingGroup.get("Gen. Bus. Posting Group")) and
                    (GetVatBusPostingGroup.Get("VAT Bus. Posting Group")) then
                        CurrReport.Skip();
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
            LayoutFile = './Source Code/ReportLayout/ReportCustomersMissingGroup.rdl';
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;

    var
        GetVendor: Record Vendor;
        GetVendorPostingGroup: Record "Customer Posting Group";
        GetGenBusPostingGroup: Record "Gen. Business Posting Group";
        GetVatBusPostingGroup: Record "VAT Business Posting Group";
        GetCustomer: Record Customer;
}