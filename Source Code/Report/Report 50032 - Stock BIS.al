report 50032 "Stock BIS"
{
    ApplicationArea = All;
    Caption = 'Stock BIS';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            CalcFields = "Qty. on Purch. Order", "Qty. on Sales Order", Inventory
                            , "Base UOM Description";
            column(Grade; Grade)
            {

            }
            column(No_Item; "No.")
            {
            }
            column(VendorName; Vendor.Name)
            {

            }
            column(Description_Item; Description)
            {
            }
            column(Base_UOM_Description; "Base UOM Description")
            {

            }
            column(BaseUnitofMeasure_Item; "Base Unit of Measure")
            {
            }
            column(MinimumOrderQuantity_Item; "Minimum Order Quantity")
            {
            }
            column(MaximumInventory_Item; "Maximum Inventory")
            {
            }
            column(QtyonPurchOrder_Item; "Qty. on Purch. Order")
            {
            }
            column(Inventory_Item; Inventory)
            {
            }
            column(QtyOnPO; QtyOnPO)
            {

            }
            column(QtyOnSO; QtyOnSO)
            {

            }
            column(OutStdPO; OutStdPO)
            {

            }
            column(OutstdSO; OutstdSO)
            {

            }

            trigger OnAfterGetRecord()
            begin

                QtyOnPO := 0;
                OutStdPO := 0;
                OutstdSO := 0;
                PurchLine.Reset();
                PurchLine.setrange(Type, PurchLine.Type::Item);
                PurchLine.setrange("No.", "No.");
                if PurchLine.FindSet() then
                    repeat
                        QtyOnPO += PurchLine.Quantity;
                        OutStdPO += PurchLine."Outstanding Quantity";
                    until PurchLine.Next() = 0;

                QtyOnSO := 0;
                SalesLine.Reset();
                SalesLine.setrange(Type, SalesLine.Type::Item);
                SalesLine.setrange("No.", "No.");
                if SalesLine.FindSet() then
                    repeat
                        QtyOnSO += SalesLine.Quantity;
                        OutstdSO += SalesLine."Outstanding Quantity";
                    until SalesLine.Next() = 0;

                if not Vendor.get("Vendor No.") then
                    Vendor.Init();

            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
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
            LayoutFile = './Source Code/ReportLayout/StockBIS.rdl';
        }
    }
    var
        UOM: Record "Unit of Measure";
        PurchLine: Record "Purchase Line";
        SalesLine: Record "Sales Line";
        QtyOnPO: Decimal;
        QtyOnSO: Decimal;
        OutstdSO: Decimal;
        OutStdPO: Decimal;
        Vendor: Record Vendor;

}
