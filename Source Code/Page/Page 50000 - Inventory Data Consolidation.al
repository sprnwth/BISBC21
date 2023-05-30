page 50000 "Inventory Data Consolidation"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {

        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Consolidation Data")
            {
                Image = Process;
                trigger OnAction();
                var
                    ItemLedgerEntryConsol: Page "Consolidate Item ledger Entry";
                    ValueEntryConso: Page "Consolidate Value Entry";
                    PurchLine: Page "Consolidate Purchase Lines";
                   
                begin
                    if confirm('Consolidation will take several minites') then begin
                        ItemLedgerEntryConsol.ConsolidateDATAITL(False);
                        ValueEntryConso.ConsolidateDATAValueEntry(False);
                        PurchLine.ConsolidateDATAPurchaseLines(False);
                        message('Data Created');
                   
                       
                    end;
                end;
            }
        }
    }
}