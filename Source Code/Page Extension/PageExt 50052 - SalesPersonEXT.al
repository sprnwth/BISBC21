pageextension 50052 SalesPersonEXT extends "Salespersons/Purchasers"
{
    layout
    {
        addafter("Phone No.")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code") // Sale Area
            {
                ApplicationArea = All;
            }
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
            }
            field("Employee Head"; Rec."Employee Head")
            {
                ApplicationArea = All;
            }
            field(Buddy; Rec.Buddy)
            {
                ApplicationArea = All;
            }
        }
    }
}
