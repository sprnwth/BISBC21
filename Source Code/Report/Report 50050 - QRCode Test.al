// report 50050 QRCodeTest
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultRenderingLayout = LayoutName;

//     dataset
//     {
//         dataitem("Sales Invoice Header"; "Sales Invoice Header")
//         {
//             RequestFilterFields = "No.";
//             column(QRCode; QRCode)
//             {

//             }
//             trigger OnAfterGetRecord()

//             begin
//                 GenerateQRCode();
//             end;
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
//             LayoutFile = './Source Code/ReportLayout/QRCodeTest.rdl';
//         }
//     }

//     local procedure GenerateQRCode()
//     var
//         BarcodeSymbology2D: Enum "Barcode Symbology 2D";
//         BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
//         BarcodeString: Text;
//     begin
//         BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
//         BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";
//         BarcodeString := '|' +
//                             '0105547025274' + CRLF[1] +
//                             '' + CRLF[1] +
//                             '' + CRLF[1] +
//                             '100000';

//         QRCode := BarcodeFontProvider2D.EncodeFont(BarcodeString, BarcodeSymbology2D);
//         QRCodeBase64 := ToBase64.ToBase64(QRCode);
//     end;

//     trigger OnPreReport()

//     begin
//         CRLF := TypeHelper.CRLFSeparator();
//     end;

//     var
//         TypeHelper: codeunit "Type Helper";
//         QRCode: Text;
//         QRCodeBase64: Text;
//         CRLF: Text[2];
//         ToBase64: Codeunit "Base64 Convert";
// }