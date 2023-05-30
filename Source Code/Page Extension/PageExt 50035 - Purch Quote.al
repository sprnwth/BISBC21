pageextension 50035 PurchQuoteBISExt extends "Purchase Quote"
{
    layout
    {
        // Add changes to page layout here
        addafter("Vendor Order No.")
        {
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;

            }
            field("Posting No. Series"; Rec."Posting No. Series")
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