report 50008 VendorsMissingGroup
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Report Vendors Missing Group';

    dataset
    {
        dataitem(DataItemName; Vendor)
        {
            column(ItemNo; "No.")
            {

            }
            column(VendorPostingGroup; "Vendor Posting Group")
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
                if ("Vendor Posting Group" <> '') and
                ("Gen. Bus. Posting Group" <> '') and
                ("VAT Bus. Posting Group" <> '') then begin
                    if (GetVendorPostingGroup.Get("Vendor Posting Group")) and
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
            LayoutFile = './Source Code/ReportLayout/ReportVendorsMissingGroup.rdl';
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;

    var
        myInt: Integer;
        GetVendor: Record Vendor;
        GetVendorPostingGroup: Record "Vendor Posting Group";
        GetGenBusPostingGroup: Record "Gen. Business Posting Group";
        GetVatBusPostingGroup: Record "VAT Business Posting Group";
}