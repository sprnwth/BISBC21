pageextension 50013 "Sales Person BIS" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
            {
                ApplicationArea = All;
            }
        }
        addafter(General)
        {
            group(BIS)
            {
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
                field("Target Sales Monthly"; Rec."Target Sales Monthly")
                {
                    ApplicationArea = All;
                }
                field("Target Sales Yearly"; Rec."Target Sales Yearly")
                {
                    ApplicationArea = All;
                }
            }


        }
    }
}
