page 50044 "Purchase Line Archive"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Purchase Line Archive";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(PostingDate; PostingDate)
                {

                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {


                }
                field("Document No."; Rec."Document No.")
                {


                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {

                }
                field("No."; Rec."No.")
                {


                }
                field(Description; Rec.Description)
                {

                }
                field(Quantity; Rec.Quantity)
                {

                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {

                }
                field("Location Code"; Rec."Location Code")
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction();
                begin

                end;
            }
        }
    }

    trigger OnAfterGetRecord()

    begin
        PostingDate := 0D;
        if PAH.get(Rec."Document Type", Rec."Document No.") then
            PostingDate := PAH."Posting Date";
    end;

    var
        PostingDate: Date;
        PAH: Record "Purchase Header Archive";
}