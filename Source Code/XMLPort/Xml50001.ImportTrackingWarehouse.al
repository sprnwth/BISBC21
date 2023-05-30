xmlport 50001 "Import Tracking Warehouse"
{
    Caption = 'Import Tracking Warehouse';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(ReservationEntry; "Reservation Entry")
            {

                fieldelement(SourceID; ReservationEntry."Source ID")
                {
                }

                fieldelement(SourceRefNo; ReservationEntry."Source Ref. No.")
                {
                }
                fieldelement(ItemNo; ReservationEntry."Item No.")
                {
                }
                fieldelement(LocationCode; ReservationEntry."Location Code")
                {
                }
                fieldelement(Quantity; ReservationEntry.Quantity)
                {
                }
                fieldelement(Description; ReservationEntry.Description)
                {
                }

                fieldelement(ExpectedReceiptDate; ReservationEntry."Expected Receipt Date")
                {
                }
                fieldelement(LotNo; ReservationEntry."Lot No.")
                {
                }
                fieldelement(SerialNo; ReservationEntry."Serial No.")
                {
                }


                fieldelement(WarrantyDate; ReservationEntry."Warranty Date")
                {
                }
                fieldelement(ExpirationDate; ReservationEntry."Expiration Date")
                {
                }

                trigger OnAfterInsertRecord()

                begin
                    //Message('%1 ok2', ReservationEntry."Entry No.");
                end;

                trigger OnBeforeInsertRecord()
                var
                    Item: Record Item;
                    ItemTrackingCode: Record "Item Tracking Code";
                    WHL: Record "Warehouse Receipt Line";
                begin

                    //Message('%1 ok1', ReservationEntry."Entry No.");
                    Item.get(ReservationEntry."Item No.");
                    Item.TestField("Item Tracking Code");
                    ItemTrackingCode.get(Item."Item Tracking Code");
                    ReservationEntry."Source Type" := Database::"Purchase Line";
                    ReservationEntry."Source Subtype" := 1; //Purchase Order

                    ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Surplus;
                    ReservationEntry."Creation Date" := WorkDate();
                    ReservationEntry."Created By" := USERID;
                    ReservationEntry.Positive := true;
                    ReservationEntry."Qty. to Handle (Base)" := ReservationEntry.Quantity;
                    ReservationEntry."Qty. to Invoice (Base)" := ReservationEntry.Quantity;
                    ReservationEntry."Quantity (Base)" := ReservationEntry.Quantity;
                    ReservationEntry."Qty. per Unit of Measure" := 1;

                    if ItemTrackingCode."Lot Specific Tracking" then
                        ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Lot No.";
                    if ItemTrackingCode."SN Specific Tracking" then
                        ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Serial No.";
                    if ItemTrackingCode."Lot Specific Tracking" and ItemTrackingCode."SN Specific Tracking" then
                        ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Lot and Serial No.";
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
