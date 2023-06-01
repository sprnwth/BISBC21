page 50040 "Consolidate Value Entry"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Consolidate Value Entry";


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
                field(Quantity; Rec."Valued Quantity")
                {
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                }
                field("Remaining Quantity"; Rec."Item Ledger Entry Quantity")
                {
                }
                field("Sales Amount (Actual)"; Rec."Sales Amount (Actual)")
                {
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                }
                field("Cost Amount (Non-Invtbl.)"; Rec."Cost Amount (Non-Invtbl.)")
                {
                }

                field("Order Type"; Rec."Order Type")
                {
                }
                field("Entry No."; Rec."Entry No.")
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
            action("GET Value Entry")
            {
                Image = CheckDuplicates;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction();
                var
                begin
                    ConsolidateDATAValueEntry(False);
                end;
            }
        }
    }
    var
        Co: Page "Company Consolidation Wizard";
        ValueEntryG: Record "Value Entry";
        ConsolValueEntrieG: Record "Consolidate Value Entry";

    procedure ConsolidateDATAValueEntry(ShowDialog: Boolean)
    var
        CompanyRec: Record Company;
        Customer: Record Customer;
        //EntryL: Integer;
        SalesPerson: Record "Salesperson/Purchaser";
        ProgressBar: Codeunit "Progress Dialog";
    begin
        ConsolValueEntrieG.Reset();
        ConsolValueEntrieG.deleteall();
        if ShowDialog then
            ProgressBar.OpenCopyCountMax('Consolidate Value Entry', CompanyRec.Count);
        If CompanyRec.FindSet() then
            repeat
                ValueEntryG.ChangeCompany(CompanyRec.CurrentCompany);
                ValueEntryG.SetAutoCalcFields("Shortcut Dimension 3 Code",
                                                "Shortcut Dimension 4 Code",
                                                "Shortcut Dimension 5 Code",
                                                "Shortcut Dimension 6 Code",
                                                "Shortcut Dimension 7 Code",
                                                "Shortcut Dimension 8 Code");
                if ValueEntryG.FindSet() then
                    repeat
                        ConsolValueEntrieG.TransferFields(ValueEntryG);
                      
                        ConsolValueEntrieG.CompanyName := CompanyRec.Name;
                        ConsolValueEntrieG."Shortcut Dimension 3 Code" := ValueEntryG."Shortcut Dimension 3 Code";
                        ConsolValueEntrieG."Shortcut Dimension 4 Code" := ValueEntryG."Shortcut Dimension 4 Code";
                        ConsolValueEntrieG."Shortcut Dimension 5 Code" := ValueEntryG."Shortcut Dimension 5 Code";
                        ConsolValueEntrieG."Shortcut Dimension 6 Code" := ValueEntryG."Shortcut Dimension 6 Code";
                        ConsolValueEntrieG."Shortcut Dimension 7 Code" := ValueEntryG."Shortcut Dimension 7 Code";
                        ConsolValueEntrieG."Shortcut Dimension 8 Code" := ValueEntryG."Shortcut Dimension 8 Code";

                        ConsolValueEntrieG.Insert();
                    until ValueEntryG.Next() = 0;
                if ShowDialog then
                    ProgressBar.UpdateCopyCount();
            until CompanyRec.Next() = 0;
    end;

}