pageextension 50107 VATEntryPreviewExt extends "VAT Entries Preview"
{
    layout
    {
        // Add changes to page layout here
        addafter(Amount)
        {
            field("Unrealized Amount";Rec."Unrealized Amount")
            {
                ApplicationArea = All;
                
                
            }
            field("Unrealized Base";Rec."Unrealized Base")
            {
                ApplicationArea = All;
                
            }
            field("Credit Base"; Rec."Credit Base")
            {
                ApplicationArea = All;

            }
            field("Original VAT Amount"; Rec."Original VAT Amount")
            {
                ApplicationArea = All;

            }
              field("NWTH Document Date"; Rec."NWTH Document Date")
            {
                Visible = false;
                ApplicationArea = All;
                
            }
            field("NWTH Vendor No."; Rec."NWTH Vendor No.")
            {
                Visible = false;
                ApplicationArea = All;
                
            }field("NWTH Vendor Invoice No."; Rec."NWTH Vendor Invoice No.")
            {
                Visible = false;
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