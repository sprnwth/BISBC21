pageextension 50040 WarehouseReceiptBISExt extends "Warehouse Receipt"
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
            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
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

    var
        myInt: Integer;
}