pageextension 50048 "Transfer Order Ext" extends "Transfer Order"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = All;
            }
        }
    }
}