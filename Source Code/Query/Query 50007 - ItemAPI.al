query 50007 ItemAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    EntityName = 'bisItemAPI';
    EntitySetName = 'bisItemAPIs';
    QueryType = API;
 DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(item; Item)
        {
            filter(Location_Filter; "Location Filter")
            {

            }
            column(no; "No.")
            {
            }
            column(no2; "No. 2")
            {
            }
            column(description; Description)
            {
            }
            column(description2; "Description 2")
            {
            }
            column(baseUnitOfMeasure; "Base Unit of Measure")
            {
            }
            column(baseuomdescription; "Base UOM Description")
            {

            }
            column(purchUnitofMeasure; "Purch. Unit of Measure")
            {

            }
            column(purchuomdescription; "Purch. UOM Description")
            {

            }
            column(salesUnitofMeasure; "Sales Unit of Measure")
            {
            }
            column(saleuomdescription; "Sale UOM Description")
            {

            }
            column(inventory; Inventory)
            {
            }
            column(subgroup1; "Sub Group 1")
            {

            }
            column(subgroup1desc;"SubGroup1 Desc.")
            {
                
            }
            column(subgroup2; "Item Category Code")
            {

            }
            column(subgroup2desc;"SubGroup2 Desc.")
            {
                
            }
            column(priceincludesvat;"Price Includes VAT")
            {
                
            }
            column(unitcost;"Unit Cost")
            {
                
            }
            column(inventory_postinggroup;"Inventory Posting Group")
            {
                
            }
            column(genprod_postinggorup;"Gen. Prod. Posting Group")
            {
                
            }
            column(vatprod_Postinggroup;"VAT Prod. Posting Group")
            {
                
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
