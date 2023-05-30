query 50001 InvConsol
{
    QueryType = Normal;
 DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(Consolidate_Item_ledger_Entry; "Consolidate Item ledger Entry")
        {
            DataItemTableFilter = "Entry Type" = const(Sale);
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }
            column(Source_No_; "Source No.")
            {

            }
            dataitem(Consolidate_Value_Entry; "Consolidate Value Entry")
            {
                DataItemLink = "Item Ledger Entry No." = Consolidate_Item_ledger_Entry."Entry No.";
                
                column(Salespers__Purch__Code; "Salespers./Purch. Code")
                {

                }
                column(Sales_Amount__Actual_; "Sales Amount (Actual)")
                {
                    Method = sum;
                }
            }
        }
    }

    var
        myInt: Query CalcQtyOnBlockedITOnLNQuery;

    trigger OnBeforeOpen()
    begin

    end;
}