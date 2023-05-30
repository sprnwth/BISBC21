tableextension 50000 CustomerBISExt extends Customer
{

    fields
    {
        // Add changes to table fields here
        field(50000; Latitude; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; Longtitue; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Grade; Code[10])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Customer Grade";
        }
        field(50003; "Registered Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Business Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = customerbusinessType;
        }
        field(50005; "Item Group Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ItemgroupType;
        }
        field(50006; "Est. Monthly Sales"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Customer Chain Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = customerChain;
        }
        field(50008; "Authorization"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Customer Capacity"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Reference No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Customer Chain Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Personal ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Customer Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = customerType;
        }
        field(50014; "Reference Number"; Decimal)
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

        field(60006; "Force NON VAT Sale"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(60007; "Cust. Remark"; Text[30])
        {
            DataClassification = ToBeClassified;
        }


    }

}