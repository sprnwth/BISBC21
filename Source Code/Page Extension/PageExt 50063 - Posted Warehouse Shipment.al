pageextension 50063 PostedWarehouseShipmentBIS extends "Posted Whse. Shipment List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Assigned User ID")
        {

        }
    }


    actions
    {
        addafter("&Shipment")
        {
            // action(Billoflading)
            // {
            //     ApplicationArea = All;
            //     Promoted = true;
            //     PromotedCategory = Report;
            //     PromotedIsBig = true;
            //     PromotedOnly = true;
            //     Caption = 'ใบจัดสินค้า';

            //     trigger OnAction()
            //     var
            //         warehouseShip: Record "Warehouse Shipment Header";
            //     begin
            //         warehouseShip.Reset();
            //         warehouseShip.SetRange("No.", Rec."No.");
            //         Report.Run(Report::"Warehouse Picking List", true, true, warehouseShip);

            //     end;

            action(ShipDailyReport)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Caption = 'รายงานการจัดส่งสินค้าประจำวัน';

                trigger OnAction()
                var
                    warehouseShip: Record "Posted Whse. Shipment Header";
                begin
                    // warehouseShip.Reset();
                    // warehouseShip.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Posted Shipping Daily Report");

                end;
            }


        }
    }

    var
        myInt: Integer;
}