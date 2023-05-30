report 50012 ItemsMissingUnit
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Report Items Missing Unit';

    dataset
    {
        dataitem(DataItems; Item)
        {
            column(ItemNo; "No.")
            {

            }
            column(BaseUnitOfMeasure; "Base Unit of Measure")
            {

            }
            column(SalesUnitOfMeasure; "Sales Unit of Measure")
            {

            }
            column(PurchUnitOfMeasure; "Purch. Unit of Measure")
            {

            }
            column(AssemblyBOM; "Assembly BOM")
            {

            }

            dataitem(DataItemsBom; "BOM Component")
            {
                DataItemLink = "Parent Item No." = field("No.");
                DataItemLinkReference = DataItems;
                // DataItemTableView = sorting(Code);
                column("BomNo"; "No.")
                {

                }
                column("BomParentItemNo"; "Parent Item No.")
                {

                }
                column("BomDescription"; Description)
                {

                }
                column(BomUnitOfMeasureCode; "Unit of Measure Code")
                {

                }

                trigger OnAfterGetRecord()

                begin
                    if (GetItemUnitOfMeasure.Get("No.", "Unit of Measure Code")) then begin
                        CurrReport.Skip();
                    end;
                end;
            }

            trigger OnAfterGetRecord()

            var
                GetBomComponent: Record "BOM Component";
                CountBomMissing: Integer;
                GetItemUnitOfMeasureLoop: Record "Item Unit of Measure";
                GetItemUnitOfMeasureLoopCount: Boolean;
            begin
                // Check Bom Unit
                CountBomMissing := 0;
                GetItemUnitOfMeasureLoopCount := GetItemUnitOfMeasureLoop.Get(GetBomComponent."Unit of Measure Code");
                GetBomComponent.Reset();
                GetBomComponent.SetRange("Parent Item No.", "No.");
                if GetBomComponent.findset() then
                    repeat
                        GetItemUnitOfMeasureLoopCount := GetItemUnitOfMeasureLoop.Get(GetBomComponent."Unit of Measure Code");
                        if (GetBomComponent."Unit of Measure Code" = '') or (GetItemUnitOfMeasureLoopCount = true) then
                            CountBomMissing += 1;
                    until GetBomComponent.Next() = 0;
                // End Check Bom Unit

                // Show/Hide row where missing unit
                if ("Base Unit of Measure" <> '') and
                ("Sales Unit of Measure" <> '') and
                ("Purch. Unit of Measure" <> '') then begin
                    if (GetBaseUnitOfMeasure.Get("Base Unit of Measure")) and
                    (GetItemUnitOfMeasure.Get("No.", "Sales Unit of Measure")) and
                    (GetItemUnitOfMeasure.Get("No.", "Purch. Unit of Measure")) and
                    ("Assembly BOM" = false) then begin
                        CurrReport.Skip();
                    end;
                end;

                // There are BOMs and Item unit is correct
                if ("Assembly BOM" = true) and (CountBomMissing = 0) then
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
            }
        }

        actions
        {
            area(processing)
            {
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/ReportItemsMissingUnit.rdl';
        }
    }

    trigger OnPreReport()
    var
    // countMissingBomUnit: Integer;
    begin

    end;

    var
        GetVendor: Record Vendor;
        GetBaseUnitOfMeasure: Record "Unit of Measure";
        GetItemUnitOfMeasure: Record "Item Unit of Measure";
        countMissingBomUnit: Integer;




}