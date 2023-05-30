pageextension 50030 "Vendor List" extends "Vendor List"
{
    layout
    {
        
        addafter("Name 2")
        {
            field("Vendor Chain Code"; Rec."Vendor Chain Code")
            {
                ApplicationArea = All;

            }
            field(Address; Rec.Address)
            {
                ApplicationArea = All;

            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;

            }
            field("NWTH Sub-District"; Rec."NWTH Sub-District")
            {
                ApplicationArea = All;

            }
            field("NWTH District"; Rec."NWTH District")
            {
                ApplicationArea = All;

            }
            field("NWTH Province"; Rec."NWTH Province")
            {
                ApplicationArea = All;

            }
            field("VAT Registration No.";Rec."VAT Registration No.")
            {
                ApplicationArea = All;
                
            }
         
        }

    }
}
