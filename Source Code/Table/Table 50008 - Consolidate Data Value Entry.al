table 50008 "Consolidate Value Entry"
{
    Caption = 'Consolidate Value Entry';
    DrillDownPageID = "Consolidate Value Entry";
    LookupPageID = "Consolidate Value Entry";
    Permissions = tabledata "Consolidate Value Entry" = rimd;
    DataPerCompany = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Item Ledger Entry Type"; Enum "Item Ledger Entry Type")
        {
            Caption = 'Item Ledger Entry Type';
        }
        field(5; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST(Customer)) Customer
            ELSE
            IF ("Source Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Source Type" = CONST(Item)) Item;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(9; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(10; "Source Posting Group"; Code[20])
        {
            Caption = 'Source Posting Group';
            TableRelation = IF ("Source Type" = CONST(Customer)) "Customer Posting Group"
            ELSE
            IF ("Source Type" = CONST(Vendor)) "Vendor Posting Group"
            ELSE
            IF ("Source Type" = CONST(Item)) "Inventory Posting Group";
        }
        field(11; "Item Ledger Entry No."; Integer)
        {
            Caption = 'Item Ledger Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(12; "Valued Quantity"; Decimal)
        {
            Caption = 'Valued Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(13; "Item Ledger Entry Quantity"; Decimal)
        {
            Caption = 'Item Ledger Entry Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(14; "Invoiced Quantity"; Decimal)
        {
            Caption = 'Invoiced Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(15; "Cost per Unit"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Cost per Unit';
        }
        field(17; "Sales Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Sales Amount (Actual)';
        }
        field(22; "Salespers./Purch. Code"; Code[20])
        {
            Caption = 'Salespers./Purch. Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(23; "Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Discount Amount';
        }
        field(24; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(25; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(28; "Applies-to Entry"; Integer)
        {
            Caption = 'Applies-to Entry';
        }
        field(33; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(34; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(41; "Source Type"; Enum "Analysis Source Type")
        {
            Caption = 'Source Type';
        }
        field(43; "Cost Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Actual)';
        }
        field(45; "Cost Posted to G/L"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Posted to G/L';
        }
        field(46; "Reason Code"; Code[10])
        {
            AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(47; "Drop Shipment"; Boolean)
        {
            Caption = 'Drop Shipment';
        }
        field(48; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(57; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(58; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(60; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(61; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(68; "Cost Amount (Actual) (ACY)"; Decimal)
        {
           // AutoFormatExpression = GetCurrencyCode();
            AutoFormatType = 1;
            Caption = 'Cost Amount (Actual) (ACY)';
        }
        field(70; "Cost Posted to G/L (ACY)"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
           // AutoFormatExpression = GetCurrencyCode();
            AutoFormatType = 1;
            Caption = 'Cost Posted to G/L (ACY)';
        }
        field(72; "Cost per Unit (ACY)"; Decimal)
        {
            AccessByPermission = TableData Currency = R;
         //   AutoFormatExpression = GetCurrencyCode();
            AutoFormatType = 2;
            Caption = 'Cost per Unit (ACY)';
        }
        field(79; "Document Type"; Enum "Item Ledger Document Type")
        {
            Caption = 'Document Type';
        }
        field(80; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(86; "VAT Reporting Date"; Date)
        {
            Caption = 'VAT Date';
        }
        field(90; "Order Type"; Enum "Inventory Order Type")
        {
            Caption = 'Order Type';
            Editable = false;
        }
        field(91; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            Editable = false;
        }
        field(92; "Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
            Editable = false;
        }
        field(98; "Expected Cost"; Boolean)
        {
            Caption = 'Expected Cost';
        }
        field(99; "Item Charge No."; Code[20])
        {
            Caption = 'Item Charge No.';
            TableRelation = "Item Charge";
        }
        field(100; "Valued By Average Cost"; Boolean)
        {
            Caption = 'Valued By Average Cost';
        }
        field(102; "Partial Revaluation"; Boolean)
        {
            Caption = 'Partial Revaluation';
        }
        field(103; Inventoriable; Boolean)
        {
            Caption = 'Inventoriable';
        }
        field(104; "Valuation Date"; Date)
        {
            Caption = 'Valuation Date';
        }
        field(105; "Entry Type"; Enum "Cost Entry Type")
        {
            Caption = 'Entry Type';
            Editable = false;
        }
        field(106; "Variance Type"; Enum "Cost Variance Type")
        {
            Caption = 'Variance Type';
            Editable = false;
        }
        field(148; "Purchase Amount (Actual)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Purchase Amount (Actual)';
        }
        field(149; "Purchase Amount (Expected)"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            AutoFormatType = 1;
            Caption = 'Purchase Amount (Expected)';
        }
        field(150; "Sales Amount (Expected)"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            AutoFormatType = 1;
            Caption = 'Sales Amount (Expected)';
        }
        field(151; "Cost Amount (Expected)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount (Expected)';
        }
        field(152; "Cost Amount (Non-Invtbl.)"; Decimal)
        {
            AccessByPermission = TableData "Item Charge" = R;
            AutoFormatType = 1;
            Caption = 'Cost Amount (Non-Invtbl.)';
        }
        field(156; "Cost Amount (Expected) (ACY)"; Decimal)
        {
            //AutoFormatExpression = GetCurrencyCode();
            AutoFormatType = 1;
            Caption = 'Cost Amount (Expected) (ACY)';
        }
        field(157; "Cost Amount (Non-Invtbl.)(ACY)"; Decimal)
        {
            AccessByPermission = TableData "Item Charge" = R;
          //  AutoFormatExpression = GetCurrencyCode();
            AutoFormatType = 1;
            Caption = 'Cost Amount (Non-Invtbl.)(ACY)';
        }
        field(158; "Expected Cost Posted to G/L"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Expected Cost Posted to G/L';
        }
        field(159; "Exp. Cost Posted to G/L (ACY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Exp. Cost Posted to G/L (ACY)';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

          
        }
        // field(481; "Shortcut Dimension 3 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,3';
        //     Caption = 'Shortcut Dimension 3 Code';
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
        //                                                                             "Global Dimension No." = const(3)));
        // }
        // field(482; "Shortcut Dimension 4 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,4';
        //     Caption = 'Shortcut Dimension 4 Code';
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
        //                                                                             "Global Dimension No." = const(4)));
        // }
        // field(483; "Shortcut Dimension 5 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,5';
        //     Caption = 'Shortcut Dimension 5 Code';
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
        //                                                                             "Global Dimension No." = const(5)));
        // }
        // field(484; "Shortcut Dimension 6 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,6';
        //     Caption = 'Shortcut Dimension 6 Code';
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
        //                                                                             "Global Dimension No." = const(6)));
        // }
        // field(485; "Shortcut Dimension 7 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,7';
        //     Caption = 'Shortcut Dimension 7 Code';
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
        //                                                                             "Global Dimension No." = const(7)));
        // }
        // field(486; "Shortcut Dimension 8 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,8';
        //     Caption = 'Shortcut Dimension 8 Code';
        //     Editable = false;
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"),
        //                                                                             "Global Dimension No." = const(8)));
        // }
        field(1000; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job."No.";
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
        }
        field(1002; "Job Ledger Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'Job Ledger Entry No.';
            TableRelation = "Job Ledger Entry"."Entry No.";
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(5818; Adjustment; Boolean)
        {
            Caption = 'Adjustment';
            Editable = false;
        }
        field(5819; "Average Cost Exception"; Boolean)
        {
            Caption = 'Average Cost Exception';
        }
        field(5831; "Capacity Ledger Entry No."; Integer)
        {
            Caption = 'Capacity Ledger Entry No.';
            TableRelation = "Capacity Ledger Entry";
        }
        field(5832; Type; Enum "Capacity Type Journal")
        {
            Caption = 'Type';
        }
        field(5834; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST("Machine Center")) "Machine Center"
            ELSE
            IF (Type = CONST("Work Center")) "Work Center"
            ELSE
            IF (Type = CONST(Resource)) Resource;
        }
        field(6602; "Return Reason Code"; Code[10])
        {
            Caption = 'Return Reason Code';
            TableRelation = "Return Reason";
        }
        field(50100; CompanyName; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        //BIS
        field(50101; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50102;"Inv Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "SalesPerson Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Promo Sale Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Shipment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        //BIS
    }

    keys
    {
        key(Key1; CompanyName, "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; CompanyName, "Item Ledger Entry No.", "Entry Type")
        {
            IncludedFields = "Invoiced Quantity", "Sales Amount (Expected)", "Sales Amount (Actual)", "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Non-Invtbl.)", "Cost Amount (Expected) (ACY)", "Cost Amount (Actual) (ACY)", "Cost Amount (Non-Invtbl.)(ACY)", "Purchase Amount (Actual)", "Purchase Amount (Expected)", "Discount Amount";
        }
        key(Key3; CompanyName, "Item Ledger Entry No.", "Document No.", "Document Line No.")
        {
        }
  
        key(Key6; CompanyName, "Document No.")
        {
        }
       
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Item Ledger Entry Type", "Item Ledger Entry No.", "Item No.", "Posting Date", "Source No.", "Document No.")
        {
        }
    }

    var
        GLSetup: Record "General Ledger Setup";
        UOMMgt: Codeunit "Unit of Measure Management";
        GLSetupRead: Boolean;


}