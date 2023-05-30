pageextension 50073 GenJnlLineExt extends "General Journal"
{
    layout
    {
        // Add changes to page layout here
        addafter("Bal. Account No.")
        {
            field("NWTH Customer Direct Jnl"; Rec."NWTH Customer Direct Jnl")
            {
                ApplicationArea = All;

            }
            field("NWTH Vendor Direct Jnl"; Rec."NWTH Vendor Direct Jnl")
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