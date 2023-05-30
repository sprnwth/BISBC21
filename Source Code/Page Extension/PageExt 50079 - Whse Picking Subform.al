pageextension 50079 WhPickSubform extends "Whse. Pick Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Expiration Date")
        {
            field("Warranty Date"; Rec."Warranty Date")
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
        myInt: Report 7318;
}