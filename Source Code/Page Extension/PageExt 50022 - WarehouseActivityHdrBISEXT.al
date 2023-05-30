pageextension 50022 WarehouseActivityHdrBISEXT extends "Warehouse Pick"
{
    layout
    {
        addafter("No.")
        {
            field("Approve break FEFO"; Rec."Approve break FEFO")
            {
                ApplicationArea = All;

            }
            field("Sender USERID"; Rec."Sender USERID")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Approve USERID"; Rec."Approve USERID")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        addfirst(Reporting)
        {
            action("Pick Report")
            {
                Caption = 'Picking Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    WhsePickL: Record "Warehouse Activity Header";
                begin
                    WhsePickL.Reset();
                    WhsePickL.SetRange("No.", Rec."No.");
                    if WhsePickL.FindFirst() then
                        Report.Run(Report::"Picking Report New", true, false, WhsePickL);
                end;
            }
        }
    }
}
