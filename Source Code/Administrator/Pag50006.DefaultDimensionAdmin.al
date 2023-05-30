page 50006 DefaultDimensionAdmin
{
    ApplicationArea = All;
    Caption = 'DefaultDimensionAdmin';
    PageType = List;
    SourceTable = "Default Dimension";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ToolTip = 'Specifies a table ID for the account type if you are specifying default dimensions for an entire account type.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the account number you wish to define a default dimension for.';
                }
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ToolTip = 'Specifies the code for the default dimension.';
                }
                field("Dimension Value Code"; Rec."Dimension Value Code")
                {
                    ToolTip = 'Specifies the dimension value code to suggest as the default dimension.';
                }
                field("Value Posting"; Rec."Value Posting")
                {
                    ToolTip = 'Specifies how default dimensions and their values must be used.';
                }
                field("Table Caption"; Rec."Table Caption")
                {
                    ToolTip = 'Specifies the table name for the account type you wish to define a default dimension for.';
                }
                field("Multi Selection Action"; Rec."Multi Selection Action")
                {
                    ToolTip = 'Specifies the value of the Multi Selection Action field.';
                }
                field("Parent Type"; Rec."Parent Type")
                {
                    ToolTip = 'Specifies the value of the Parent Type field.';
                }
                field("Allowed Values Filter"; Rec."Allowed Values Filter")
                {
                    ToolTip = 'Specifies the dimension values that can be used for the selected account.';
                }
                field(ParentId; Rec.ParentId)
                {
                    ToolTip = 'Specifies the value of the ParentId field.';
                }
                field(DimensionId; Rec.DimensionId)
                {
                    ToolTip = 'Specifies the value of the DimensionId field.';
                }
                field(DimensionValueId; Rec.DimensionValueId)
                {
                    ToolTip = 'Specifies the value of the DimensionValueId field.';
                }
            }
        }
    }
}
