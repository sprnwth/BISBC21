page 50031 ItemTrackCodeAdmin
{
    ApplicationArea = All;
    Caption = 'ItemTrackCodeAdmin';
    PageType = List;
    SourceTable = "Item Tracking Code";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the code of the record.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the item tracking code.';
                }
                field("Man. Warranty Date Entry Reqd."; Rec."Man. Warranty Date Entry Reqd.")
                {
                    ToolTip = 'Specifies that a warranty date must be entered manually.';
                }
                field("Man. Expir. Date Entry Reqd."; Rec."Man. Expir. Date Entry Reqd.")
                {
                    ToolTip = 'Specifies that items that use this item tracking code must have an expiration date, and that you must enter the expiration date manually. The date formula specified in the Expiration Calculation field on the item card will be ignored.';
                }
                field("Strict Expiration Posting"; Rec."Strict Expiration Posting")
                {
                    ToolTip = 'Specifies if the expiration date is considered when you sell items. For example, you cannot post a sales order for an item that has passed its expiration date.';
                }
                field("Use Expiration Dates"; Rec."Use Expiration Dates")
                {
                    ToolTip = 'Specifies that items that use this item tracking code can have an expiration date. This will enable checks for expiration dates, which can affect performance for documents with many Item Tracking Lines.';
                }
                field("Code for Registration"; Rec."Code for Registration")
                {
                    ToolTip = 'Specifies the value of the Code for Registration field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Set Lot Warehouse Tracking")
            {

                trigger OnAction()
                begin
                    Rec."Lot Warehouse Tracking" := not Rec."Lot Warehouse Tracking";
                    Rec.Modify();
                end;
            }

            action("Set SN Warehouse Tracking")
            {

                trigger OnAction()
                begin
                    Rec."SN Warehouse Tracking" := Not Rec."SN Warehouse Tracking";
                    Rec.Modify();
                end;
            }
        }
    }
}