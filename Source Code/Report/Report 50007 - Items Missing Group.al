report 50007 ItemsMissingGroup
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Report Items Missing Group';

    // RDLCLayout = './SourceCode/ReportLayout/ReportProductRegistration.rdl';

    dataset
    {
        dataitem(DataItemName; Item)
        {
            column(ItemNo; "No.")
            {

            }
            column(InventoryPostingGroup; "Inventory Posting Group")
            {

            }
            column(GenProdPostingGroup; "Gen. Prod. Posting Group")
            {

            }
            column(VatProdPostingGroup; "VAT Prod. Posting Group")
            {

            }

            trigger OnAfterGetRecord()

            begin
                if ("Inventory Posting Group" <> '') and
                ("Gen. Prod. Posting Group" <> '') and
                ("VAT Prod. Posting Group" <> '') then begin
                    if (GetInventoryPostingGroup.Get("Inventory Posting Group")) and
                    (GetGenProductPostingGroup.get("Gen. Prod. Posting Group")) and
                    (GetVatProductPostingGroup.Get("VAT Prod. Posting Group")) then
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
            LayoutFile = './Source Code/ReportLayout/ReportItemsMissingGroup.rdl';
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;

    var
        myInt: Integer;
        GetVatProductPostingGroup: Record "VAT Product Posting Group";
        GetGenProductPostingGroup: Record "Gen. Product Posting Group";
        GetInventoryPostingGroup: Record "Inventory Posting Group";
}