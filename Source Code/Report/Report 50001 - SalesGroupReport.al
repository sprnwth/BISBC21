report 50001 "Sales Group Report"
{
    ApplicationArea = All;
    Caption = 'Sales Group Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = LayoutName;
    dataset
    {
        dataitem("Consolidate Item ledger Entry"; "Consolidate Item ledger Entry")
        {
            DataItemTableView = where("Entry Type" = const(Sale));
            RequestFilterFields = CompanyName, "Posting Date", "Document No.", "Source No.";
            column(Posting_Date; "Posting Date")
            {
            }
            column(SalesPersonCode; SalesPerson.Code)
            {

            }
            column(SalesPersonName; SalesPerson.Name)
            {

            }
            column(Source_No_; "Source No.")
            {

            }
            column(CustomerName; Customer.Name)
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Description; Description)
            {

            }
            column(UOM; UOM.Description)
            {

            }
            column(InvPostingGroup; GenPostingGroup)
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(CompanyName; CompanyName)
            {

            }
            column(InvNo; InvNo)
            {

            }
            column(InvQty; InvQty)
            {

            }
            column(FreeQty; FreeQty)
            {

            }
            column(SalesAmt; SalesAmt)
            {

            }
            column(Item_Category_Code; ItemCategory.Description)
            {

            }

            column(Invdate; Invdate)
            {

            }

            column(CNAmt; CNAmt)
            {

            }
            column(NetQyt; NetQyt)
            {

            }
            column(CustomerType; CustomerType.Description)
            {

            }
            column(CustomerBusType; CustomerBusType.Description)
            {

            }
            column(ChainName; ChainName.Description)
            {

            }
            column(Vendor; Vendor.Name)
            {

            }
            column(ItemGoodType; Item."Goods Type")
            {

            }
            column(Brand; Item.Brand)
            {

            }
            column(SalesArea; SalesArea)
            {

            }
            column(Entry_No_;"Entry No.")
            {
                
            }

            trigger OnAfterGetRecord()

            begin

                //Data as company++
                SalesAmt := 0;
                FreeQty := 0;
                InvNo := '';
                InvQty := 0;
                NetQyt := 0;
                CNAmt := 0;
                SalesArea := '';
                SalesPerson.reset;

                ItemCategory.ChangeCompany(CompanyName);
                if not ItemCategory.get("Item Category Code") then
                    ItemCategory.Init();

                ConsolVE.Reset();
                ConsolVE.setrange(CompanyName, CompanyName);
                ConsolVE.setrange("Item Ledger Entry No.", "Entry No.");
                ConsolVE.FindSet();
                if ConsolVE.FindSet() then begin
                    SalesArea := ConsolVE."Shortcut Dimension 5 Code"; // Area Sales
                    GenPostingGroup := ConsolVE."Gen. Prod. Posting Group";
                    SalesPerson.ChangeCompany(CompanyName);
                    if not SalesPerson.get(ConsolVE."Salespers./Purch. Code") then
                        SalesPerson.Init();

                    repeat
                        SalesAmt += ConsolVE."Sales Amount (Actual)";
                        if ConsolVE."Invoiced Quantity" <> 0 then begin
                            InvQty := -ConsolVE."Invoiced Quantity";
                            InvNo := ConsolVE."Document No.";
                            Invdate := ConsolVE."Posting Date";
                        end;

                    until ConsolVE.Next() = 0;
                end else
                    ConsolVE.Init();


                if SalesAmt = 0 then
                    CurrReport.Skip();

                //FIND CN++
                if InvNo <> '' then begin
                    SCH.ChangeCompany(CompanyName);
                    ItemLedgerEntry.ChangeCompany(CompanyName);
                    ValueEntry.ChangeCompany(CompanyName);
                    SCH.Reset();
                    SCH.setrange("Applies-to Doc. No.", InvNo);
                    if SCH.FindFirst() then begin

                        ItemLedgerEntry.Reset();
                        ItemLedgerEntry.setrange("Document No.", SCH."No.");
                        ItemLedgerEntry.setrange("Item No.", "Item No.");
                        if ItemLedgerEntry.FindFirst() then begin
                            ValueEntry.Reset();
                            ValueEntry.setrange("Item Ledger Entry No.", ItemLedgerEntry."Entry No.");
                            ValueEntry.CalcSums("Sales Amount (Actual)");
                            CNAmt := ValueEntry."Sales Amount (Actual)";
                        end;

                    end;
                end;
                //FIND CN--

                //FIND Free++
                FreeAmt := 0;
                ItemLedgerEntry.Reset();
                ItemLedgerEntry.setrange("Document No.", "Document No.");
                ItemLedgerEntry.setrange("Item No.", "Item No.");
                ItemLedgerEntry.setfilter("Entry No.", '<>%1', "Entry No.");
                if ItemLedgerEntry.FindFirst() then begin
                    ValueEntry.Reset();
                    ValueEntry.setrange("Item Ledger Entry No.", ItemLedgerEntry."Entry No.");
                    if ValueEntry.FindSet() then
                        repeat
                            FreeAmt += ValueEntry."Sales Amount (Actual)";
                            FreeQty := -ValueEntry."Invoiced Quantity";
                        until ValueEntry.Next() = 0;
                end;
                if FreeAmt <> 0 then
                    FreeQty := 0;
                //FIND Free--

                if "Qty. per Unit of Measure" <> 1 then begin
                    if "Qty. per Unit of Measure" <> 0 then begin
                        InvQty := InvQty / "Qty. per Unit of Measure";
                        FreeQty := FreeQty / "Qty. per Unit of Measure";
                        NetQyt := InvQty + FreeQty;
                    end;
                end;

                Customer.ChangeCompany(CompanyName);
                if not Customer.get("Source No.") then
                    Customer.Init();
                UOM.ChangeCompany(CompanyName);
                if Not UOM.get("Unit of Measure Code") then
                    UOM.Init();

                CustomerType.ChangeCompany(CompanyName);
                CustomerBusType.ChangeCompany(CompanyName);
                ChainName.ChangeCompany(CompanyName);
                Vendor.ChangeCompany(CompanyName);
                Item.ChangeCompany(CompanyName);

                if Not CustomerType.get(Customer."Customer Type") then
                    CustomerType.Init();
                if Not CustomerBusType.get(Customer."Business Type") then
                    CustomerBusType.Init();
                if Not ChainName.get(Customer."Customer Chain Code") then
                    ChainName.Init();

                if Item.get("Item No.") then begin
                    if Not Vendor.get(Item."Vendor No.") then
                        Vendor.Init();
                end;

                //Data as company--    
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
            LayoutFile = './Source Code/ReportLayout/SalesGroupReport.rdlc';
        }
    }

    trigger OnPreReport()
    var
        ItemLedgerEntryConsol: Page "Consolidate Item ledger Entry";
        ValueEntryConso: Page "Consolidate Value Entry";
        PurchLine: Page "Consolidate Purchase Lines";
    begin
        // ItemLedgerEntryConsol.ConsolidateDATAITL(True);
        // ValueEntryConso.ConsolidateDATAValueEntry(True);
        // PurchLine.ConsolidateDATAPurchaseLines(True);
    end;

    var
        SalesAmt: Decimal;
        InvQty: Decimal;
        InvNo: Code[20];
        Invdate: date;
        FreeQty: Decimal;
        ConsolVE: Record "Consolidate Value Entry";
        SalesPerson: Record "Salesperson/Purchaser";
        CompanyRec: Record Company;
        Customer: Record Customer;
        Item: Record Item;
        UOM: Record "Unit of Measure";
        NetQyt: Decimal;
        InvoiceAmt: Decimal;
        CNAmt: Decimal;
        SCH: Record "Sales Cr.Memo Header";
        SCL: Record "Sales Cr.Memo Line";
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        CustomerType: Record customerType;
        CustomerBusType: Record customerbusinessType;
        ChainName: Record customerChain;
        Vendor: Record Vendor;
        FreeAmt: Decimal;
        SalesArea: Code[20];
        GenPostingGroup: Code[20];
        ItemCategory: Record "Item Category";

}
