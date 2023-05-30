query 50005 SalesInvAPI
{
    QueryType = API;
    APIPublisher = 'nwth';
    APIGroup = 'bis';
    APIVersion = 'v2.0';
    EntityName = 'bissalesinvoice';
    EntitySetName = 'bissalesinvoices';
 DataAccessIntent = ReadOnly;
    elements
    {

        dataitem(Sales_Invoice_Header; "Sales Invoice Header")
        {
            column(invno; "No.")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
            {

            }
            column(Invoice_Discount_Amount; "Invoice Discount Amount")
            {

            }
            column(Amount; Amount)
            {

            }
            column(Amount_Including_VAT; "Amount Including VAT")
            {

            }
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(Ship_to_Name; "Ship-to Name")
            {

            }
            column(Ship_to_Address; "Ship-to Address")
            {

            }
            column(Ship_to_City; "Ship-to City")
            {

            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {

            }
            column(Sell_to_Phone_No_; "Sell-to Phone No.")
            {

            }



            dataitem(Sales_Invoice_Line; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = Sales_Invoice_Header."No.";

                column(itemno; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Line_Discount_Amount; "Line Discount Amount")
                {

                }
                column(VAT__; "VAT %")
                {

                }
                column(Line_Amount; "Line Amount")
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