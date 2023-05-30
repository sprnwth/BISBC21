pageextension 50025 "Item Unit of Measure" extends "Item Units of Measure"
{
    layout
    {
        addafter("Item No.")
        {
            field(Description;Rec.Description)
            {
                ApplicationArea = All;
                
            }

            field("Pack Size";Rec."Pack Size")
            {
                ApplicationArea = All;
                
            }
            field("Pack UOM";Rec."Pack UOM")
            {
                ApplicationArea = All;
                
            }
            field("Pack UOM Description";Rec."Pack UOM Description")
            {
                ApplicationArea = All;
                
            }
        }
    }
}
