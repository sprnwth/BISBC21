pageextension 50049 "Item Category" extends "Item Categories"
{
    layout
    {
        addafter(Description)
        {
            field("ENG Description"; Rec."ENG Description")
            {
                ApplicationArea = All;

            }
        }
    }
}
