tableextension 50042 "Item Journal Line" extends "Item Journal Line"
{
    fields
    {
        field(50000; "UOM Name"; Text[50])
        {
            Caption = 'UOM Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field("Unit of Measure Code")));
        }
    }

    keys
    {
        // key(key6; "Document No.", "Item No.")
        // {

        // }
    }
}
