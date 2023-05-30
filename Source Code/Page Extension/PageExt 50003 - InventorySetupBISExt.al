pageextension 50003 InventorySetupBISExt extends "Inventory Setup"
{
    layout
    {
        addafter("Item Nos.")
        {
            field("Register Item No.";Rec."Register Item Nos.")
            {
                ApplicationArea = All;
                
            }
        }
    }
}
