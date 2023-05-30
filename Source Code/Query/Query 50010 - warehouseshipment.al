// query 50010 warehouseshipment
// {
//     APIGroup = 'bis';
//     APIPublisher = 'nwth';
//     APIVersion = 'v2.0';
//     EntityName = 'biswhdetail';
//     EntitySetName = 'biswhdetails';
//     QueryType = API;

//     elements
//     {
//         dataitem(warehouseShipmentHeader; "Warehouse Shipment Header")
//         {
//             column(no; "No.")
//             {
//             }
//             column(locationCode; "Location Code")
//             {
//             }
//             column(postingDate; "Posting Date")
//             {
//             }
//             column(shippingAgentCode; "Shipping Agent Code")
//             {
//             }
//             column(externalDocumentNo; "External Document No.")
//             {
//             }
//             dataitem(Warehouse_Shipment_Line; "Warehouse Shipment Line")
//             {
//                 DataItemLink = "No." = warehouseShipmentHeader."No.";
//                 column(Item_No_; "Item No.")
//                 {

//                 }
//                 column(Quantity; Quantity)
//                 {

//                 }
//                 column(Bin_Code; "Bin Code")
//                 {

//                 }
//                 column(Location_Code; "Location Code")
//                 {

//                 }
//                 column(Unit_of_Measure_Code; "Unit of Measure Code")
//                 {

//                 }

//             }
//         }
//     }

//     trigger OnBeforeOpen()
//     begin

//     end;
// }
