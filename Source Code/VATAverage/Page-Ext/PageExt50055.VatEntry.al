pageextension 50106 VATEntryExt extends "VAT Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
        {
            field("Credit Base";Rec."Credit Base")
            {
                ApplicationArea = All;
                
            }
            field("Original VAT Amount";Rec."Original VAT Amount")
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