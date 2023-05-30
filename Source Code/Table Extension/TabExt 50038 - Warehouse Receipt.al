tableextension 50038 "Whse.Receipt Ext" extends "Warehouse Receipt Header"
{
    fields
    {
        field(50000; "Reason Code"; Code[30])
        {
            Caption = 'Reason Code';
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";
        }

        field(50001; "Source No."; Code[20])
        {
            Caption = 'PO No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Warehouse Receipt Line"."Source No." where("No." = field("No."), "Source Type" = const(39)));
        }
    }
}