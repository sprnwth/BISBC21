pageextension 50009 VendorBankAccBISExt extends "Vendor Bank Account Card"
{
    layout
    {
        addafter("Transit No.")
        {
            field("Bene.Ref"; Rec."Bene.Ref")
            {
                ApplicationArea = all;
                Editable = true;
                Importance = Promoted;
            }
            field("Branch Code."; Rec."Branch Code.")
            {
                ApplicationArea = all;
                Editable = true;
                Importance = Promoted;
            }
            field("SMS Language"; Rec."SMS Language")
            {
                ApplicationArea = all;
                Editable = true;
                Importance = Promoted;
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