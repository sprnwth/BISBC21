tableextension 50025 ItemBISEXT extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50000; "FDA No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Goods Type"; Enum "Item Goods Type")
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Brand; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Itembrand;
        }
        field(50003; "Sub Group 1"; Code[20]) //BOI / FG
        {
            DataClassification = ToBeClassified;
            TableRelation = Itemsubgroup1;
        }
        field(50004; "Sub Grop 2"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50005; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50006; "Base UOM Description"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field("Base Unit of Measure")));

        }
        field(50007; "Purch. UOM Description"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field("Purch. Unit of Measure")));

        }
        field(50008; "Sale UOM Description"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field("Sales Unit of Measure")));

        }
        field(50009; Grade; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        //Dimension
        field(60000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }

        field(60001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(60002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }

        field(60003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }

        field(60004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                          Blocked = CONST(false));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }

        field(60005; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                          Blocked = CONST(false));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(60006; "SubGroup1 Desc."; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Itemsubgroup1.Description where(Code = field("Sub Group 1")));
        }
        field(60007; "SubGroup2 Desc."; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Item Category".Description where(Code = field("Item Category Code")));
        }
        field(60008; "Item Temperature"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60009; "Qty. to PO"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}