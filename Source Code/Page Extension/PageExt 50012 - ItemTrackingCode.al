pageextension 50012 ItemTrackingCode extends "Item Tracking Codes"
{
    layout
    {
        addafter(Code)
        {
            field("Code for Registration"; Rec."Code for Registration")
            {
                ApplicationArea = All;
            }
        }
    }
}