tableextension 50034 TableExtPostedWarehouseLine extends "Posted Whse. Shipment Line"
{
    fields
    {
        field(50000; "Expiry date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Goods Type"; Enum "Item Goods Type")
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Goods Type" where("No." = field("Item No.")));
        }
        field(50002; "Salesperson Code"; Code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Shipment Header"."Salesperson Code" where("No." = field("Posted Source No.")));
            // DataClassification = ToBeClassified;
            // TableRelation = "Sales Shipment Header"."Salesperson Code" where("No." = field("Posted Source No."));
            //TableRelation = "Salesperson/Purchaser".Name;

        }
    }

    var
        myInt: Integer;
}