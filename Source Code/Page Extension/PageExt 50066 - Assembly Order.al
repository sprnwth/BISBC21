pageextension 50066 "Assembly_Order_Ext" extends "Assembly Order"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("UOM Name"; Rec."UOM Name")
            {
                Caption = 'Unit of Measure Name';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst(Reporting)
        {
            action("Assembly Order")
            {
                ApplicationArea = All;
                Caption = 'Assembly Order';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    AssemblyOrderL: Record "Assembly Header";
                    AssemblyReportL: Report "Assembly Order New";
                begin
                    AssemblyOrderL.Reset();
                    AssemblyOrderL.SetRange("Document Type", AssemblyOrderL."Document Type"::Order);
                    AssemblyOrderL.SetRange("No.", Rec."No.");
                    if AssemblyOrderL.FindFirst() then
                        Report.Run(Report::"Assembly Order New", true, false, AssemblyOrderL);
                end;
            }
        }
    }
}