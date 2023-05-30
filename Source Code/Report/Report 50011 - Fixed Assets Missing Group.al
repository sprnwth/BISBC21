report 50011 FixedAssetsMissingGroup
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Report Fixed Assets Missing Group';

    dataset
    {
        dataitem(DataItemName; "Fixed Asset")
        {
            column(ItemNo; "No.")
            {

            }
            column(FaPostingGroup; "FA Posting Group")
            {

            }

            trigger OnAfterGetRecord()

            begin
                if ("FA Posting Group" <> '') then begin
                    if (GetFaPostingGroup.Get("FA Posting Group")) then
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
            LayoutFile = './Source Code/ReportLayout/ReportFixedAssetsMissingGroup.rdl';
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;

    var
        GetVendor: Record Vendor;
        GetFaPostingGroup: Record "FA Posting Group";
}