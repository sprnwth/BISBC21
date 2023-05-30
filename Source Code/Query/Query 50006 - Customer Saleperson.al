query 50006 CustomerSaleperson
{
    QueryType = API;
    APIPublisher = 'nwth';
    APIGroup = 'bis';
    APIVersion = 'v2.0';
    EntityName = 'biscustsaleperson';
    EntitySetName = 'biscustsalepersons';
 DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(Customer; Customer)
        {
            column(customerno; "No.")
            {

            }
            column(customerame; Name)
            {

            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(Ship_to_Code; "Ship-to Code")
            {

            }
            dataitem(Customer_Saleperson_Relation; "Customer Saleperson Relation")
            {
                DataItemLink = "Customer no." = Customer."No.";

                dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
                {
                    DataItemLink = Code = Customer_Saleperson_Relation."Sale Personcode";
                    column(salepersoncode; Code)
                    {

                    }
                    column(salename; Name)
                    {

                    }
                    column(eMail; "E-Mail")
                    {

                    }

                    column(areacode; "Shortcut Dimension 6 Code")
                    {

                    }
                    column(buddy; Buddy)
                    {

                    }
                    column(teamhead; "Employee Head")
                    {

                    }
                    column(employeeno; "Employee No.")
                    {

                    }
                    column(target_Sales_Monthly; "Target Sales Monthly")
                    {

                    }
                    column(target_Sales_Yearly; "Target Sales Yearly")
                    {

                    }
                }
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}