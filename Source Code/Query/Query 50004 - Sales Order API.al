query 50004 SalesOrderAPI
{
    QueryType = API;
    APIPublisher = 'nwth';
    APIGroup = 'bis';
    APIVersion = 'v2.0';
    EntityName = 'bisordertracking';
    EntitySetName = 'bisordertrackings';
 DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(Sales_Header; "Sales Header")
        {
            DataItemTableFilter = "Document Type" = const(Order), Status = const(Released);
            column(orderNo_; "No.")
            {

            }
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
            dataitem(Sales_Line; "Sales Line")
            {
                DataItemLink = "Document No." = Sales_Header."No.";
                column(No_; "No.")
                {

                }
                column(orderQty; Quantity)
                {

                }
                column(Outstanding_Quantity; "Outstanding Quantity")
                {

                }
                column(Quantity_Shipped; "Quantity Shipped")
                {

                }

                dataitem(Posted_Whse__Shipment_Line; "Posted Whse. Shipment Line")
                {
                    DataItemLink = "Source No." = Sales_Line."Document No.", "Source Line No." = Sales_Line."Line No.";
                    column(WHNo_; "No.")
                    {

                    }
                    column(Posting_Date; "Posting Date")
                    {

                    }
                    column(shipqty; Quantity)
                    {

                    }

                    dataitem(Sales_Invoice_Line; "Sales Invoice Line")
                    {
                        DataItemLink = "Order No." = Posted_Whse__Shipment_Line."Source No.",
                                        "Order Line No." = Posted_Whse__Shipment_Line."Source Line No.";
                        column(InvoiceNo; "Document No.")
                        {

                        }
                        column(InvoiceDate; "Posting Date")
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