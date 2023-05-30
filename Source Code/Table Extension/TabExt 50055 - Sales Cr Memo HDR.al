tableextension 50055 TableExtensionSalesCrmemoHDR extends "Sales Cr.Memo Header"
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