// report 50024 "BIS Shipping Daily Report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultRenderingLayout = LayoutName;

//     dataset
//     {
//         dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
//         {
//             RequestFilterFields = "Posting Date", "No.";
//             column(companyInfo; companyInfo.Name)
//             {
//             }
//             column(ReportName; ReportName)
//             {

//             }
//             column(No_HDR; "No.")
//             {
//             }
//             column(Shipping_Agent_Code_HDR; "Shipping Agent Code")
//             {
//             }
//             dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
//             {
//                 DataItemLink = "No." = field("No.");
//                 column(Quantity_Line; Quantity)
//                 {
//                 }
//                 column(SalesHdr_NAme; SalesHdr."Sell-to Customer Name")
//                 {
//                 }
//                 column(Description; Description)
//                 {

//                 }
//                 column(Source_No_; "Source No.")
//                 {

//                 }
//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;
//                 begin
//                     // If SalesHdr.Get("Source No.") then;
//                     SalesHdr.Reset();
//                     SalesHdr.SetRange("No.", "Source No.");
//                     SalesHdr.SetRange("Document Type", "Source Document"::"Sales Order");
//                     if SalesHdr.FindFirst() then;
//                     // Message(SalesHdr."Sell-to Customer Name");


//                 end;

//             }
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {

//             }
//         }


//     }

//     rendering
//     {
//         layout(LayoutName)
//         {
//             Type = RDLC;
//             LayoutFile = './Source Code/ReportLayout/BISShippingDailyReport.rdlc';
//         }
//     }
//     trigger OnPreReport()
//     var
//         myInt: Integer;
//     begin
//         companyInfo.get;

//     end;

//     var
//         companyInfo: Record "Company Information";
//         myInt: Integer;
//         SalesHdr: Record "Sales Header";
//         SalesLine: Record "Sales Line";
//         CustomerG: Record Customer;
//         ReportName: Label 'รายงานจัดส่งสินค้าประจำวัน';


// }