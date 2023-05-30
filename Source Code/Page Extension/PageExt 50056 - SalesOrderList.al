pageextension 50056 SalesOrderList extends "Sales Order List"
{
    layout
    {
        addafter("No.")
        {
            field("Release Date"; Rec."Release Date")
            {
                ApplicationArea = All;

            }
            field("Release Time"; Rec."Release Time")
            {
                ApplicationArea = All;

            }
        }
    }
    actions
    {
        // Add changes to page actions here
        addafter("F&unctions")
        {

            action("ฟอร์มจดหมาย (คลัง)")
            {
                ApplicationArea = All;
                image = Print;
                trigger OnAction()
                var
                    LetterReport: Report LetterofOrder;
                    SalesHdr: Record "Sales Header";
                begin
                    SalesHdr.SetRange("No.", Rec."No.");
                    Report.Run(Report::LetterofOrder, true, true, SalesHdr);
                end;
            }
        }
    }
}