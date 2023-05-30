pageextension 50072 GLEntryBISExt extends "General Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Source Code")
        {
            field("Direct Customer No."; Rec."Direct Customer No.")
            {
                ApplicationArea = All;

            }
            field("Direct Vendor No."; Rec."Direct Vendor No.")
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