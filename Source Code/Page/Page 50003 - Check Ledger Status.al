page 50003 "Check Ledger Status"
{
    PageType = List;

    SourceTable = "Check Ledger Status";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;

                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = All;

                }
                field("Check Ledger Entry No."; Rec."Check Ledger Entry No.")
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}