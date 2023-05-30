pageextension 50062 "Item Reclass Ext" extends "Item Reclass. Journal"
{

    layout
    {
        modify(Description)
        {
            Visible = true;
        }
    }


    actions
    {
        addlast(Reporting)
        {
            action("Item In Report")
            {
                ApplicationArea = All;
                Caption = 'ใบโอนสินค้า';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ItemJournalLineL: Record "Item Journal Line";
                    OptionReport: Text[250];
                    Selected: Integer;
                    Text0001: Label 'ใบโอนสินค้าเข้า,ใบโอนสินค้าออก';
                    Text0002: Label 'กรุณาเลือกรายงาน สำหรับทำการแสดงผล:';
                begin
                    OptionReport := Text0001;
                    Selected := Dialog.STRMENU(OptionReport, 1, Text0002);

                    case Selected of
                        1:
                            begin
                                ItemJournalLineL.Reset();
                                ItemJournalLineL.SetRange("Journal Template Name", Rec."Journal Template Name");
                                ItemJournalLineL.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                                ItemJournalLineL.SetRange("Document No.", Rec."Document No.");
                                if ItemJournalLineL.FindFirst() then;

                                Report.Run(Report::"Item Reclass In", true, true, ItemJournalLineL);

                            end;
                        2:
                            begin
                                ItemJournalLineL.Reset();
                                ItemJournalLineL.SetRange("Journal Template Name", Rec."Journal Template Name");
                                ItemJournalLineL.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                                ItemJournalLineL.SetRange("Document No.", Rec."Document No.");
                                if ItemJournalLineL.FindFirst() then;

                                Report.Run(Report::"Item Reclass Out", true, true, ItemJournalLineL);

                            end;

                    end;

                end;

            }
        }
    }
}