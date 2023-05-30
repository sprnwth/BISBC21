page 50030 "Warehouse Entry Admin"
{
    ApplicationArea = All;
    Caption = 'Warehouse Entry Admin';
    PageType = List;
    SourceTable = "Warehouse Entry";
    Permissions = tabledata "Warehouse Entry" = rimd;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ToolTip = 'Specifies the name of the journal batch, a personalized journal layout, that the entries were posted from.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the line number of the warehouse document line or warehouse journal line that was registered.';
                }
                field("Registering Date"; Rec."Registering Date")
                {
                    ToolTip = 'Specifies the date the entry was registered.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the code of the location to which the entry is linked.';
                }
                field("Zone Code"; Rec."Zone Code")
                {
                    ToolTip = 'Specifies the code of the zone to which the entry is linked.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ToolTip = 'Specifies the bin where the items are picked or put away.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the warehouse entry.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item in the entry.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the number of units of the item in the warehouse entry.';
                }
                field("Qty. (Base)"; Rec."Qty. (Base)")
                {
                    ToolTip = 'Specifies the quantity of the entry, in the base unit of measure.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the table number that is the source of the entry line, for example, 39 for a purchase line, 37 for a sales line.';
                }
                field("Source Subtype"; Rec."Source Subtype")
                {
                    ToolTip = 'Specifies the source subtype of the document to which the warehouse entry line relates.';
                }
                field("Source No."; Rec."Source No.")
                {
                    ToolTip = 'Specifies the number of the source document that the entry originates from.';
                }
                field("Source Line No."; Rec."Source Line No.")
                {
                    ToolTip = 'Specifies the line number of the source document that the entry originates from.';
                }
                field("Source Subline No."; Rec."Source Subline No.")
                {
                    ToolTip = 'Specifies the source subline number of the document from which the entry originates.';
                }
                field("Source Document"; Rec."Source Document")
                {
                    ToolTip = 'Specifies the type of document that the line relates to.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the number series from which entry or record numbers are assigned to new entries or records.';
                }
                field("Bin Type Code"; Rec."Bin Type Code")
                {
                    ToolTip = 'Specifies the value of the Bin Type Code field.';
                }
                field(Cubage; Rec.Cubage)
                {
                    ToolTip = 'Specifies the total cubage of the items on the warehouse entry line.';
                }
                field(Weight; Rec.Weight)
                {
                    ToolTip = 'Specifies the weight of one item unit when measured in the specified unit of measure.';
                }
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ToolTip = 'Specifies the name of the journal template, the basis of the journal batch, that the entries were posted from.';
                }
                field("Whse. Document No."; Rec."Whse. Document No.")
                {
                    ToolTip = 'Specifies the number of the warehouse document from which this entry originated.';
                }
                field("Whse. Document Type"; Rec."Whse. Document Type")
                {
                    ToolTip = 'Specifies the type of the document from which this entry originated.';
                }
                field("Whse. Document Line No."; Rec."Whse. Document Line No.")
                {
                    ToolTip = 'Specifies the value of the Whse. Document Line No. field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies the entry type, which can be Negative Adjmt., Positive Adjmt., or Movement.';
                }
                field("Reference Document"; Rec."Reference Document")
                {
                    ToolTip = 'Specifies the value of the Reference Document field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the variant of the item on the line.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ToolTip = 'Specifies the number of base units of measure that are in the unit of measure specified for the item on the line.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the serial number.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ToolTip = 'Specifies the lot number assigned to the warehouse entry.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ToolTip = 'Specifies the value of the Warranty Date field.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ToolTip = 'Specifies the expiration date of the serial number.';
                }
                field("Package No."; Rec."Package No.")
                {
                    ToolTip = 'Specifies the package number assigned to the warehouse entry.';
                }
                field("Phys Invt Counting Period Code"; Rec."Phys Invt Counting Period Code")
                {
                    ToolTip = 'Specifies the value of the Phys Invt Counting Period Code field.';
                }
                field("Phys Invt Counting Period Type"; Rec."Phys Invt Counting Period Type")
                {
                    ToolTip = 'Specifies the value of the Phys Invt Counting Period Type field.';
                }
                field(Dedicated; Rec.Dedicated)
                {
                    ToolTip = 'Specifies the value of the Dedicated field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }
}
