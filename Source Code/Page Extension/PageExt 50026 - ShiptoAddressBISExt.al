pageextension 50026 "Ship-to AddressBISExtList" extends "Ship-to Address List"
{
    layout
    {
        addafter("Address 2")
        {
            field(Thambon; Rec.Thambon)
            {
                ApplicationArea = All;

            }
            field(Amphur; Rec.Amphur)
            {
                ApplicationArea = All;

            }
            field("Receive Good Condition"; Rec."Receive Good Condition")
            {
                ApplicationArea = All;
            }

            field("Default Code"; Rec."Default Code")
            {
                ApplicationArea = All;
            }

        }
    }
}
