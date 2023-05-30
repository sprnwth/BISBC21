report 50041 "Analysis Gross Profi New"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Analysis Gross Profit New';


    dataset
    {
        dataitem("Value Entry"; "Value Entry")
        {
            DataItemTableView = sorting("Source No.", "Item No.") order(ascending) where("Document Type" = filter("Sales Invoice" | "Sales Credit Memo"));
            RequestFilterFields = "Source No.", "Item No.";
            column(Item_No_; "Item No.")
            {

            }
            column(Customer_No; "Source No.")
            {

            }
            column(CompanyInfomationG; CompanyInfomationG.Name)
            {

            }
            column(PrintDateG; PrintDateG)
            {

            }
            column(SummaryStartDateFilterG; SummaryStartDateFilterG)
            {

            }
            column(SummaryEndDateFilterG; SummaryEndDateFilterG)
            {

            }
            column(DateFilterTxt; DateFilterTxt)
            {

            }
            column(ShowAllSummaryG; ShowAllSummaryG)
            {

            }
            column(ShowSummaryByCustG; ShowSummaryByCustG)
            {

            }
            column(Description; ItemsG.Description)
            {

            }
            column(Vendor_No_; VendorG."Vendor Chain Code")
            {

            }
            column(Goods_Type; ItemsG."Goods Type")
            {

            }
            column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
            {

            }
            column(Sub_Group_1; ItemsG.Brand)
            {

            }

            column(Sub_Grop_2; ItemCategoryG.Description)
            {

            }

            column(SalesInvoiceQuantityG; SalesInvoiceQuantityG)
            {

            }
            column(SalesInvoiceAmountG; SalesInvoiceAmountG)
            {

            }
            column(SalesCreditMemoAmountG; SalesCreditMemoAmountG)
            {

            }
            column(SalesCreditMemoQuantityG; SalesCreditMemoQuantityG)
            {

            }
            column(SalesCostActualG; SalesCostActualG)
            {

            }

            column(Customer_Name; CustomerTxt)
            {

            }

            column(ItemLedgerEntryG_UMO; UnitofMesureG.Description)
            {

            }

            trigger OnAfterGetRecord()
            var

            begin
                Clear(SalesInvoiceQuantityG);
                Clear(SalesInvoiceAmountG);
                Clear(SalesCreditMemoQuantityG);
                Clear(SalesCreditMemoAmountG);
                Clear(SalesCostActualG);

                ItemsG.Reset();
                ItemsG.SetRange("No.", "Value Entry"."Item No.");
                if ItemsG.FindFirst() then begin
                    UnitofMesureG.Reset();
                    UnitofMesureG.SetRange(Code, ItemsG."Base Unit of Measure");
                    if UnitofMesureG.FindFirst() then;

                    VendorG.Reset();
                    VendorG.SetRange("No.", ItemsG."Vendor No.");
                    if VendorG.FindFirst() then;

                    ItemCategoryG.Reset();
                    ItemCategoryG.SetRange(Code, ItemsG."Item Category Code");
                    if ItemCategoryG.FindFirst() then;
                end;

                CustomerG.Reset();
                CustomerG.SetRange("No.", "Value Entry"."Source No.");
                if CustomerG.FindFirst() then
                    CustomerTxt := CustomerG."No." + '/' + CustomerG.Name;

                if checkitem <> "Value Entry"."Item No." + "Value Entry"."Source No." then begin
                    ValueEntryG.Reset();
                    ValueEntryG.SetFilter("Document Type", '%1|%2', ValueEntryG."Document Type"::"Sales Invoice", ValueEntryG."Document Type"::"Sales Credit Memo");
                    ValueEntryG.SetRange("Source Type", ValueEntryG."Source Type"::Customer);
                    ValueEntryG.SetRange("Source No.", "Value Entry"."Source No.");
                    ValueEntryG.SetRange("Item No.", "Value Entry"."Item No.");
                    ValueEntryG.SetFilter("Posting Date", '%1..%2', SummaryStartDateFilterG, SummaryEndDateFilterG);
                    if ValueEntryG.FindFirst() then begin
                        repeat
                            if ValueEntryG."Document Type" = ValueEntryG."Document Type"::"Sales Invoice" then begin
                                SalesInvoiceQuantityG += ValueEntryG."Invoiced Quantity" * (-1);
                                SalesInvoiceAmountG += ValueEntryG."Sales Amount (Actual)";
                            end;

                            if ValueEntryG."Document Type" = ValueEntryG."Document Type"::"Sales Credit Memo" then begin
                                SalesCreditMemoQuantityG += ValueEntryG."Invoiced Quantity";
                                SalesCreditMemoAmountG += ValueEntryG."Sales Amount (Actual)" * (-1);
                            end;

                            SalesCostActualG += ValueEntryG."Cost Amount (Actual)" * (-1);

                        until ValueEntryG.Next() = 0;
                    end;

                    checkitem := "Value Entry"."Item No." + "Value Entry"."Source No.";

                    if (SalesInvoiceAmountG = 0) AND (SalesCreditMemoAmountG = 0) then
                        CurrReport.Skip();

                end else
                    CurrReport.Skip();
            end;

        }

    }


    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(DateOption)
                {
                    Caption = 'Date Options';
                    field(SummaryStartDateFilterG; SummaryStartDateFilterG)
                    {
                        Caption = 'Filter Start Date';
                    }
                    field(SummaryEndDateFilterG; SummaryEndDateFilterG)
                    {
                        Caption = 'Filter End Date';
                    }
                }
                group(SummaryOption)
                {
                    Caption = 'Summary Options';
                    field(ShowSummaryByCustG; ShowSummaryByCustG)
                    {
                        Caption = 'Show Summary Data By Customer';
                    }
                    // field(ShowAllSummaryG; ShowAllSummaryG)
                    // {
                    //     Caption = 'Show Summary Data All';
                    //     ApplicationArea = All;
                    // }
                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/ReportAnalysisGrossProfitNew.rdlc';
        }
    }

    trigger OnPreReport()

    begin
        CompanyInfomationG.get();
        PrintDateG := 'พิมพ์วันที่ : ' + Format(Today());
        DateFilterTxt := 'จากวันที่ ' + Format(SummaryStartDateFilterG) + ' ถึง ' + Format(SummaryEndDateFilterG);
    end;

    var

        // ValueEntryG: Record "Value Entry" temporary;
        ItemsG: Record Item;
        ValueEntryG: Record "Value Entry";
        ItemLedgerEntryG: Record "Item Ledger Entry";
        CompanyInfomationG: Record "Company Information";
        UnitofMesureG: Record "Unit of Measure";
        VendorG: Record Vendor;
        CustomerG: Record Customer;
        ItemCategoryG: Record "Item Category";
        SummaryStartDateFilterG: Date;
        SummaryEndDateFilterG: Date;
        PrintDateG: text;
        DateFilterTxt: Text;
        checkitem: Text;
        CustomerTxt: Text;
        SalesInvoiceQuantityG: Decimal;
        SalesCreditMemoQuantityG: Decimal;
        SalesInvoiceAmountG: Decimal;
        SalesCreditMemoAmountG: Decimal;
        SalesCostActualG: Decimal;
        checkItemSkip: Boolean;
        ShowSummaryByCustG: Boolean;
        ShowAllSummaryG: Boolean;

}
