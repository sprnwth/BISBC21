pageextension 50007 EmployeeLedgerEntryBISExt extends "Employee Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Document No.")
        {
            field("Document Date"; Rec."Document Date")
            {
                ApplicationArea = All;

            }
            field("Due Date"; Rec."Due Date")
            {
                ApplicationArea = All;

            }
        }
        addafter(Description)
        {
            field("Payment Term Code"; Rec."Payment Term Code")
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}