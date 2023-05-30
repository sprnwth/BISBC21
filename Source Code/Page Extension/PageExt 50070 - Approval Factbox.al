pageextension 50070 ApprovalFactBoxExt extends "Approval FactBox"
{
    layout
    {
        // Add changes to page layout here
        addafter(Comment)
        {
            field("Reason 1"; Rec."Reason 1")
            {
                ApplicationArea = All;
            }
            field("Reason 2"; Rec."Reason 2")
            {
                ApplicationArea = All;

            }
            field("Reason 3"; Rec."Reason 3")
            {
                ApplicationArea = All;
            }
            field("Reason 4"; Rec."Reason 4")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }



}