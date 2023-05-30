tableextension 50031 "Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "Ref. Order No."; Code[20])
        {
            Caption = 'Ref. Order No.';
            DataClassification = ToBeClassified;
        }
        field(50001; "Ref. Order Line No."; Integer)
        {
            Caption = 'Ref. Order Line No.';
            DataClassification = ToBeClassified;
        }
        field(50002; "UOM Description"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field("Unit of Measure Code")));
        }
    }
}
