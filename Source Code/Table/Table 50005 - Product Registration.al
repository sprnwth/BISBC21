table 50005 "Product Registration"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Register Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            NotBlank = false;
            trigger OnValidate()

            begin
                TestNoSeries();
            end;

        }

        field(3; "Company Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Company;

        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Initial"; Text[10])
        {
            DataClassification = ToBeClassified;
        }

        //Item and Vendor
        field(50101; "Date"; date)
        {
            DataClassification = ToBeClassified;
        }


        field(50103; "Supplier Code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }

        field(50104; "New Product"; boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec."New Product" then begin
                    rec.Revise := false;
                end;
            end;
        }

        field(50105; "Revise"; boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()

            begin
                if rec.Revise then begin
                    rec."New Product" := false;
                end;
            end;
        }

        field(50106; "Domestic"; boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec.Domestic then begin
                    rec.Export := false;
                    rec.B2C := false;
                end;
            end;
        }

        field(50107; "Export"; boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec.Export then begin
                    rec.Domestic := false;
                    rec.B2C := false;
                end;
            end;
        }

        field(50108; "B2C"; boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec.B2C then begin
                    rec.Domestic := false;
                    rec.Export := false;
                end;
            end;
        }

        field(50109; "Name"; text[100])
        {
            DataClassification = ToBeClassified;


        }
        field(6; "Last Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(50110; "Address"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Vat Registration ID"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Templ.".Code;
        }

        field(50111; "Supplier Email"; text[80])
        {

            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."E-Mail" where("No." = field("Supplier Code")));
        }

        field(50112; "Supplier Phone"; text[30])
        {

            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."Phone No." where("No." = field("Supplier Code")));
        }

        field(50113; "Supplier Fax"; text[80])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."Fax No." where("No." = field("Supplier Code")));
        }

        field(50114; "Product Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(50115; "Item Goods Type"; enum "Item Goods Type")
        {
            DataClassification = ToBeClassified;

        }


        // field(50115; "New Category"; boolean)
        // {
        //     DataClassification = ToBeClassified;

        //     trigger OnValidate()
        //     var
        //         myInt: Integer;
        //     begin
        //         if rec."New Category" then begin
        //             rec."Core Category" := false;
        //             rec."OEM Category" := false;
        //         end;
        //     end;
        // }

        // field(50116; "Core Category"; boolean)
        // {
        //     DataClassification = ToBeClassified;

        //     trigger OnValidate()
        //     var
        //         myInt: Integer;
        //     begin
        //         if rec."Core Category" then begin
        //             rec."New Category" := false;
        //             rec."OEM Category" := false;
        //         end;
        //     end;
        // }

        // field(50117; "OEM Category"; Boolean)
        // {
        //     DataClassification = ToBeClassified;

        //     trigger OnValidate()
        //     var
        //         myInt: Integer;
        //     begin
        //         if rec."OEM Category" then begin
        //             rec."New Category" := false;
        //             rec."Core Category" := false;
        //         end;
        //     end;
        // }

        field(50118; "MainCategory"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Itemsubgroup1; //where ("Parent Category" = );
        }

        field(50119; "SubCategory"; text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;

        }

        field(50120; "Item Tracking Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Tracking Code";
        }


        field(50125; "COther text"; text[50]) //Charecteristics
        {
            DataClassification = ToBeClassified;
        }

        field(50126; "UOM"; Code[10])
        {
            DataClassification = ToBeClassified;
            //OptionMembers = PCS,L,BOT;
            TableRelation = "Unit of Measure".Code;
        }

        field(50127; "Expired Date"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }

        field(50128; "Default VAT Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";

        }

        field(50130; "Credit"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms";
        }

        field(50131; "Delivery Term"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(50132; "Min. Order"; text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(50133; "Product L/T"; text[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50134; "BuyCond Other"; text[50])  //Buy Condition
        {
            DataClassification = ToBeClassified;
        }

        //// Secretary  ////

        field(50135; "Gen. Product Posting Group"; code[20])  //01 Animal Health
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";

        }


        field(50147; "Image"; Boolean)  //Product Image or Catelog
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // if rec."Image" then begin
                //     rec."MSDS/COA" := false;
                //     rec."Register" := false;
                //     rec."Production Information" := false;
                //     REC."Attachment Other" := false;
                // end;
            end;
        }

        field(50149; "MSDS/COA"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // if rec."MSDS/COA" then begin
                //     rec."Image" := false;
                //     rec."Register" := false;
                //     rec."Production Information" := false;
                //     REC."Attachment Other" := false;
                // end;
            end;
        }


        field(50151; "Register"; Boolean)  //Register sheet
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // if rec."Register" then begin
                //     rec."Image" := false;
                //     rec."MSDS/COA" := false;
                //     rec."Production Information" := false;
                //     REC."Attachment Other" := false;
                // end;
            end;
        }

        field(50153; "Production Information"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // if rec."Production Information" then begin
                //     rec."Image" := false;
                //     rec."MSDS/COA" := false;
                //     rec."Register" := false;
                //     REC."Attachment Other" := false;
                // end;
            end;
        }



        field(50155; "Attachment Other"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // if rec."Attachment Other" then begin
                //     rec."Image" := false;
                //     rec."MSDS/COA" := false;
                //     rec."Register" := false;
                //     REC."Production Information" := false;
                // end;
            end;
        }
        field(50156; Status; enum "Product Register status")
        {
            DataClassification = ToBeClassified;
        }
        field(50157; "Item Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50158; "Inventory Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Inventory Posting Group";
        }
        field(50159; "Purch. UOM"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50160; "Purch. UOM Name"; Text[50])
        {
            FieldClass = FlowField;

            CalcFormula = lookup("Unit of Measure".Description
                                where(Code = field("Purch. UOM")));
        }
        field(50161; "Sales. UOM"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50162; "Sales. UOM Name"; Text[50])
        {
            FieldClass = FlowField;

            CalcFormula = lookup("Unit of Measure".Description
                                where(Code = field("Sales. UOM")));
        }
        field(50163; "Base UOM Name"; Text[50])
        {
            FieldClass = FlowField;

            CalcFormula = lookup("Unit of Measure".Description
                                where(Code = field("UOM")));
        }
        // field(50164; "Item Brand type";)
        // {
        //     DataClassification = ToBeClassified;


        // }
        field(50164; "Item Brand"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Itembrand;
        }
    }

    keys
    {
        key(PK; "Register Item No.")
        {
            Clustered = true;
        }

    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        InventorySetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TempNos: Code[20];
    begin
        if "Register Item No." = '' then begin
            InventorySetup.Get();
            InventorySetup.TestField("Register Item Nos.");
            NoSeriesMgt.InitSeries(InventorySetup."Register Item Nos.", InventorySetup."Register Item Nos.", 0D, "Register Item No.", TempNos);
        end;
        "Company Name" := CompanyName;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    local procedure TestNoSeries()
    var
        InventorySetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        InventorySetup.Get();
        NoSeriesMgt.TestManual(InventorySetup."Register Item Nos.");

    end;

    procedure AssistEdit() Result: Boolean
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        InventorySetup: Record "Inventory Setup";
        ItemCard: Page "Item Card";

    begin
        InventorySetup.Get();
        InventorySetup.TestField("Item Nos.");
        NoSeriesMgt.SelectSeries(InventorySetup."Item Nos.", InventorySetup."Item Nos.", Rec."Item Nos.");
    end;

}
