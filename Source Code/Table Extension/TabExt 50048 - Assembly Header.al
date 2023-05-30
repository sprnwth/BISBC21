tableextension 50048 "AssemblyExt" extends "Assembly Header"
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
}