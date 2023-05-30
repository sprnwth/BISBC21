pageextension 50051 WarehouseReceiptsBISExt extends "Warehouse Receipts"
{
    layout
    {
        addafter("No.")
        {
            field("Source No."; Rec."Source No.")
            {
                Caption = 'PO No.';
                ApplicationArea = All;
            }
        }
    }





    actions
    {
        addafter("&Receipt")
        {
            action("Import Lot/Serial Excel")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ImportLot: XmlPort "Import Tracking Warehouse";
                begin
                    ImportLot.Run();
                end;
            }
        }

    }
}
