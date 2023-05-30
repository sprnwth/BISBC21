report 50034 "Posted Shipping Daily Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    caption = 'รายงานจัดส่งสินค้าประจำวัน';

    dataset
    {
        dataitem("Posted Whse. Shipment Header"; "Posted Whse. Shipment Header")
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
            column(Shipping_Agent_Code_HDR; ShippingAgentG.Name)
            {
            }

            dataitem("Posted Whse. Shipment Line"; "Posted Whse. Shipment Line")
            {
                DataItemLink = "No." = field("No.");
                DataItemLinkReference = "Posted Whse. Shipment Header";
                RequestFilterFields = "Goods Type", "Salesperson Code";
                column(Quantity_Line; Quantity)
                {
                }
                column(SalesHdr_NAme; SalesHdr."Sell-to Customer Name")
                {
                }
                column(Description; Description)
                {
                }
                column(Source_No_; "Source No.")
                {
                }
                column(Item_GoodType; "Goods Type")
                {

                }
                column(SIDocument; SIDocument)
                {

                }
                column(UnitOfMesureG; UnitOfMesureG.Description)
                {

                }
                column(WorkDescription; WorkDescription)
                {
                }
                column(SalePersonGG; SalePersonGG)
                {
                }

                trigger OnAfterGetRecord()

                begin
                    Clear(WorkDescription);
                    SalesHdr.Reset();
                    SalesHdr.SetRange("No.", "Source No.");
                    SalesHdr.SetRange("Document Type", "Source Document"::"Sales Order");
                    if SalesHdr.FindFirst() then
                        WorkDescription := SalesHdr.GetWorkDescription();
                    UnitOfMesureG.Reset();
                    UnitOfMesureG.SetRange(Code, "Unit of Measure Code");
                    if UnitOfMesureG.FindFirst() then;

                    ValueEntry1.Reset();
                    ValueEntry1.SetRange("Document No.", "Posted Source No.");
                    If ValueEntry1.FindFirst() then begin
                        ValueEntry2.Reset();
                        ValueEntry2.SetRange("Item Ledger Entry No.", ValueEntry1."Item Ledger Entry No.");
                        ValueEntry2.SetFilter("Document Type", '=%1', ValueEntry2."Document Type"::"Sales Invoice");
                        If ValueEntry2.FindFirst() then begin
                            SIDocument := ValueEntry2."Document No.";
                        end;
                    end;

                    SaleInvoiceHDRG.Reset();
                    SaleInvoiceHDRG.SetRange("No.", SIDocument);
                    If SaleInvoiceHDRG.FindFirst() then;
                    //WorkDescription := SaleInvoiceHDRG.GetWorkDescription();


                    // Message(WorkDescription);


                    CalcFields("Salesperson Code");
                    salePersonTBG.Reset();
                    salePersonTBG.SetRange(Code, "Salesperson Code");
                    if salePersonTBG.FindFirst() then
                        SalePersonGG := salePersonTBG.Name;
                end;

            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                ShippingAgentG.Reset();
                ShippingAgentG.SetRange(Code, "Shipping Agent Code");
                If ShippingAgentG.FindFirst() then;

            end;
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
            LayoutFile = './Source Code/ReportLayout/BISShippingDailyReportPSD.rdlc';
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        companyInfo.get;

    end;

    var
        salePersonTBG: Record "Salesperson/Purchaser";
        SalePersonGG: Text;
        Item: Record Item;
        WorkDescription: Text;
        SaleInvoiceHDRG: Record "Sales Invoice Header";
        UnitOfMesureG: Record "Unit of Measure";
        ShippingAgentG: Record "Shipping Agent";
        SIDocument: Text;
        companyInfo: Record "Company Information";
        myInt: Integer;
        ValueEntry1: Record "Value Entry";
        ValueEntry2: Record "Value Entry";
        SalesInvHder: Record "Sales Invoice Header";
        SalesLine: Record "Sales Line";
        CustomerG: Record Customer;
        ReportName: Label 'รายงานจัดส่งสินค้าประจำวัน';
        SalesHdr: Record "Sales Header";


}