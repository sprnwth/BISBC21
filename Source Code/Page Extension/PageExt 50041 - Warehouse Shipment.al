pageextension 50041 WarehouseShipmentBISExt extends "Warehouse Shipment"
{
    layout
    {
        // Add changes to page layout here
        addafter("Assigned User ID")
        {
            field("No. Series"; Rec."No. Series")
            {
                ApplicationArea = All;

            }
            field("Shipping No. Series"; Rec."Shipping No. Series")
            {
                ApplicationArea = All;

            }
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = All;

            }
        }
    }


    actions
    {
        addafter("&Print")
        {
            action(Billoflading)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Caption = 'ใบจัดสินค้า';

                trigger OnAction()
                var
                    warehouseShip: Record "Warehouse Shipment Header";
                begin
                    warehouseShip.Reset();
                    warehouseShip.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Warehouse Picking List", true, true, warehouseShip);

                end;
            }


        }
    }

    var
        myInt: Integer;
}