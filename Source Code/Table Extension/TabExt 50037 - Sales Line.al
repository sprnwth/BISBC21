// tableextension 50042 SalesLineBISExt extends "Sales Line"
// {
//     fields
//     {
//         // Add changes to table fields here
//         field(50000; "UOM Name"; Text[50])
//         {
//             FieldClass = FlowField;
//             CalcFormula = lookup("Unit of Measure".Description where (Code = field("Unit of Measure Code")));
//         }
//     }

//     var
//         myInt: Integer;
// }