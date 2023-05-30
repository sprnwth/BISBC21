pageextension 50078 VATProdExt extends "VAT Product Posting Groups"
{
    layout
    {
        // Add changes to page layout here
        addafter(Code)
        {
            field("Default NON VAT Sale"; Rec."Default NON VAT Sale")
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