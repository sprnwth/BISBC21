tableextension 50032 "Item Unit of Measure" extends "Item Unit of Measure"
{
    fields
    {
        field(50000; "Pack Size"; Decimal)
        {
            Caption = 'Pack Size';
            DataClassification = ToBeClassified;
        }
        field(50001; "Pack UOM"; Code[10])
        {
            Caption = 'Pack UOM';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50002; Description; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field(Code)));

        }
        field(50003; "Pack UOM Description"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field("Pack UOM")));

        }
    }

    fieldgroups
    {
        addlast(DropDown; Code, "Qty. per Unit of Measure", Description)
        {

        }
    }
}
