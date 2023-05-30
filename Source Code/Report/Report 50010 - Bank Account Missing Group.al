report 50010 BankAccountMissingGroup
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Report Bank Account Missing Group';

    dataset
    {
        dataitem(DataItemName; "Bank Account")
        {
            column(ItemNo; "No.")
            {

            }
            column(BankAccPostingGroup; "Bank Acc. Posting Group")
            {

            }

            trigger OnAfterGetRecord()

            begin
                if ("Bank Acc. Posting Group" <> '') then begin
                    if (GetBankAccPostingGroup.Get("Bank Acc. Posting Group")) then
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
            LayoutFile = './Source Code/ReportLayout/ReportBankAccountMissingGroup.rdl';
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;

    var
        GetVendor: Record Vendor;
        GetBankAccPostingGroup: Record "Bank Account Posting Group";
}