tableextension 50013 PurchInvLineExt extends "Purch. Inv. Line"
{
    fields
    {
        //ACC02   24.10.2020   SSI +
        field(60100; "Base AVG. VAT Line No."; Integer)
        {
            Caption = 'Base AVG. VAT Line No. ';
            DataClassification = ToBeClassified;
        }
        field(60101; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        //ACC02   24.10.2020   SSI -
        // field(60102; "LL Master Description"; Text[100])
        // {
        //     Caption = 'Master Description';
        //     DataClassification = ToBeClassified;
        //     Description = 'LL1.0';
        //     Editable = true;
        // }
          field(60102; "UOM Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where (Code = field("Unit of Measure Code")));
        }
    }

    procedure GetLineAmtLCY(): Decimal
    var
        PurchInvHdr: Record "Purch. Inv. Header";
    begin
        if PurchInvHdr.get("Document No.") then begin
            if PurchInvHdr."Currency Code" = '' then
                Exit("Line Amount")
            else begin

                if PurchInvHdr."Currency Factor" <> 0 then
                    Exit("Line Amount" / PurchInvHdr."Currency Factor")
                else
                    Exit(0);

            end;
        end;


    end;
}
