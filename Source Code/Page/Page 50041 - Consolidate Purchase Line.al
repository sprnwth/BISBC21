page 50041 "Consolidate Purchase Lines"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Consolidate Purchase Line";
    SourceTableView = sorting(CompanyName);
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(CompanyName; Rec.CompanyName)
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Reserved Qty. (Base)"; Rec."Reserved Qty. (Base)")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
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
            action("GET Purchase Line")
            {
                Image = CheckDuplicates;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction();
                var
                begin
                    ConsolidateDATAPurchaseLines(False);
                end;
            }
        }
    }
    var
        SIL: page "Posted Sales Invoice Subform";
        Co: Page "Company Consolidation Wizard";
        PurchasLinesG: Record "Purchase Line";
        ConsolPurchaseLinesG: Record "Consolidate Purchase Line";

    procedure ConsolidateDATAPurchaseLines(ShowDialog: Boolean)
    var
        CompanyRec: Record Company;
        EntryL: Integer;
        LineNoL: Integer;
        dt: DataTransfer;
        ProgressBar: Codeunit "Progress Dialog";
    begin
        ConsolPurchaseLinesG.Reset();
        ConsolPurchaseLinesG.DeleteAll();
        if ShowDialog then
            ProgressBar.OpenCopyCountMax('Consolidate Purchase Lines', CompanyRec.Count);
        If CompanyRec.FindSet() then
            repeat
                PurchasLinesG.ChangeCompany(CompanyRec.CurrentCompany);
                if PurchasLinesG.FindSet() then
                    repeat
                        ConsolPurchaseLinesG.TransferFields(PurchasLinesG);
                        ConsolPurchaseLinesG.CompanyName := CompanyRec.Name;
                        ConsolPurchaseLinesG.Insert();
                    until PurchasLinesG.Next() = 0;
                if ShowDialog then
                    ProgressBar.UpdateCopyCount();
            until CompanyRec.Next() = 0;
    end;

}