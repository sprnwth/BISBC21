pageextension 50045 "Item Journal Ext" extends "Item Journal"
{
    layout
    {
        // addafter("Unit of Measure Code")
        // {
        //     field("UOM Name"; Rec."UOM Name")
        //     {
        //         ApplicationArea = All;

        //     }
        // }


        modify("Bin Code")
        {
            Visible = true;
        }

        modify("Reason Code")
        {
            Visible = true;
            ApplicationArea = All;
        }
        modify(Description)
        {
            Visible = true;
        }
    }

    actions
    {
        addlast(Reporting)
        {
            action("Transfer Out Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Caption = 'ใบปรับปรุงสินค้า';
                //Image = Report;

                trigger OnAction()
                var
                    ItemJournalLineL: Record "Item Journal Line";
                begin
                    ItemJournalLineL.Reset();
                    ItemJournalLineL.SetRange("Document No.", Rec."Document No.");
                    if ItemJournalLineL.FindFirst() then;

                    Report.Run(Report::"Item Journal report", true, true, ItemJournalLineL);

                end;
            }
        }
    }
}