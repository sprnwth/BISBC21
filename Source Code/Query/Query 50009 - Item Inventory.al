query 50009 "Item By Lot No"
{
    QueryType = API;
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    EntityName = 'bisiteminventory';
    EntitySetName = 'bisiteminventories';
 DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            DataItemTableFilter = Open = const(true);
            column(Item_No; "Item No.")
            { }
            column(Location_Code; "Location Code")
            { }
            column(Lot_No; "Lot No.")
            { }
            column(Serial_No_; "Serial No.")
            {

            }
            column(Expiration_Date; "Expiration Date")
            { }
            column(Remaining_Quantity_Sum; "Remaining Quantity")
            {
                ColumnFilter = Remaining_Quantity_Sum = filter(<> 0);
                Method = Sum;
            }
            column(reservedqty; "Reserved Quantity")
            {
                Method = SUM;
            }
            dataitem(Location; Location)
            {
                DataItemLink = Code = ItemLedgerEntry."Location Code";
                column(locationName; Name)
                {

                }
            }
        }
    }
}