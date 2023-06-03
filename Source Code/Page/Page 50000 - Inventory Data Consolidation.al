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
        //make group consolidation data
        area(Reporting)
        {
            group("Consolidation Data")
            {
                action("Sales Group Report")
                {
                    Image = Process;
                    trigger OnAction();
                    var
                        SalesGroupReport: Report "Sales Group Report";
                    begin
                        SalesGroupReport.Run();
                    end;
                }
                //make action to open page
                action("Item Ledger Entry")
                {
                    Image = Process;
                    trigger OnAction();
                    var
                        ItemLedgerEntryConsol: Page "Consolidate Item ledger Entry";
                    begin
                        ItemLedgerEntryConsol.Run();
                    end;
                }
                action("Value Entry")
                {
                    Image = Process;
                    trigger OnAction();
                    var
                        ValueEntryConso: Page "Consolidate Value Entry";
                    begin
                        ValueEntryConso.Run();
                    end;
                }

            }
        }

        area(Processing)
        {
            //create action to consolidate data

            action("Consolidate Data")
            {
                Image = Process;
                trigger OnAction();
                var
                    ItemLedgerEntryConsol: Page "Consolidate Item ledger Entry";
                    ValueEntryConso: Page "Consolidate Value Entry";
                    PurchLine: Page "Consolidate Purchase Lines";

                begin
                    if confirm('Consolidation will take several minites') then begin
                        ItemLedgerEntryConsol.ConsolidateDATAITL(true);
                        ValueEntryConso.ConsolidateDATAValueEntry(True);
                        PurchLine.ConsolidateDATAPurchaseLines(True);
                        message('Data Created');
                    end;
                end;
            }
        }
    }
}