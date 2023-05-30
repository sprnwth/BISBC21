tableextension 50017 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50000; "UOM Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where (Code = field("Unit of Measure Code")));
        }
        // Add changes to table fields here
        field(70000; "Amount FOB"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70001; "Amount FOB LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70002; "Currency Factor"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Currency Factor" where("Document Type" = field("Document Type"), "No." = field("Document No.")));
        }
        
        //ACC02   24.10.2020   SSI +
        field(60100; "Base AVG. VAT Line No."; Integer)
        {
            Caption = 'Base AVG. VAT Line No. ';
            DataClassification = ToBeClassified;
        }
     
        field(60103; "TC Qty. to cancel"; Decimal)
        {
            caption = 'Qty. to cancel';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Rec."TC Qty. to cancel" > Rec."Outstanding Quantity" then
                    Error('Quantity To cancel is only %1', Rec."Outstanding Quantity");
            end;
        }
        field(60104; "Discount by Percent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
       
       
    }

    var
        myInt: Integer;

    // procedure GetLineAmtLCY(): Decimal
    // begin
    //     if Rec."Currency Code" = '' then
    //         Exit("Line Amount")
    //     else begin
    //         Rec.CalcFields("Currency Factor");
    //         if Rec."Currency Factor" <> 0 then
    //             Exit("Line Amount" / Rec."Currency Factor")
    //         else
    //             Exit(0);

    //     end;


    // end;
}
