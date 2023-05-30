pageextension 50002 "Physical Inventory Ext" extends "Phys. Inventory Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter(CalculateInventory)
        {
            action("Calculate Inventory (By LOT)")
            {
                ApplicationArea = All;
                Image = LotInfo;
                trigger OnAction()
                var
                    CalInvByLot: Report "Calculate Inventory By Lot";
                begin
                    CalInvByLot.SetItemJnlLine(Rec);
                    CalInvByLot.RunModal();
                    clear(CalInvByLot);
                end;
            }
        }
    }

    var
        myInt: Integer;
}