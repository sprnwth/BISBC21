query 50003 documenttracking
{
    QueryType = API;
    APIPublisher = 'nwth';
    APIGroup = 'bis';
    APIVersion = 'v2.0';
    EntityName = 'bisdocumentTracking';
    EntitySetName = 'bisdocumentTrackings';
 DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(Warehouse_Entry; "Warehouse Entry")
        {

            column(Source_No_; "Source No.")
            {

            }
            column(Whse__Document_No_; "Whse. Document No.")
            {

            }
            column(Registering_Date; "Registering Date")
            {

            }
            dataitem(Sales_Header; "Sales Header")
            {
                DataItemLink = "No." = Warehouse_Entry."Source No.";
                DataItemTableFilter = "Document Type" = const(Order);
                column(Sell_to_Customer_No_; "Sell-to Customer No.")
                {

                }
                column(Sell_to_Customer_Name; "Sell-to Customer Name")
                {

                }
                column(Order_Date; "Order Date")
                {

                }
                column(Shipment_Date; "Shipment Date")
                {

                }
                column(Ship_to_Code; "Ship-to Code")
                {

                }
                column(Ship_to_Address; "Ship-to Address")
                {

                }
                dataitem(Sales_Line; "Sales Line")
                {
                    DataItemLink = "Document No." = Sales_Header."No.";
                    column(No_; "No.")
                    {

                    }
                    column(Description; Description)
                    {

                    }
                    column(Unit_of_Measure_Code; "Unit of Measure Code")
                    {

                    }
                    column(UOM_Name; "UOM Name")
                    {

                    }
                    column(Quantity; Quantity)
                    {

                    }
                    column(Quantity_Shipped; "Quantity Shipped")
                    {

                    }
                    column(Quantity_Invoiced; "Quantity Invoiced")
                    {

                    }
                    column(Outstanding_Quantity; "Outstanding Quantity")
                    {

                    }
                    dataitem(Sales_Invoice_Line; "Sales Invoice Line")
                    {
                        DataItemLink = "Order No." = Sales_Line."Document No.",
                                        "Order Line No." = Sales_Line."Line No.";

                        column(Document_No_; "Document No.")
                        {

                        }
                        column(Posting_Date; "Posting Date")
                        {

                        }

                    }
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