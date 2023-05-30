pageextension 50044 PageWarehouseShiplistExt extends "Warehouse Shipment List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Shipment")
        {
            // action(ShipDailyReport)
            // {
            //     ApplicationArea = All;
            //     Promoted = true;
            //     PromotedCategory = Report;
            //     PromotedIsBig = true;
            //     PromotedOnly = true;
            //     Caption = 'รายงานการจัดส่งสินค้าประจำวัน';

            //     trigger OnAction()
            //     var
            //         warehouseShip: Record "Warehouse Shipment Header";
            //     begin
            //         //  warehouseShip.Reset();
            //         //  warehouseShip.SetRange("No.", Rec."No.");
            //         Report.Run(Report::"BIS Shipping Daily Report");

            //     end;
            // }
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
    // myInt: Page "NWTH Purchase Order";
}