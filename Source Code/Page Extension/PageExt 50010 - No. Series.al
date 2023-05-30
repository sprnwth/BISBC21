pageextension 50011 NoSeriesBISExt extends "No. Series"
{
    layout
    {
        // Add changes to page layout here
        addafter("NWTH Posting Nos.")
        {
            field("Draft Quote"; Rec."Draft Quote")
            {
                ApplicationArea = All;

            }
            field("Draft Order"; Rec."Draft Order")
            {
                ApplicationArea = All;

            }
            field("Confirm Quote"; Rec."Confirm Quote")
            {
                ApplicationArea = All;

            }
            field("Confirm Order"; Rec."Confirm Order")
            {
                ApplicationArea = All;
            }
            field("From Sales Shipment"; Rec."From Sales Shipment")
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