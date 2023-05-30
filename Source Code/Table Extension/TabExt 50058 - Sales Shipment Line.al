tableextension 50058 TableExtensionSalesShipmtLine extends "Sales Shipment Line"
{
    fields
    {
        field(50055; "Invoice No."; code[20])
        {
            FieldClass = FlowField;
            //CalcFormula = lookup("Sales Line"."Document No." where("Shipment No." = field("No.")));
            CalcFormula = lookup("Sales Invoice Header"."No." where("Order No." = field("Order No.")));
        }
    }




    var
        myInt: Integer;
}