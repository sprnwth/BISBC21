tableextension 50009 SalesPersonBISExt extends "Salesperson/Purchaser"
{
    fields
    {
        field(50000; "Target Sales Monthly"; Decimal)
        {
            Caption = 'Target Sales Monthly';
            DataClassification = ToBeClassified;
        }
        field(50001; "Target Sales Yearly"; Decimal)
        {
            Caption = 'Target Sales Yearly';
            DataClassification = ToBeClassified;
        }
        // field(50002; "Employ Date"; Date)
        // {
        //     DataClassification = ToBeClassified;
        // }
        field(50003; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(50004; Initial; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        // field(50005; Areacode; Code[10])
        // {
        //     DataClassification = ToBeClassified;
        // }
        field(50006; "Employee Head"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }

        field(50007; "Team"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Buddy"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }

        // //Dimension 
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
    }
}
