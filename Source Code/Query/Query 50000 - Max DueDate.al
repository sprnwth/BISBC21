query 50000 "Cust. Ledger Max Due Date"
{
    Caption = 'Cust. Ledg. Entry Max Due Date';
    DataAccessIntent = ReadOnly;
    OrderBy = descending(MaxDue_Date);
    TopNumberOfRows = 1;

    elements
    {

        dataitem(Cust_Ledger_Entry; "Cust. Ledger Entry")
        {

            filter(Document_Type; "Document Type")
            {
            }
            filter(Open; Open)
            {
            }
            filter(Due_Date; "Due Date")
            {
            }
            filter(Customer_No; "Customer No.")
            {
            }
            filter(Customer_Posting_Group; "Customer Posting Group")
            {
            }
            filter(Date_Filter; "Date Filter")
            {
            }
            column(MaxDue_Date; "Due Date")
            {

            }
        }
    }
    var
    Q : Codeunit "Notification Entry Dispatcher";
}

