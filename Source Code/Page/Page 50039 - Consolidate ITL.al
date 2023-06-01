page 50039 "Consolidate Item ledger Entry"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Consolidate Item ledger Entry";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(CompanyName; Rec.CompanyName)
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Entry Type"; Rec."Entry Type")
                {

                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                }

                field(Open; Rec.Open)
                {
                }
                field("Order Type"; Rec."Order Type")
                {
                }
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
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
            action("GET Item ledger entry")
            {
                Image = CheckDuplicates;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction();
                var
                begin
                    ConsolidateDATAITL(false);
                end;
            }
        }
    }
    var
        ItmeLedgerEntryG: Record "Item Ledger Entry";
        ConsolItemLedgerG: Record "Consolidate Item ledger Entry";

    procedure ConsolidateDATAITL(ShowDialog: Boolean)
    var
        CompanyRec: Record Company;
        //EntryL: Integer;
        dt: DataTransfer;
        ProgressBar: Codeunit "Progress Dialog";
    begin
        ConsolItemLedgerG.Reset();
        ConsolItemLedgerG.deleteall;
        if ShowDialog then
            ProgressBar.OpenCopyCountMax('Consolidate Item Ledger Entry', CompanyRec.Count);
        If CompanyRec.FindSet() then
            repeat
                ItmeLedgerEntryG.ChangeCompany(CompanyRec.CurrentCompany);
                ItmeLedgerEntryG.SetAutoCalcFields("Shortcut Dimension 3 Code",
                                                    "Shortcut Dimension 4 Code",
                                                    "Shortcut Dimension 5 Code",
                                                    "Shortcut Dimension 6 Code",
                                                    "Shortcut Dimension 7 Code",
                                                    "Shortcut Dimension 8 Code");
                if ItmeLedgerEntryG.FindSet() then
                    repeat
                        ConsolItemLedgerG.TransferFields(ItmeLedgerEntryG);

                        //ConsolItemLedgerG."Entry No." := EntryL;
                        ConsolItemLedgerG.CompanyName := CompanyRec.Name;
                        ConsolItemLedgerG."Shortcut Dimension 3 Code" := ItmeLedgerEntryG."Shortcut Dimension 3 Code";
                        ConsolItemLedgerG."Shortcut Dimension 4 Code" := ItmeLedgerEntryG."Shortcut Dimension 4 Code";
                        ConsolItemLedgerG."Shortcut Dimension 5 Code" := ItmeLedgerEntryG."Shortcut Dimension 5 Code";
                        ConsolItemLedgerG."Shortcut Dimension 6 Code" := ItmeLedgerEntryG."Shortcut Dimension 6 Code";
                        ConsolItemLedgerG."Shortcut Dimension 7 Code" := ItmeLedgerEntryG."Shortcut Dimension 7 Code";
                        ConsolItemLedgerG."Shortcut Dimension 8 Code" := ItmeLedgerEntryG."Shortcut Dimension 8 Code";
                        
                        ConsolItemLedgerG.Insert();
                    until ItmeLedgerEntryG.Next() = 0;
                if ShowDialog then
                    ProgressBar.UpdateCopyCount();
            until CompanyRec.Next() = 0;
    end;

}