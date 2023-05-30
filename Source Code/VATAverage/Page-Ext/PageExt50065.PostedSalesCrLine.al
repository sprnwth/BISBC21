// pageextension 50110 PostedSalesCrLineExt extends "Posted Sales Cr. Memo Subform"
// {
//     layout
//     {
//         // Add changes to page layout here
//         addafter("Line Amount")
//         {
//             field(LineAmtLCY; LineAmtLCY)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Line Amount (LCY)';
//                 Editable = false;
//             }
//             // field("Amount FOB"; Rec."Amount FOB")
//             // {
//             //     ApplicationArea = All;

//             // }
//             // field("Amount FOB LCY"; Rec."Amount FOB LCY")
//             // {
//             //     ApplicationArea = All;

//             // }
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }


//     trigger OnAfterGetRecord()

//     begin
//         LineAmtLCY := 0;
//         //LineAmtLCY := Rec.GetLineAmtLCY();
//     end;

//     var
//         LineAmtLCY: Decimal;
// }