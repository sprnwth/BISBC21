// table 50105 SalesLineApi
// {
//     DataClassification = ToBeClassified;
//     // LookupPageID = "Sales Lines";

//     fields
//     {
//         field(1; "Document Type"; Enum "Sales Document Type")
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(3; "Document No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(4; "Line No."; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(5; "Type"; Enum "Sales Line Type")
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(6; "No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Item;
//         }
//         field(11; "Description"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(15; "Quantity"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(22; "Unit Price"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(2; "Sell-to Customer No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Customer;
//         }
//         field(74; "Gen. Bus. Posting Group"; Code[20])
//         {
//             Caption = 'Gen. Bus. Posting Group';
//             TableRelation = "Gen. Business Posting Group";
//         }
//         field(68; "Bill-to Customer No."; Code[20])
//         {
//             Caption = 'Bill-to Customer No.';
//             Editable = false;
//             TableRelation = Customer;
//         }
//         field(50001; "Transfer Status"; Text[100])
//         {
//             Caption = 'Transfer Status';
//         }
//     }

//     keys
//     {
//         key(Key1; "Document Type", "Document No.", "Line No.")
//         {
//             Clustered = true;
//         }
//     }

//     var
//         myInt: Integer;

//     trigger OnInsert()
//     begin

//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

// }

// // table 37 "Sales Line"
// // {
// //     Caption = 'Sales Line';
// //     DrillDownPageID = "Sales Lines";
// //     LookupPageID = "Sales Lines";
// //     Permissions = TableData "Sales Line" = m;

// //     fields
// //     {
// //         field(1; "Document Type"; Enum "Sales Document Type")
// //         {
// //             Caption = 'Document Type';
// //         }
// //         field(2; "Sell-to Customer No."; Code[20])
// //         {
// //             Caption = 'Sell-to Customer No.';
// //         }
// //         field(3; "Document No."; Code[20])
// //         {
// //             Caption = 'Document No.';
// //         }
// //         field(4; "Line No."; Integer)
// //         {
// //             Caption = 'Line No.';
// //         }
// //         field(5; Type; Enum "Sales Line Type")
// //         {
// //             Caption = 'Type';
// //         }
// //         field(6; "No."; Code[20])
// //         {
// //             Caption = 'No.';
// //         }
// //         field(7; "Location Code"; Code[10])
// //         {
// //             Caption = 'Location Code';
// //         }
// //         field(8; "Posting Group"; Code[20])
// //         {
// //             Caption = 'Posting Group';
// //         }
// //         field(10; "Shipment Date"; Date)
// //         {
// //             Caption = 'Shipment Date';
// //         }
// //         field(11; Description; Text[100])
// //         {
// //             Caption = 'Description';
// //         }
// //         field(12; "Description 2"; Text[50])
// //         {
// //             Caption = 'Description 2';
// //         }
// //         field(13; "Unit of Measure"; Text[50])
// //         {
// //             Caption = 'Unit of Measure';
// //         }
// //         field(15; Quantity; Decimal)
// //         {
// //             Caption = 'Quantity';
// //         }
// //         field(16; "Outstanding Quantity"; Decimal)
// //         {
// //             Caption = 'Outstanding Quantity';
// //         }
// //         field(17; "Qty. to Invoice"; Decimal)
// //         {
// //             Caption = 'Qty. to Invoice';
// //         }
// //         field(18; "Qty. to Ship"; Decimal)
// //         {
// //             Caption = 'Qty. to Ship';
// //         }
// //         field(22; "Unit Price"; Decimal)
// //         {
// //             Caption = 'Unit Price';
// //         }
// //         field(23; "Unit Cost (LCY)"; Decimal)
// //         {
// //             Caption = 'Unit Cost (LCY)';
// //         }
// //         field(25; "VAT %"; Decimal)
// //         {
// //             Caption = 'VAT %';
// //         }
// //         field(27; "Line Discount %"; Decimal)
// //         {
// //             Caption = 'Line Discount %';
// //         }
// //         field(28; "Line Discount Amount"; Decimal)
// //         {
// //             Caption = 'Line Discount Amount';
// //         }
// //         field(29; Amount; Decimal)
// //         {
// //             Caption = 'Amount';
// //         }
// //         field(30; "Amount Including VAT"; Decimal)
// //         {
// //             Caption = 'Amount Including VAT';
// //         }
// //         field(32; "Allow Invoice Disc."; Boolean)
// //         {
// //             Caption = 'Allow Invoice Disc.';
// //         }
// //         field(34; "Gross Weight"; Decimal)
// //         {
// //             Caption = 'Gross Weight';
// //         }
// //         field(35; "Net Weight"; Decimal)
// //         {
// //             Caption = 'Net Weight';
// //         }
// //         field(36; "Units per Parcel"; Decimal)
// //         {
// //             Caption = 'Units per Parcel';
// //         }
// //         field(37; "Unit Volume"; Decimal)
// //         {
// //             Caption = 'Unit Volume';
// //         }
// //         field(38; "Appl.-to Item Entry"; Integer)
// //         {
// //             Caption = 'Appl.-to Item Entry';
// //         }
// //         field(40; "Shortcut Dimension 1 Code"; Code[20])
// //         {
// //             Caption = 'Shortcut Dimension 1 Code';
// //         }
// //         field(41; "Shortcut Dimension 2 Code"; Code[20])
// //         {
// //             Caption = 'Shortcut Dimension 2 Code';
// //         }
// //         field(42; "Customer Price Group"; Code[10])
// //         {
// //             Caption = 'Customer Price Group';
// //         }
// //         field(45; "Job No."; Code[20])
// //         {
// //             Caption = 'Job No.';
// //         }
// //         field(52; "Work Type Code"; Code[10])
// //         {
// //             Caption = 'Work Type Code';
// //         }
// //         field(56; "Recalculate Invoice Disc."; Boolean)
// //         {
// //             Caption = 'Recalculate Invoice Disc.';
// //         }
// //         field(57; "Outstanding Amount"; Decimal)
// //         {
// //             Caption = 'Outstanding Amount';
// //         }
// //         field(58; "Qty. Shipped Not Invoiced"; Decimal)
// //         {
// //             Caption = 'Qty. Shipped Not Invoiced';
// //         }
// //         field(59; "Shipped Not Invoiced"; Decimal)
// //         {
// //             Caption = 'Shipped Not Invoiced';
// //         }
// //         field(60; "Quantity Shipped"; Decimal)
// //         {
// //             Caption = 'Quantity Shipped';
// //         }
// //         field(61; "Quantity Invoiced"; Decimal)
// //         {
// //             Caption = 'Quantity Invoiced';
// //         }
// //         field(63; "Shipment No."; Code[20])
// //         {
// //             Caption = 'Shipment No.';
// //         }
// //         field(64; "Shipment Line No."; Integer)
// //         {
// //             Caption = 'Shipment Line No.';
// //         }
// //         field(67; "Profit %"; Decimal)
// //         {
// //             Caption = 'Profit %';
// //         }
// //         field(68; "Bill-to Customer No."; Code[20])
// //         {
// //             Caption = 'Bill-to Customer No.';
// //         }
// //         field(69; "Inv. Discount Amount"; Decimal)
// //         {
// //             Caption = 'Inv. Discount Amount';
// //         }
// //         field(71; "Purchase Order No."; Code[20])
// //         {
// //             Caption = 'Purchase Order No.';
// //         }
// //         field(72; "Purch. Order Line No."; Integer)
// //         {
// //             Caption = 'Purch. Order Line No.';
// //         }
// //         field(73; "Drop Shipment"; Boolean)
// //         {
// //             Caption = 'Drop Shipment';
// //         }
// //         field(74; "Gen. Bus. Posting Group"; Code[20])
// //         {
// //             Caption = 'Gen. Bus. Posting Group';
// //         }
// //         field(75; "Gen. Prod. Posting Group"; Code[20])
// //         {
// //             Caption = 'Gen. Prod. Posting Group';
// //         }
// //         field(77; "VAT Calculation Type"; Enum "Tax Calculation Type")
// //         {
// //             Caption = 'VAT Calculation Type';
// //         }
// //         field(78; "Transaction Type"; Code[10])
// //         {
// //             Caption = 'Transaction Type';
// //         }
// //         field(79; "Transport Method"; Code[10])
// //         {
// //             Caption = 'Transport Method';
// //         }
// //         field(80; "Attached to Line No."; Integer)
// //         {
// //             Caption = 'Attached to Line No.';
// //         }
// //         field(81; "Exit Point"; Code[10])
// //         {
// //             Caption = 'Exit Point';
// //         }
// //         field(82; "Area"; Code[10])
// //         {
// //             Caption = 'Area';
// //         }
// //         field(83; "Transaction Specification"; Code[10])
// //         {
// //             Caption = 'Transaction Specification';
// //         }
// //         field(84; "Tax Category"; Code[10])
// //         {
// //             Caption = 'Tax Category';
// //         }
// //         field(85; "Tax Area Code"; Code[20])
// //         {
// //             Caption = 'Tax Area Code';
// //         }
// //         field(86; "Tax Liable"; Boolean)
// //         {
// //             Caption = 'Tax Liable';
// //         }
// //         field(87; "Tax Group Code"; Code[20])
// //         {
// //             Caption = 'Tax Group Code';
// //         }
// //         field(88; "VAT Clause Code"; Code[20])
// //         {
// //             Caption = 'VAT Clause Code';
// //             TableRelation = "VAT Clause";
// //         }
// //         field(89; "VAT Bus. Posting Group"; Code[20])
// //         {
// //             Caption = 'VAT Bus. Posting Group';
// //         }
// //         field(90; "VAT Prod. Posting Group"; Code[20])
// //         {
// //             Caption = 'VAT Prod. Posting Group';
// //         }
// //         field(91; "Currency Code"; Code[10])
// //         {
// //             Caption = 'Currency Code';
// //         }
// //         field(92; "Outstanding Amount (LCY)"; Decimal)
// //         {
// //             Caption = 'Outstanding Amount (LCY)';
// //         }
// //         field(93; "Shipped Not Invoiced (LCY)"; Decimal)
// //         {
// //             AutoFormatType = 1;
// //             Caption = 'Shipped Not Invoiced (LCY) Incl. VAT';
// //             Editable = false;
// //         }
// //         field(94; "Shipped Not Inv. (LCY) No VAT"; Decimal)
// //         {
// //             Caption = 'Shipped Not Invoiced (LCY)';
// //             Editable = false;
// //             FieldClass = Normal;
// //         }
// //         field(95; "Reserved Quantity"; Decimal)
// //         {
// //             AccessByPermission = TableData "Sales Shipment Header" = R;
// //             CalcFormula = - Sum("Reservation Entry".Quantity WHERE("Source ID" = FIELD("Document No."),
// //                                                                    "Source Ref. No." = FIELD("Line No."),
// //                                                                    "Source Type" = CONST(37),
// // #pragma warning disable
// //                                                                    "Source Subtype" = FIELD("Document Type"),
// // #pragma warning restore
// //                                                                    "Reservation Status" = CONST(Reservation)));
// //             Caption = 'Reserved Quantity';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //             FieldClass = FlowField;
// //         }
// //         field(96; Reserve; Enum "Reserve Method")
// //         {
// //             AccessByPermission = TableData Item = R;
// //             Caption = 'Reserve';

// //             trigger OnValidate()
// //             var
// //                 Item: Record Item;
// //             begin
// //                 if Reserve <> Reserve::Never then begin
// //                     TestField(Type, Type::Item);
// //                     TestField("No.");
// //                     GetItem(Item);
// //                     if IsNonInventoriableItem() then
// //                         Error(NonInvReserveTypeErr, Item."No.", Reserve);
// //                 end;

// //                 CalcFields("Reserved Qty. (Base)");
// //                 if (Reserve = Reserve::Never) and ("Reserved Qty. (Base)" > 0) then
// //                     TestField("Reserved Qty. (Base)", 0);

// //                 if "Drop Shipment" or "Special Order" then
// //                     TestField(Reserve, Reserve::Never);
// //                 if xRec.Reserve = Reserve::Always then begin
// //                     GetItem(Item);
// //                     if Item.Reserve = Item.Reserve::Always then
// //                         TestField(Reserve, Reserve::Always);
// //                 end;
// //             end;
// //         }
// //         field(97; "Blanket Order No."; Code[20])
// //         {
// //             AccessByPermission = TableData "Sales Shipment Header" = R;
// //             Caption = 'Blanket Order No.';
// //             TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST("Blanket Order"));
// //             //This property is currently not supported
// //             //TestTableRelation = false;

// //             trigger OnLookup()
// //             begin
// //                 BlanketOrderLookup();
// //             end;

// //             trigger OnValidate()
// //             var
// //                 IsHandled: Boolean;
// //             begin
// //                 IsHandled := false;
// //                 OnBeforeValidateBlanketOrderNo(Rec, xRec, CurrFieldNo, IsHandled);
// //                 if IsHandled then
// //                     exit;

// //                 TestField("Quantity Shipped", 0);
// //                 if "Blanket Order No." = '' then
// //                     "Blanket Order Line No." := 0
// //                 else
// //                     Validate("Blanket Order Line No.");
// //             end;
// //         }
// //         field(98; "Blanket Order Line No."; Integer)
// //         {
// //             AccessByPermission = TableData "Sales Shipment Header" = R;
// //             Caption = 'Blanket Order Line No.';
// //             TableRelation = "Sales Line"."Line No." WHERE("Document Type" = CONST("Blanket Order"),
// //                                                            "Document No." = FIELD("Blanket Order No."));
// //             //This property is currently not supported
// //             //TestTableRelation = false;

// //             trigger OnLookup()
// //             begin
// //                 BlanketOrderLookup();
// //             end;

// //             trigger OnValidate()
// //             var
// //                 IsHandled: Boolean;
// //             begin
// //                 IsHandled := false;
// //                 OnBeforeValidateBlanketOrderLineNo(IsHandled, Rec);
// //                 if IsHandled then
// //                     exit;

// //                 TestField("Quantity Shipped", 0);
// //                 if "Blanket Order Line No." <> 0 then begin
// //                     SalesLine2.Get("Document Type"::"Blanket Order", "Blanket Order No.", "Blanket Order Line No.");
// //                     SalesLine2.TestField(Type, Type);
// //                     SalesLine2.TestField("No.", "No.");
// //                     SalesLine2.TestField("Bill-to Customer No.", "Bill-to Customer No.");
// //                     SalesLine2.TestField("Sell-to Customer No.", "Sell-to Customer No.");
// //                     if "Drop Shipment" or "Special Order" then begin
// //                         SalesLine2.TestField("Variant Code", "Variant Code");
// //                         SalesLine2.TestField("Location Code", "Location Code");
// //                         SalesLine2.TestField("Unit of Measure Code", "Unit of Measure Code");
// //                     end else begin
// //                         Validate("Variant Code", SalesLine2."Variant Code");
// //                         Validate("Location Code", SalesLine2."Location Code");
// //                         Validate("Unit of Measure Code", SalesLine2."Unit of Measure Code");
// //                     end;
// //                     Validate("Unit Price", SalesLine2."Unit Price");
// //                     Validate("Line Discount %", SalesLine2."Line Discount %");

// //                     OnAfterValidateBlanketOrderLineNo(Rec, SalesLine2);
// //                 end;
// //             end;
// //         }
// //         field(99; "VAT Base Amount"; Decimal)
// //         {
// //             AutoFormatExpression = "Currency Code";
// //             AutoFormatType = 1;
// //             Caption = 'VAT Base Amount';
// //             Editable = false;
// //         }
// //         field(100; "Unit Cost"; Decimal)
// //         {
// //             AutoFormatExpression = "Currency Code";
// //             AutoFormatType = 2;
// //             Caption = 'Unit Cost';
// //             Editable = false;
// //         }
// //         field(101; "System-Created Entry"; Boolean)
// //         {
// //             Caption = 'System-Created Entry';
// //             Editable = false;
// //         }
// //         field(103; "Line Amount"; Decimal)
// //         {
// //             Caption = 'Line Amount';
// //         }
// //         field(104; "VAT Difference"; Decimal)
// //         {
// //             Caption = 'VAT Difference';
// //         }
// //         field(105; "Inv. Disc. Amount to Invoice"; Decimal)
// //         {
// //             Caption = 'Inv. Disc. Amount to Invoice';
// //         }
// //         field(106; "VAT Identifier"; Code[20])
// //         {
// //             Caption = 'VAT Identifier';
// //         }
// //         field(107; "IC Partner Ref. Type"; Enum "IC Partner Reference Type")
// //         {
// //             Caption = 'IC Partner Ref. Type';
// //         }
// //         field(108; "IC Partner Reference"; Code[20])
// //         {
// //             Caption = 'IC Partner Reference';
// //         }
// //         field(109; "Prepayment %"; Decimal)
// //         {
// //             Caption = 'Prepayment %';
// //         }
// //         field(110; "Prepmt. Line Amount"; Decimal)
// //         {
// //             Caption = 'Prepmt. Line Amount';
// //         }
// //         field(111; "Prepmt. Amt. Inv."; Decimal)
// //         {
// //             Caption = 'Prepmt. Amt. Inv.';
// //         }
// //         field(112; "Prepmt. Amt. Incl. VAT"; Decimal)
// //         {
// //             Caption = 'Prepmt. Amt. Incl. VAT';
// //         }
// //         field(113; "Prepayment Amount"; Decimal)
// //         {
// //             Caption = 'Prepayment Amount';
// //         }
// //         field(114; "Prepmt. VAT Base Amt."; Decimal)
// //         {
// //             Caption = 'Prepmt. VAT Base Amt.';
// //         }
// //         field(115; "Prepayment VAT %"; Decimal)
// //         {
// //             Caption = 'Prepayment VAT %';
// //         }
// //         field(116; "Prepmt. VAT Calc. Type"; Enum "Tax Calculation Type")
// //         {
// //             Caption = 'Prepmt. VAT Calc. Type';
// //         }
// //         field(117; "Prepayment VAT Identifier"; Code[20])
// //         {
// //             Caption = 'Prepayment VAT Identifier';
// //         }
// //         field(118; "Prepayment Tax Area Code"; Code[20])
// //         {
// //             Caption = 'Prepayment Tax Area Code';
// //         }
// //         field(119; "Prepayment Tax Liable"; Boolean)
// //         {
// //             Caption = 'Prepayment Tax Liable';
// //         }
// //         field(120; "Prepayment Tax Group Code"; Code[20])
// //         {
// //             Caption = 'Prepayment Tax Group Code';
// //         }
// //         field(121; "Prepmt Amt to Deduct"; Decimal)
// //         {
// //             Caption = 'Prepmt Amt to Deduct';
// //         }
// //         field(122; "Prepmt Amt Deducted"; Decimal)
// //         {
// //             Caption = 'Prepmt Amt Deducted';
// //         }
// //         field(123; "Prepayment Line"; Boolean)
// //         {
// //             Caption = 'Prepayment Line';
// //         }
// //         field(124; "Prepmt. Amount Inv. Incl. VAT"; Decimal)
// //         {
// //             Caption = 'Prepmt. Amount Inv. Incl. VAT';
// //         }
// //         field(129; "Prepmt. Amount Inv. (LCY)"; Decimal)
// //         {
// //             Caption = 'Prepmt. Amount Inv. (LCY)';
// //         }
// //         field(130; "IC Partner Code"; Code[20])
// //         {
// //             Caption = 'IC Partner Code';
// //         }
// //         field(132; "Prepmt. VAT Amount Inv. (LCY)"; Decimal)
// //         {
// //             Caption = 'Prepmt. VAT Amount Inv. (LCY)';
// //         }
// //         field(135; "Prepayment VAT Difference"; Decimal)
// //         {
// //             Caption = 'Prepayment VAT Difference';
// //         }
// //         field(136; "Prepmt VAT Diff. to Deduct"; Decimal)
// //         {
// //             Caption = 'Prepmt VAT Diff. to Deduct';
// //         }
// //         field(137; "Prepmt VAT Diff. Deducted"; Decimal)
// //         {
// //             Caption = 'Prepmt VAT Diff. Deducted';
// //         }
// //         field(138; "IC Item Reference No."; Code[50])
// //         {
// //             Caption = 'IC Item Reference No.';
// //         }
// //         field(145; "Pmt. Discount Amount"; Decimal)
// //         {
// //             Caption = 'Pmt. Discount Amount';
// //         }
// //         field(146; "Prepmt. Pmt. Discount Amount"; Decimal)
// //         {
// //             Caption = 'Prepmt. Pmt. Discount Amount';
// //         }
// //         field(180; "Line Discount Calculation"; Option)
// //         {
// //             Caption = 'Line Discount Calculation';
// //         }
// //         field(480; "Dimension Set ID"; Integer)
// //         {
// //             Caption = 'Dimension Set ID';
// //         }
// //         field(900; "Qty. to Assemble to Order"; Decimal)
// //         {
// //             Caption = 'Qty. to Assemble to Order';
// //         }
// //         field(901; "Qty. to Asm. to Order (Base)"; Decimal)
// //         {
// //             Caption = 'Qty. to Asm. to Order (Base)';
// //         }
// //         field(902; "ATO Whse. Outstanding Qty."; Decimal)
// //         {
// //             Caption = 'ATO Whse. Outstanding Qty.';
// //         }
// //         field(903; "ATO Whse. Outstd. Qty. (Base)"; Decimal)
// //         {
// //             Caption = 'ATO Whse. Outstd. Qty. (Base)';
// //         }
// //         field(1001; "Job Task No."; Code[20])
// //         {
// //             Caption = 'Job Task No.';
// //         }
// //         field(1002; "Job Contract Entry No."; Integer)
// //         {
// //             Caption = 'Job Contract Entry No.';
// //         }
// //         field(1300; "Posting Date"; Date)
// //         {
// //             CalcFormula = Lookup("Sales Header"."Posting Date" WHERE("Document Type" = FIELD("Document Type"),
// //                                                                       "No." = FIELD("Document No.")));
// //             Caption = 'Posting Date';
// //             FieldClass = FlowField;
// //         }
// //         field(1700; "Deferral Code"; Code[10])
// //         {
// //             Caption = 'Deferral Code';
// //         }
// //         field(1702; "Returns Deferral Start Date"; Date)
// //         {
// //             Caption = 'Returns Deferral Start Date';
// //         }
// //         field(5402; "Variant Code"; Code[10])
// //         {
// //             Caption = 'Variant Code';
// //         }
// //         field(5403; "Bin Code"; Code[20])
// //         {
// //             Caption = 'Bin Code';
// //         }
// //         field(5404; "Qty. per Unit of Measure"; Decimal)
// //         {
// //             Caption = 'Qty. per Unit of Measure';
// //         }
// //         field(5405; Planned; Boolean)
// //         {
// //             Caption = 'Planned';
// //         }
// //         field(5406; "Qty. Rounding Precision"; Decimal)
// //         {
// //             Caption = 'Qty. Rounding Precision';
// //         }
// //         field(5408; "Qty. Rounding Precision (Base)"; Decimal)
// //         {
// //             Caption = 'Qty. Rounding Precision (Base)';
// //         }
// //         field(5407; "Unit of Measure Code"; Code[10])
// //         {
// //             Caption = 'Unit of Measure Code';
// //         }
// //         field(5415; "Quantity (Base)"; Decimal)
// //         {
// //             Caption = 'Quantity (Base)';
// //         }
// //         field(5416; "Outstanding Qty. (Base)"; Decimal)
// //         {
// //             Caption = 'Outstanding Qty. (Base)';
// //         }
// //         field(5417; "Qty. to Invoice (Base)"; Decimal)
// //         {
// //             Caption = 'Qty. to Invoice (Base)';
// //         }
// //         field(5418; "Qty. to Ship (Base)"; Decimal)
// //         {
// //             Caption = 'Qty. to Ship (Base)';
// //         }
// //         field(5458; "Qty. Shipped Not Invd. (Base)"; Decimal)
// //         {
// //             Caption = 'Qty. Shipped Not Invd. (Base)';
// //         }
// //         field(5460; "Qty. Shipped (Base)"; Decimal)
// //         {
// //             Caption = 'Qty. Shipped (Base)';
// //         }
// //         field(5461; "Qty. Invoiced (Base)"; Decimal)
// //         {
// //             Caption = 'Qty. Invoiced (Base)';
// //         }
// //         field(5495; "Reserved Qty. (Base)"; Decimal)
// //         {
// //             Caption = 'Reserved Qty. (Base)';
// //         }
// //         field(5600; "FA Posting Date"; Date)
// //         {
// //             Caption = 'FA Posting Date';
// //         }
// //         field(5602; "Depreciation Book Code"; Code[10])
// //         {
// //             Caption = 'Depreciation Book Code';
// //         }
// //         field(5605; "Depr. until FA Posting Date"; Boolean)
// //         {
// //             Caption = 'Depr. until FA Posting Date';
// //         }
// //         field(5612; "Duplicate in Depreciation Book"; Code[10])
// //         {
// //             Caption = 'Duplicate in Depreciation Book';
// //         }
// //         field(5613; "Use Duplication List"; Boolean)
// //         {
// //             Caption = 'Use Duplication List';
// //         }
// //         field(5700; "Responsibility Center"; Code[10])
// //         {
// //             Caption = 'Responsibility Center';
// //         }
// //         field(5701; "Out-of-Stock Substitution"; Boolean)
// //         {
// //             Caption = 'Out-of-Stock Substitution';
// //         }
// //         field(5702; "Substitution Available"; Boolean)
// //         {
// //             Caption = 'Substitution Available';
// //         }
// //         field(5703; "Originally Ordered No."; Code[20])
// //         {
// //             Caption = 'Originally Ordered No.';
// //         }
// //         field(5704; "Originally Ordered Var. Code"; Code[10])
// //         {
// //             Caption = 'Originally Ordered Var. Code';
// //         }
// //         field(5705; "Cross-Reference No."; Code[20])
// //         {
// //             Caption = 'Cross-Reference No.';
// //         }
// //         field(5706; "Unit of Measure (Cross Ref.)"; Code[10])
// //         {
// //             Caption = 'Unit of Measure (Cross Ref.)';
// //         }
// //         field(5707; "Cross-Reference Type"; Option)
// //         {
// //             Caption = 'Cross-Reference Type';
// //             OptionCaption = ' ,Customer,Vendor,Bar Code';
// //             OptionMembers = " ",Customer,Vendor,"Bar Code";
// //             ObsoleteReason = 'Cross-Reference replaced by Item Reference feature.';
// // #if not CLEAN19
// //             ObsoleteState = Pending;
// //             ObsoleteTag = '17.0';
// // #else
// //             ObsoleteState = Removed;
// //             ObsoleteTag = '20.0';
// // #endif
// //         }
// //         field(5708; "Cross-Reference Type No."; Code[30])
// //         {
// //             Caption = 'Cross-Reference Type No.';
// //         }
// //         field(5709; "Item Category Code"; Code[20])
// //         {
// //             Caption = 'Item Category Code';
// //         }
// //         field(5710; Nonstock; Boolean)
// //         {
// //             Caption = 'Catalog';
// //         }
// //         field(5711; "Purchasing Code"; Code[10])
// //         {
// //             Caption = 'Purchasing Code';
// //         }
// //         field(5712; "Product Group Code"; Code[10])
// //         {
// //             Caption = 'Product Group Code';
// //             ObsoleteReason = 'Product Groups became first level children of Item Categories.';
// //             ObsoleteState = Removed;
// //             ObsoleteTag = '15.0';
// //         }
// //         field(5713; "Special Order"; Boolean)
// //         {
// //             AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
// //             Caption = 'Special Order';
// //             Editable = false;
// //         }
// //         field(5714; "Special Order Purchase No."; Code[20])
// //         {
// //             AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
// //             Caption = 'Special Order Purchase No.';
// //             TableRelation = IF ("Special Order" = CONST(true)) "Purchase Header"."No." WHERE("Document Type" = CONST(Order));
// //         }
// //         field(5715; "Special Order Purch. Line No."; Integer)
// //         {
// //             AccessByPermission = TableData "Drop Shpt. Post. Buffer" = R;
// //             Caption = 'Special Order Purch. Line No.';
// //             TableRelation = IF ("Special Order" = CONST(true)) "Purchase Line"."Line No." WHERE("Document Type" = CONST(Order),
// //                                                                                                "Document No." = FIELD("Special Order Purchase No."));
// //         }
// //         field(5725; "Item Reference No."; Code[50])
// //         {
// //             AccessByPermission = TableData "Item Reference" = R;
// //             Caption = 'Item Reference No.';

// //             trigger OnLookup()
// //             begin
// //                 GetSalesHeader();
// //                 ItemReferenceMgt.SalesReferenceNoLookUp(Rec, SalesHeader);
// //             end;

// //             trigger OnValidate()
// //             var
// //                 ItemReference: Record "Item Reference";
// //             begin
// //                 GetSalesHeader();
// //                 "Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
// //                 ItemReferenceMgt.ValidateSalesReferenceNo(Rec, SalesHeader, ItemReference, true, CurrFieldNo);
// //             end;
// //         }
// //         field(5726; "Item Reference Unit of Measure"; Code[10])
// //         {
// //             AccessByPermission = TableData "Item Reference" = R;
// //             Caption = 'Reference Unit of Measure';
// //             TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
// //         }
// //         field(5727; "Item Reference Type"; Enum "Item Reference Type")
// //         {
// //             Caption = 'Item Reference Type';
// //         }
// //         field(5728; "Item Reference Type No."; Code[30])
// //         {
// //             Caption = 'Item Reference Type No.';
// //         }
// //         field(5749; "Whse. Outstanding Qty."; Decimal)
// //         {
// //             AccessByPermission = TableData Location = R;
// //             BlankZero = true;
// //             CalcFormula = Sum("Warehouse Shipment Line"."Qty. Outstanding" WHERE("Source Type" = CONST(37),
// // #pragma warning disable
// //                                                                                   "Source Subtype" = FIELD("Document Type"),
// // #pragma warning restore
// //                                                                                   "Source No." = FIELD("Document No."),
// //                                                                                   "Source Line No." = FIELD("Line No.")));
// //             Caption = 'Whse. Outstanding Qty.';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //             FieldClass = FlowField;
// //         }
// //         field(5750; "Whse. Outstanding Qty. (Base)"; Decimal)
// //         {
// //             AccessByPermission = TableData Location = R;
// //             BlankZero = true;
// //             CalcFormula = Sum("Warehouse Shipment Line"."Qty. Outstanding (Base)" WHERE("Source Type" = CONST(37),
// // #pragma warning disable
// //                                                                                          "Source Subtype" = FIELD("Document Type"),
// // #pragma warning restore
// //                                                                                          "Source No." = FIELD("Document No."),
// //                                                                                          "Source Line No." = FIELD("Line No.")));
// //             Caption = 'Whse. Outstanding Qty. (Base)';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //             FieldClass = FlowField;
// //         }
// //         field(5752; "Completely Shipped"; Boolean)
// //         {
// //             Caption = 'Completely Shipped';
// //             Editable = false;
// //         }
// //         field(5790; "Requested Delivery Date"; Date)
// //         {
// //             Caption = 'Requested Delivery Date';

// //             trigger OnValidate()
// //             var
// //                 IsHandled: Boolean;
// //             begin
// //                 TestStatusOpen();

// //                 IsHandled := false;
// //                 OnBeforeValidateRequestedDeliveryDate(Rec, IsHandled);
// //                 If IsHandled then
// //                     exit;

// //                 CheckPromisedDeliveryDate();

// //                 if "Requested Delivery Date" <> 0D then
// //                     Validate("Planned Delivery Date", CalcPlannedDeliveryDate(FieldNo("Requested Delivery Date")))
// //                 else begin
// //                     GetSalesHeader();
// //                     Validate("Shipment Date", SalesHeader."Shipment Date");
// //                 end;
// //             end;
// //         }
// //         field(5791; "Promised Delivery Date"; Date)
// //         {
// //             AccessByPermission = TableData "Order Promising Line" = R;
// //             Caption = 'Promised Delivery Date';

// //             trigger OnValidate()
// //             var
// //                 IsHandled: Boolean;
// //             begin
// //                 TestStatusOpen();

// //                 IsHandled := false;
// //                 OnBeforeValidatePromisedDeliveryDate(Rec, IsHandled);
// //                 If IsHandled then
// //                     exit;

// //                 if "Promised Delivery Date" <> 0D then
// //                     Validate("Planned Delivery Date", "Promised Delivery Date")
// //                 else
// //                     Validate("Requested Delivery Date");
// //             end;
// //         }
// //         field(5792; "Shipping Time"; DateFormula)
// //         {
// //             AccessByPermission = TableData "Order Promising Line" = R;
// //             Caption = 'Shipping Time';

// //             trigger OnValidate()
// //             begin
// //                 TestStatusOpen();
// //                 if "Drop Shipment" then
// //                     DateFormularZero("Shipping Time", FieldNo("Shipping Time"), FieldCaption("Shipping Time"));
// //                 UpdateDates();
// //             end;
// //         }
// //         field(5793; "Outbound Whse. Handling Time"; DateFormula)
// //         {
// //             AccessByPermission = TableData Location = R;
// //             Caption = 'Outbound Whse. Handling Time';

// //             trigger OnValidate()
// //             begin
// //                 TestStatusOpen();
// //                 if "Drop Shipment" then
// //                     DateFormularZero("Outbound Whse. Handling Time",
// //                       FieldNo("Outbound Whse. Handling Time"), FieldCaption("Outbound Whse. Handling Time"));
// //                 UpdateDates();
// //             end;
// //         }
// //         field(5794; "Planned Delivery Date"; Date)
// //         {
// //             AccessByPermission = TableData "Order Promising Line" = R;
// //             Caption = 'Planned Delivery Date';

// //             trigger OnValidate()
// //             var
// //                 IsHandled: boolean;
// //             begin
// //                 IsHandled := false;
// //                 OnBeforeValidatePlannedDeliveryDate(IsHandled, Rec);
// //                 if IsHandled then
// //                     exit;

// //                 TestStatusOpen();
// //                 if "Planned Delivery Date" <> 0D then begin
// //                     PlannedDeliveryDateCalculated := true;

// //                     Validate("Planned Shipment Date", CalcPlannedDate());

// //                     if "Planned Shipment Date" > "Planned Delivery Date" then
// //                         "Planned Delivery Date" := "Planned Shipment Date";
// //                 end;
// //             end;
// //         }
// //         field(5795; "Planned Shipment Date"; Date)
// //         {
// //             AccessByPermission = TableData "Order Promising Line" = R;
// //             Caption = 'Planned Shipment Date';

// //             trigger OnValidate()
// //             var
// //                 IsHandled: boolean;
// //             begin
// //                 IsHandled := false;
// //                 OnBeforeValidatePlannedShipmentDate(IsHandled, Rec);
// //                 if IsHandled then
// //                     exit;

// //                 TestStatusOpen();
// //                 if "Planned Shipment Date" <> 0D then begin
// //                     PlannedShipmentDateCalculated := true;

// //                     Validate("Shipment Date", CalcShipmentDate());
// //                 end;
// //             end;
// //         }
// //         field(5796; "Shipping Agent Code"; Code[10])
// //         {
// //             AccessByPermission = TableData "Shipping Agent Services" = R;
// //             Caption = 'Shipping Agent Code';
// //             TableRelation = "Shipping Agent";

// //             trigger OnValidate()
// //             begin
// //                 TestStatusOpen();
// //                 if "Shipping Agent Code" <> xRec."Shipping Agent Code" then
// //                     Validate("Shipping Agent Service Code", '');
// //             end;
// //         }
// //         field(5797; "Shipping Agent Service Code"; Code[10])
// //         {
// //             AccessByPermission = TableData "Shipping Agent Services" = R;
// //             Caption = 'Shipping Agent Service Code';
// //             TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));

// //             trigger OnValidate()
// //             var
// //                 ShippingAgentServices: Record "Shipping Agent Services";
// //             begin
// //                 TestStatusOpen();
// //                 if "Shipping Agent Service Code" <> xRec."Shipping Agent Service Code" then
// //                     Evaluate("Shipping Time", '<>');

// //                 if "Drop Shipment" then begin
// //                     Evaluate("Shipping Time", '<0D>');
// //                     UpdateDates();
// //                 end else
// //                     if ShippingAgentServices.Get("Shipping Agent Code", "Shipping Agent Service Code") then
// //                         "Shipping Time" := ShippingAgentServices."Shipping Time"
// //                     else begin
// //                         GetSalesHeader();
// //                         "Shipping Time" := SalesHeader."Shipping Time";
// //                     end;

// //                 if "Shipping Time" <> xRec."Shipping Time" then
// //                     Validate("Shipping Time");
// //             end;
// //         }
// //         field(5800; "Allow Item Charge Assignment"; Boolean)
// //         {
// //             AccessByPermission = TableData "Item Charge" = R;
// //             Caption = 'Allow Item Charge Assignment';
// //             InitValue = true;

// //             trigger OnValidate()
// //             begin
// //                 CheckItemChargeAssgnt();
// //             end;
// //         }
// //         field(5801; "Qty. to Assign"; Decimal)
// //         {
// //             CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. to Assign" WHERE("Document Type" = FIELD("Document Type"),
// //                                                                                        "Document No." = FIELD("Document No."),
// //                                                                                        "Document Line No." = FIELD("Line No.")));
// //             Caption = 'Qty. to Assign';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //             FieldClass = FlowField;
// //         }
// //         field(5802; "Qty. Assigned"; Decimal)
// //         {
// //             CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. Assigned" WHERE("Document Type" = FIELD("Document Type"),
// //                                                                                       "Document No." = FIELD("Document No."),
// //                                                                                       "Document Line No." = FIELD("Line No.")));
// //             Caption = 'Qty. Assigned';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //             FieldClass = FlowField;
// //         }
// //         field(5803; "Return Qty. to Receive"; Decimal)
// //         {
// //             AccessByPermission = TableData "Return Receipt Header" = R;
// //             Caption = 'Return Qty. to Receive';
// //             DecimalPlaces = 0 : 5;

// //             trigger OnValidate()
// //             var
// //                 ItemLedgEntry: Record "Item Ledger Entry";
// //                 IsHandled: Boolean;
// //             begin
// //                 if (CurrFieldNo <> 0) and
// //                    (Type = Type::Item) and
// //                    ("Return Qty. to Receive" <> 0) and
// //                    (not "Drop Shipment")
// //                 then
// //                     CheckWarehouse();

// //                 "Return Qty. to Receive" := UOMMgt.RoundAndValidateQty("Return Qty. to Receive", "Qty. Rounding Precision", FieldCaption("Return Qty. to Receive"));

// //                 OnValidateReturnQtyToReceiveOnAfterCheck(Rec, CurrFieldNo);

// //                 if "Return Qty. to Receive" = Quantity - "Return Qty. Received" then
// //                     InitQtyToReceive()
// //                 else begin
// //                     "Return Qty. to Receive (Base)" := CalcBaseQty("Return Qty. to Receive", FieldCaption("Return Qty. to Receive"), FieldCaption("Return Qty. to Receive (Base)"));
// //                     if ("Quantity (Base)" = ("Return Qty. Received (Base)" + "Return Qty. to Receive (Base)")) and ("Return Qty. to Receive" > 0) then
// //                         Error(QuantityImbalanceErr, ItemUOMForCaption.FieldCaption("Qty. Rounding Precision"), Type::Item, "No.", FieldCaption("Return Qty. to Receive"), FieldCaption("Return Qty. to Receive (Base)"));

// //                     InitQtyToInvoice();
// //                 end;

// //                 IsHandled := false;
// //                 OnValidateQtyToReturnAfterInitQty(Rec, xRec, CurrFieldNo, IsHandled);
// //                 if not IsHandled then begin
// //                     if ("Return Qty. to Receive" * Quantity < 0) or
// //                        (Abs("Return Qty. to Receive") > Abs("Outstanding Quantity")) or
// //                        (Quantity * "Outstanding Quantity" < 0)
// //                     then
// //                         Error(Text020, "Outstanding Quantity");
// //                     if ("Return Qty. to Receive (Base)" * "Quantity (Base)" < 0) or
// //                        (Abs("Return Qty. to Receive (Base)") > Abs("Outstanding Qty. (Base)")) or
// //                        ("Quantity (Base)" * "Outstanding Qty. (Base)" < 0)
// //                     then
// //                         Error(Text021, "Outstanding Qty. (Base)");
// //                 end;

// //                 if (CurrFieldNo <> 0) and (Type = Type::Item) and ("Return Qty. to Receive" > 0) then
// //                     CheckApplFromItemLedgEntry(ItemLedgEntry);
// //             end;
// //         }
// //         field(5804; "Return Qty. to Receive (Base)"; Decimal)
// //         {
// //             Caption = 'Return Qty. to Receive (Base)';
// //             DecimalPlaces = 0 : 5;

// //             trigger OnValidate()
// //             var
// //                 IsHandled: Boolean;
// //             begin
// //                 IsHandled := false;
// //                 OnBeforeValidateReturnQtytoReceiveBase(Rec, xRec, CurrFieldNo, IsHandled);
// //                 if IsHandled then
// //                     exit;

// //                 TestField("Qty. per Unit of Measure", 1);
// //                 Validate("Return Qty. to Receive", "Return Qty. to Receive (Base)");
// //             end;
// //         }
// //         field(5805; "Return Qty. Rcd. Not Invd."; Decimal)
// //         {
// //             Caption = 'Return Qty. Rcd. Not Invd.';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //         }
// //         field(5806; "Ret. Qty. Rcd. Not Invd.(Base)"; Decimal)
// //         {
// //             Caption = 'Ret. Qty. Rcd. Not Invd.(Base)';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //         }
// //         field(5807; "Return Rcd. Not Invd."; Decimal)
// //         {
// //             AutoFormatExpression = "Currency Code";
// //             AutoFormatType = 1;
// //             Caption = 'Return Rcd. Not Invd.';
// //             Editable = false;

// //             trigger OnValidate()
// //             var
// //                 Currency2: Record Currency;
// //             begin
// //                 GetSalesHeader();
// //                 Currency2.InitRoundingPrecision();
// //                 if SalesHeader."Currency Code" <> '' then
// //                     "Return Rcd. Not Invd. (LCY)" :=
// //                       Round(
// //                         CurrExchRate.ExchangeAmtFCYToLCY(
// //                           GetDate(), "Currency Code",
// //                           "Return Rcd. Not Invd.", SalesHeader."Currency Factor"),
// //                         Currency2."Amount Rounding Precision")
// //                 else
// //                     "Return Rcd. Not Invd. (LCY)" :=
// //                       Round("Return Rcd. Not Invd.", Currency2."Amount Rounding Precision");
// //             end;
// //         }
// //         field(5808; "Return Rcd. Not Invd. (LCY)"; Decimal)
// //         {
// //             AutoFormatType = 1;
// //             Caption = 'Return Rcd. Not Invd. (LCY)';
// //             Editable = false;
// //         }
// //         field(5809; "Return Qty. Received"; Decimal)
// //         {
// //             AccessByPermission = TableData "Return Receipt Header" = R;
// //             Caption = 'Return Qty. Received';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //         }
// //         field(5810; "Return Qty. Received (Base)"; Decimal)
// //         {
// //             Caption = 'Return Qty. Received (Base)';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //         }
// //         field(5811; "Appl.-from Item Entry"; Integer)
// //         {
// //             AccessByPermission = TableData Item = R;
// //             Caption = 'Appl.-from Item Entry';
// //             MinValue = 0;

// //             trigger OnLookup()
// //             begin
// //                 SelectItemEntry(FieldNo("Appl.-from Item Entry"));
// //             end;

// //             trigger OnValidate()
// //             var
// //                 ItemLedgEntry: Record "Item Ledger Entry";
// //             begin
// //                 if "Appl.-from Item Entry" <> 0 then begin
// //                     CheckApplFromItemLedgEntry(ItemLedgEntry);
// //                     Validate("Unit Cost (LCY)", CalcUnitCost(ItemLedgEntry));
// //                 end;
// //             end;
// //         }
// //         field(5812; "Item Charge Qty. to Handle"; Decimal)
// //         {
// //             CalcFormula = Sum("Item Charge Assignment (Sales)"."Qty. to Handle" WHERE("Document Type" = FIELD("Document Type"),
// //                                                                                        "Document No." = FIELD("Document No."),
// //                                                                                        "Document Line No." = FIELD("Line No.")));
// //             Caption = 'Item Charge Qty. to Handle';
// //             DecimalPlaces = 0 : 5;
// //             Editable = false;
// //             FieldClass = FlowField;
// //         }
// //         field(5909; "BOM Item No."; Code[20])
// //         {
// //             Caption = 'BOM Item No.';
// //             TableRelation = Item;
// //         }
// //         field(6600; "Return Receipt No."; Code[20])
// //         {
// //             Caption = 'Return Receipt No.';
// //             Editable = false;
// //         }
// //         field(6601; "Return Receipt Line No."; Integer)
// //         {
// //             Caption = 'Return Receipt Line No.';
// //             Editable = false;
// //         }
// //         field(6608; "Return Reason Code"; Code[10])
// //         {
// //             Caption = 'Return Reason Code';
// //             TableRelation = "Return Reason";

// //             trigger OnValidate()
// //             begin
// //                 ValidateReturnReasonCode(FieldNo("Return Reason Code"));
// //             end;
// //         }
// //         field(6610; "Copied From Posted Doc."; Boolean)
// //         {
// //             Caption = 'Copied From Posted Doc.';
// //             DataClassification = SystemMetadata;
// //         }
// //         field(7000; "Price Calculation Method"; Enum "Price Calculation Method")
// //         {
// //             Caption = 'Price Calculation Method';
// //         }
// //         field(7001; "Allow Line Disc."; Boolean)
// //         {
// //             Caption = 'Allow Line Disc.';
// //             InitValue = true;
// //         }
// //         field(7002; "Customer Disc. Group"; Code[20])
// //         {
// //             Caption = 'Customer Disc. Group';
// //         }
// //         field(7003; Subtype; Option)
// //         {
// //             Caption = 'Subtype';
// //         }
// //         field(7004; "Price description"; Text[80])
// //         {
// //             Caption = 'Price description';
// //         }
// //         field(7010; "Attached Doc Count"; Integer)
// //         {
// //             Caption = 'Attached Doc Count';
// //         }
// //     }

// //     keys
// //     {
// //         key(Key1; "Document Type", "Document No.", "Line No.")
// //         {
// //             Clustered = true;
// //         }
// //         key(Key2; "Document No.", "Line No.", "Document Type")
// //         {
// //             Enabled = false;
// //         }
// //         key(Key3; "Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Shipment Date")
// //         {
// //             SumIndexFields = "Outstanding Qty. (Base)";
// //         }
// //         key(Key4; "Document Type", "Bill-to Customer No.", "Currency Code", "Document No.")
// //         {
// //             SumIndexFields = "Outstanding Amount", "Shipped Not Invoiced", "Outstanding Amount (LCY)", "Shipped Not Invoiced (LCY)", "Return Rcd. Not Invd. (LCY)";
// //         }
// //         key(Key5; "Document Type", Type, "No.", "Variant Code", "Drop Shipment", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Location Code", "Shipment Date")
// //         {
// //             Enabled = false;
// //             SumIndexFields = "Outstanding Qty. (Base)";
// //         }
// //         key(Key6; "Document Type", "Bill-to Customer No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Currency Code", "Document No.")
// //         {
// //             Enabled = false;
// //             SumIndexFields = "Outstanding Amount", "Shipped Not Invoiced", "Outstanding Amount (LCY)", "Shipped Not Invoiced (LCY)";
// //         }
// //         key(Key7; "Document Type", "Blanket Order No.", "Blanket Order Line No.")
// //         {
// //         }
// //         key(Key8; "Document Type", "Document No.", "Location Code")
// //         {
// //             MaintainSQLIndex = false;
// //             SumIndexFields = Amount, "Amount Including VAT", "Outstanding Amount", "Shipped Not Invoiced", "Outstanding Amount (LCY)", "Shipped Not Invoiced (LCY)";
// //         }
// //         key(Key9; "Document Type", "Shipment No.", "Shipment Line No.")
// //         {
// //         }
// //         key(Key10; Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Document Type", "Shipment Date")
// //         {
// //             MaintainSQLIndex = false;
// //         }
// //         key(Key11; "Document Type", "Sell-to Customer No.", "Shipment No.", "Document No.")
// //         {
// //             SumIndexFields = "Outstanding Amount (LCY)";
// //         }
// //         key(Key12; "Job Contract Entry No.")
// //         {
// //         }
// //         key(Key13; "Document Type", "Document No.", "Qty. Shipped Not Invoiced")
// //         {
// //             Enabled = false;
// //         }
// //         key(Key14; "Document Type", "Document No.", Type, "No.")
// //         {
// //             Enabled = false;
// //         }
// //         key(Key15; "Recalculate Invoice Disc.")
// //         {
// //         }
// //         key(Key16; "Qty. Shipped Not Invoiced")
// //         {
// //         }
// //         key(Key17; "Qty. Shipped (Base)")
// //         {
// //         }
// //         key(Key18; "Shipment Date", "Outstanding Quantity")
// //         {
// //         }
// //         key(Key19; SystemModifiedAt)
// //         {
// //         }
// //         key(Key20; "Completely Shipped")
// //         {
// //         }
// //     }
// // }

