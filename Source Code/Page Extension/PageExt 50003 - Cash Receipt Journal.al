pageextension 50010 CashReceiptJournalExt extends "Cash Receipt Journal"
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
        addafter("NWTH Cheque No.")
        {
            field("Bank Payment Type"; Rec."Bank Payment Type")
            {
                ApplicationArea = All;

            }
            field("Cheque Bank Name"; Rec."Cheque Bank Name")
            {
                ApplicationArea = All;
            }
            field("Cheque Branch Name"; Rec."Cheque Branch Name")
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