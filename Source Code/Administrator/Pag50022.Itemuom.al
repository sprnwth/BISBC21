page 50022 ItemuomAdmin
{
    ApplicationArea = All;
    Caption = 'Itemuom';
    PageType = List;
    SourceTable = "Item Unit of Measure";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item card from which you opened the Item Units of Measure window.';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies a code to identify the unit of measure.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ToolTip = 'Specifies how many of the base unit of measure are contained in one unit of the item.';
                }
                field("Qty. Rounding Precision"; Rec."Qty. Rounding Precision")
                {
                    ToolTip = 'Specifies the value of the Qty. Rounding Precision field.';
                }
                field(Length; Rec.Length)
                {
                    ToolTip = 'Specifies the length of one item unit when measured in the specified unit of measure.';
                }
                field(Width; Rec.Width)
                {
                    ToolTip = 'Specifies the width of one item unit when measured in the specified unit of measure.';
                }
                field(Height; Rec.Height)
                {
                    ToolTip = 'Specifies the height of one item unit when measured in the unit of measure in the Code field.';
                }
                field(Cubage; Rec.Cubage)
                {
                    ToolTip = 'Specifies the volume (cubage) of one item unit in the unit of measure in the Code field.';
                }
                field(Weight; Rec.Weight)
                {
                    ToolTip = 'Specifies the weight of one item unit when measured in the specified unit of measure.';
                }
                field("Pack Size"; Rec."Pack Size")
                {
                    ToolTip = 'Specifies the value of the Pack Size field.';
                }
                field("Pack UOM"; Rec."Pack UOM")
                {
                    ToolTip = 'Specifies the value of the Pack UOM field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Pack UOM Description"; Rec."Pack UOM Description")
                {
                    ToolTip = 'Specifies the value of the Pack UOM Description field.';
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
