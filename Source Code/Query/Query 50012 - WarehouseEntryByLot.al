query 50012 WarehouseEntryByLot
{

    Caption = 'WarehouseEntryByLot';
    QueryType = Normal;
 DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(WarehouseEntry; "Warehouse Entry")
        {
            filter(Registering_Date; "Registering Date")
            {

            }
            column(ItemNo; "Item No.")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(BinCode; "Bin Code")
            {
            }
            column(LotNo; "Lot No.")
            {
            }
            column(SerialNo; "Serial No.")
            {
            }
            column(Expiration_Date; "Expiration Date")
            {

            }
            column(Warranty_Date; "Warranty Date")
            {

            }
            column(Quantity; Quantity)
            {
                Method = Sum;
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
