pageextension 50047 "Posted Transfer Shipment Ext" extends "Posted Transfer Shipment"
{
    actions
    {
        addlast(Reporting)
        {
            action("Transfer Out Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Caption = 'ใบโอนสินค้าออก';
                //Image = Report;

                trigger OnAction()
                var
                    PostedTransferShipmentL: Record "Transfer Shipment Header";
                begin
                    PostedTransferShipmentL.Reset();
                    PostedTransferShipmentL.SetRange("No.", Rec."No.");
                    if PostedTransferShipmentL.FindFirst() then;

                    Report.Run(Report::"Transfer Out Report", true, true, PostedTransferShipmentL);

                end;
            }
        }
    }
}