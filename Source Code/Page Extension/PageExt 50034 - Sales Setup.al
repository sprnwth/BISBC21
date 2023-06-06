pageextension 50034 SalesSetupBISExt extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Allow Document Deletion Before")
        {
            field("ISO for SI";Rec."ISO for SI")
            {
                ApplicationArea = All;
                
            }
            field("Max Overdue Date"; Rec."Max Overdue Date")
            {
                ApplicationArea = All;
            }
            field("Autoblock after create"; Rec."Autoblock after create")
            {
                ApplicationArea = All;
            }
            field("Force Sales Person by Rel."; Rec."Force Sales Person by Rel.")
            {
                ApplicationArea = All;

            }
            field("Copy Ship. to Item Charge"; Rec."Copy Ship. to Item Charge")
            {
                ApplicationArea = All;
            }

            field("Customer Work Flow"; Rec."Customer Workflow Code")
            {
                ApplicationArea = All;
            }

            field("Order Work Flow"; Rec."Order Workflow Code")
            {
                ApplicationArea = All;
            }
            field("Max Credit Limit";Rec."Max Credit Limit")
            {
                ApplicationArea = All;
                ToolTip = 'Max Credit Limit for Office before escalate to director';
            }
            field("Skip Desc. Line Get Ship.";Rec."Skip Desc. Line Get Ship.")
            {
                ApplicationArea = All;
               
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: page "Sales Cr. Memo Subform";
}