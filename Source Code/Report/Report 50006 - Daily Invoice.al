// report 50006 DailyInvoiceReport
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultRenderingLayout = LayoutName;

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Invoice Header")
//         {
//             RequestFilterFields = "Due Date";

//             column(SellToCutomerName; "Sell-to Customer Name")
//             {

//             }
//             column(ShipToCode; "Ship-to Code")
//             {

//             }
//             column(ShipToName; "Ship-to Name")
//             {

//             }
//             column(ShipToAddress; "Ship-to Address")
//             {

//             }
//             column(ShipToAddress2; "Ship-to Address 2")
//             {

//             }
//             column(ShipToCity; "Ship-to City")
//             {

//             }
//             column(ShipToPostCode; "Ship-to Post Code")
//             {

//             }
//             column(CompanyName; CompanyInfo.Name)
//             {

//             }
//             column(CompanyAdress1; CompanyInfo.Address)
//             {

//             }
//             column(CompanyAdress2; CompanyInfo."Address 2")
//             {

//             }
//             column(CompanyZipcode; CompanyInfo."Ship-to City")
//             {

//             }
//             column(CompanyPhone; CompanyInfo."Phone No.")
//             {

//             }
//             column(CompanyFax; CompanyInfo."Fax No.")
//             {

//             }
//             column(CompanyPic; CompanyInfo.Picture)
//             {

//             }
//             column(InvoiceNo; "No.")
//             {

//             }
//             column(DueDate; "Due Date")
//             {

//             }
//             column(Shipping_Agent_Code; "Shipping Agent Code")
//             {

//             }
//             column(Work_Description; "Work Description")
//             {

//             }

//             dataitem("Sales Invoice Line"; "Sales Invoice Line")
//             {
//                 DataItemLink = "Document No." = field("No.");
//                 column(LinesDescription; Description)
//                 {

//                 }
//                 column(Amount; Amount)
//                 {

//                 }

//             }

           
//         }
//     }
//     requestpage
//     {
//         actions
//         {
//             area(processing)
//             {
//                 action(ActionName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }
//     }

//     rendering
//     {
//         layout(LayoutName)
//         {
//             Type = RDLC;
//             LayoutFile = './Source Code/ReportLayout/ReportPostedSalesInvoice.rdl';
//         }
//     }

//     trigger OnPreReport()
//     begin
//         CompanyInfo.get();
//         // SalesInvoiceLines.get();
//         CompanyInfo.CalcFields(Picture);
//         //SalesInvoiceLines := 'PPP';
//     end;

//     var
//         myInt: Integer;
//         CompanyInfo: Record "Company Information";
//         //SalesInvoiceLines: Text;
//         SalesInvoiceLinesG: Record "Sales Invoice Line";
// }