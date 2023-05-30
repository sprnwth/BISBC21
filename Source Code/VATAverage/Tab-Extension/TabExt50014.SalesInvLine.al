tableextension 50014 SalesInvLineExt extends "Sales Invoice Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Amount FOB"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Amount FOB LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Currency Factor"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Invoice Header"."Currency Factor" where("No." = field("Document No.")));
        }
        //ACC02   24.10.2020   SSI +
        field(60100; "Base AVG. VAT Line No."; Integer)
        {
            Caption = 'Base AVG. VAT Line No. ';
            DataClassification = ToBeClassified;
        }
        //ACC02   24.10.2020   SSI -
        field(60102; "UOM Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field("Unit of Measure Code")));
        }
     
    }

    procedure GetLineAmtLCY(): Decimal
    var
        SalesInvHdr: Record "Sales Invoice Header";
    begin
        if SalesInvHdr.get("Document No.") then begin
            if SalesInvHdr."Currency Code" = '' then
                Exit("Line Amount")
            else begin
                Rec.CalcFields("Currency Factor");
                if Rec."Currency Factor" <> 0 then
                    Exit("Line Amount" / Rec."Currency Factor")
                else
                    Exit(0);

            end;
        end;




    end;

    var
        myInt: Integer;
}
