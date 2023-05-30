query 50013 WHReport
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

            filter(LocationCode; "Location Code")
            {
            }
            Filter(BinCode; "Bin Code")
            {
            }
            column(ItemNo; "Item No.")
            {
            }
            column(LotNo; "Lot No.")
            {
            }
            column(SerialNo; "Serial No.")
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
