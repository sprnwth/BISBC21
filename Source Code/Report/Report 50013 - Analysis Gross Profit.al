report 50013 "Analysis Gross Profit"
{
    // UsageCategory = ReportsAndAnalysis;
    // ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Analysis Gross Profit';


    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            column(Customer_No; "No.")
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
            dataitem(Item; Item)
            {
                column(Item_No; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Vendor_No_; "Vendor No.")
                {

                }
                column(Goods_Type; "Goods Type")
                {

                }
                column(Sub_Group_1; "Sub Group 1")
                {

                }
                column(Sub_Grop_2; "Sub Grop 2")
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
                column(ItemLedgerEntryG_UMO; ItemLedgerEntryG."Unit of Measure Code")
                {

                }

                trigger OnPreDataItem()
                var

                begin

                end;

                trigger OnAfterGetRecord()
                var

                begin
                    Clear(SalesInvoiceAmountG);
                    Clear(SalesCreditMemoQuantityG);
                    Clear(SalesCreditMemoAmountG);
                    Clear(SalesCostActualG);
                    checkItemSkip := false;

                    ValueEntryG.Reset();
                    ValueEntryG.SetFilter("Document Type", '%1|%2', ValueEntryG."Document Type"::"Sales Invoice", ValueEntryG."Document Type"::"Sales Credit Memo");
                    ValueEntryG.SetRange("Source Type", ValueEntryG."Source Type"::Customer);
                    ValueEntryG.SetRange("Source No.", Customer."No.");
                    ValueEntryG.SetRange("Item No.", Item."No.");
                    ValueEntryG.SetFilter("Posting Date", '%1..%2', SummaryStartDateFilterG, SummaryEndDateFilterG);
                    if ValueEntryG.FindFirst() then begin
                        repeat
                            if ValueEntryG."Document Type" = ValueEntryG."Document Type"::"Sales Invoice" then begin
                                SalesInvoiceQuantityG += ValueEntryG."Invoiced Quantity" * (-1);
                                SalesInvoiceAmountG += ValueEntryG."Sales Amount (Actual)";
                            end;

                            if ValueEntryG."Document Type" = ValueEntryG."Document Type"::"Sales Credit Memo" then begin
                                SalesCreditMemoQuantityG += ValueEntryG."Invoiced Quantity" * (-1);
                                SalesCreditMemoAmountG += ValueEntryG."Sales Amount (Actual)";
                            end;

                            SalesCostActualG += ValueEntryG."Cost Amount (Actual)" * (-1);

                        until ValueEntryG.Next() = 0;
                    end;

                    if (SalesInvoiceAmountG = 0) AND (SalesCreditMemoAmountG = 0) then
                        CurrReport.Skip();


                    // ItemLedgerEntryG.Reset();
                    // ItemLedgerEntryG.SetRange("Source No.", Customer."No.");
                    // ItemLedgerEntryG.SetRange("Item No.", Item."No.");
                    // ItemLedgerEntryG.SetRange("Entry Type", ItemLedgerEntryG."Entry Type"::Sale);
                    // ItemLedgerEntryG.SetRange("Document Type", ItemLedgerEntryG."Document Type"::"Sales Shipment");
                    // ItemLedgerEntryG.SetFilter("Posting Date", '%1..%2', SummaryStartDateFilterG, SummaryEndDateFilterG);
                    // if ItemLedgerEntryG.FindFirst() then begin
                    //     repeat
                    //         ValueEntryG.Reset();
                    //         ValueEntryG.SetRange("Item Ledger Entry No.", ItemLedgerEntryG."Entry No.");
                    //         ValueEntryG.SetFilter("Document Type", '%1|%2', ValueEntryG."Document Type"::"Sales Invoice", ValueEntryG."Document Type"::"Sales Credit Memo");
                    //         if ValueEntryG.FindFirst() then begin
                    //             if ValueEntryG."Document Type" = ValueEntryG."Document Type"::"Sales Invoice" then begin
                    //                 SalesInvoiceQuantityG += ValueEntryG."Invoiced Quantity" * (-1);
                    //                 SalesInvoiceAmountG += ValueEntryG."Sales Amount (Actual)";
                    //             end;

                    //             if ValueEntryG."Document Type" = ValueEntryG."Document Type"::"Sales Credit Memo" then begin
                    //                 SalesCreditMemoQuantityG += ValueEntryG."Invoiced Quantity" * (-1);
                    //                 SalesCreditMemoAmountG += ValueEntryG."Sales Amount (Actual)";
                    //             end;

                    //             SalesCostActualG += ValueEntryG."Cost Amount (Actual)" * (-1);
                    //         end;

                    //     until ItemLedgerEntryG.Next() = 0;

                    //     if (SalesInvoiceAmountG = 0) AND (SalesCreditMemoAmountG = 0) then
                    //         CurrReport.Skip();
                    // end else
                    //     CurrReport.Skip();
                end;
            }
            trigger OnPreDataItem()
            var

            begin

            end;

            trigger OnAfterGetRecord()
            var

            begin
                // if (SalesInvoiceAmountG = 0) AND (SalesCreditMemoAmountG = 0) then
                //     CurrReport.Skip();
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
                        ApplicationArea = All;
                    }
                    field(SummaryEndDateFilterG; SummaryEndDateFilterG)
                    {
                        Caption = 'Filter End Date';
                        ApplicationArea = All;
                    }
                }
                group(SummaryOption)
                {
                    Caption = 'Summary Options';
                    field(ShowSummaryByCustG; ShowSummaryByCustG)
                    {
                        Caption = 'Show Summary Data By Customer';
                        ApplicationArea = All;
                    }
                    field(ShowAllSummaryG; ShowAllSummaryG)
                    {
                        Caption = 'Show Summary Data All';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/ReportAnalysisGrossProfit.rdlc';
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
        SummaryStartDateFilterG: Date;
        SummaryEndDateFilterG: Date;
        PrintDateG: text;
        DateFilterTxt: Text;
        SalesInvoiceQuantityG: Decimal;
        SalesCreditMemoQuantityG: Decimal;
        SalesInvoiceAmountG: Decimal;
        SalesCreditMemoAmountG: Decimal;
        SalesCostActualG: Decimal;
        checkItemSkip: Boolean;
        ShowSummaryByCustG: Boolean;
        ShowAllSummaryG: Boolean;
}