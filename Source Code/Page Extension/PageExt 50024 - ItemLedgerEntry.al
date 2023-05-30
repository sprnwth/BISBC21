pageextension 50024 "Item Ledger Entry" extends "Item Ledger Entries"
{
    layout
    {
        modify("Expiration Date")
        {
            Visible = true;
        }
        modify("Lot No.")
        {
            Visible = true;
        }
        modify("Serial No.")
        {
            Visible = true;
        }
        addafter("Completely Invoiced")
        {
            field("Warranty Date";Rec."Warranty Date")
            {
                ApplicationArea = All;
                
            }
            field("Ref. Order No."; Rec."Ref. Order No.")
            {
                ApplicationArea = All;

            }
            field("Ref. Order Line No."; Rec."Ref. Order Line No.")
            {
                ApplicationArea = All;

            }
        }
    }
}
