report 50025 "Warehouse Picking List"
{
    caption = 'ใบจัดสินค้า';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            RequestFilterFields = "Posting Date", "No.";
            column(companyInfo; companyInfo.Name)
            {
            }
            column(ReportName; ReportName)
            {

            }
            column(No_HDR; "No.")
            {
            }
            column(Shipping_Agent_Code_HDR; ShipingAgentG.Name)
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(SalesHdr_NAme; SalesHdr."Sell-to Customer Name")
            {
            }
            column(SalesHdr_ShiptoName; SalesHdr."Ship-to Name")
            {

            }
            column(SalesHdr_PhoneShipto; SalesHdr."Sell-to Phone No.")
            {

            }
            column(SalesHdr_Address; SalesHdr."Ship-to Address" + ' ' + SalesHdr."Ship-to Address 2" + ' ' + SalesHdr."Ship-to City" + ' ' + SalesHdr."Ship-to Post Code")
            {

            }
            column(SalesHdr_Province; SalesHdr."Ship-to City")
            {

            }
            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = field("No.");
                dataitem("Registered Whse. Activity Line"; "Registered Whse. Activity Line")
                {
                    DataItemLink = "Whse. Document No." = field("No."),
                                    "Whse. Document Line No." = field("Line No.");
                    DataItemTableView = where("Action Type" = const(Take));

                    column(Quantity; Quantity)
                    {

                    }
                    column(Serial_No_; "Serial No.")
                    {

                    }
                    column(Expiration_Date; "Expiration Date")
                    {

                    }
                    column(Lot_No_; "Lot No.")
                    {

                    }
                    column(Description; Description)
                    {

                    }

                    column(Item_No_; "Item No.")
                    {

                    }
                    column(Location_Code; "Location Code")
                    {

                    }
                    column(Bin_Code; "Bin Code")
                    {

                    }

                    column(Unit_of_Measure_Code; "Unit of Measure Code")
                    {

                    }

                    column(UOMName; UOMName)
                    {

                    }
                    trigger OnAfterGetRecord() // Reservation Entry
                    begin

                    end;
                }

                trigger OnAfterGetRecord()   // Warehouse Shipment Line           
                begin

                    UOMName := '';
                    if UOM.get("Unit of Measure Code") then
                        UOMName := UOM.Description;

                    SalesHdr.Reset();
                    SalesHdr.SetRange("No.", "Source No.");
                    SalesHdr.SetRange("Document Type", SalesHdr."Document Type"::Order);
                    If Not SalesHdr.FindFirst() then
                        SalesHdr.Init();

                    If Not ShipingAgentG.Get("Warehouse Shipment Header"."Shipping Agent Code") then
                        ShipingAgentG.Init();
                end;

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {

            }
        }


    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/BISPickingList.rdlc';
        }
    }
    trigger OnPreReport()

    begin
        companyInfo.get;

    end;

    var
        TakeFromBIN: Code[20];
        ShipingAgentG: Record "Shipping Agent";
        companyInfo: Record "Company Information";
        ReservationG: Record "Reservation Entry";
        RegActivityLine: Record "Registered Whse. Activity Line";
        SalesHdr: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CustomerG: Record Customer;
        ReportName: Label 'ใบจัดสินค้า';
        UOMName: Text;
        UOM: Record "Unit of Measure";


}