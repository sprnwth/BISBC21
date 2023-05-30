query 50002 CustomerLedgerEntryAPI
{
    QueryType = API;
    APIPublisher = 'nwth';
    APIGroup = 'bis';
    APIVersion = 'v2.0';
    EntityName = 'biscustomerledgerentry';
    EntitySetName = 'biscustomerledgerentries';
     DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
        {

            column(Customer_No_; "Customer No.")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Due_Date; "Due Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }         
            column(Original_Amt___LCY_; "Original Amt. (LCY)")
            {

            }
            column(Remaining_Amt___LCY_; "Remaining Amt. (LCY)")
            {

            }
            dataitem(Sales_Invoice_Header;"Sales Invoice Header")
            {
                DataItemLink = "No." = Cust__Ledger_Entry."Document No.";
                column(Payment_Terms_Code;"Payment Terms Code")
                {
                    
                }
            }

        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}