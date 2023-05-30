tableextension 50054 TableExtensionSalesInv extends "Sales Invoice Header"
{
    fields
    {
        field(50054; "BIS Comment"; Text[80])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Comment Line".Comment where("No." = field("No.")));
        }
    }

    var
        myInt: Integer;
}