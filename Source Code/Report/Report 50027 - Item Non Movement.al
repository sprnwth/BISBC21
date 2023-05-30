report 50027 "Item Non Movement"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Item Non Movement';

    dataset
    {
        dataitem(DataItemName; "Item Ledger Entry")
        {
            column(ComName; CompanyinfoG."NWTH 2nd Name")
            {

            }
            column(ReportName; ReportNameG)
            {

            }
            column(FilterDateG; FilterDateG)
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Expiration_Date; "Expiration Date")
            {

            }
            column(Lot_No_; "Lot No.")
            {

            }
            column(Serial_No_; "Serial No.")
            {

            }
            column(Unit_of_Measure_Code; UnitMeasureG.Description)
            {

            }
            column(Item_Name; ItemG.Description)
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(PrintDatetext; PrintDatetext)
            {

            }
            column(LastQuatity; LastQuatity)
            {

            }
            column(LastPostingDate; LastPostingDate)
            {

            }
            column(LastPurchDate; LastPurchDate)
            {

            }
            trigger OnPreDataItem()
            var
                RevisePeriodLength: DateFormula;
            begin
                Evaluate(RevisePeriodLength, '-' + Format(PeriodLengthG));
                BeforeFilterDateG := CalcDate(RevisePeriodLength, FilterDateG);

                Reset();
                SetRange("Posting Date", 0D, BeforeFilterDateG);
                // if BeforeFilterDateG <= FilterDateG then
                //     SetRange("Posting Date", BeforeFilterDateG, FilterDateG)
                // else
                //     SetRange("Posting Date", FilterDateG, BeforeFilterDateG);

            end;

            trigger OnAfterGetRecord()
            begin
                if UnitMeasureG.Get("Unit of Measure Code") then;

                if ItemG.Get("Item No.") then;

                ItemLedgerEntryG.Reset();
                ItemLedgerEntryG.SetCurrentKey("Posting Date");
                ItemLedgerEntryG.SetRange("Item No.", "Item No.");
                ItemLedgerEntryG.SetRange("Lot No.", "Lot No.");
                ItemLedgerEntryG.SetRange("Serial No.", "Serial No.");
                ItemLedgerEntryG.SetRange("Entry Type", ItemLedgerEntryG."Entry Type"::Sale);
                ItemLedgerEntryG.SetRange("Posting Date", 0D, BeforeFilterDateG);
                ItemLedgerEntryG.SetAscending("Posting Date", false);
                if ItemLedgerEntryG.FindFirst() then begin
                    LastQuatity := Abs(ItemLedgerEntryG.Quantity);
                    LastPostingDate := ItemLedgerEntryG."Posting Date";
                end;

                ItemLedgerEntryG.Reset();
                ItemLedgerEntryG.SetCurrentKey("Posting Date");
                ItemLedgerEntryG.SetRange("Item No.", "Item No.");
                ItemLedgerEntryG.SetRange("Lot No.", "Lot No.");
                ItemLedgerEntryG.SetRange("Serial No.", "Serial No.");
                ItemLedgerEntryG.SetRange("Entry Type", ItemLedgerEntryG."Entry Type"::Purchase);
                ItemLedgerEntryG.SetRange("Posting Date", 0D, BeforeFilterDateG);
                ItemLedgerEntryG.SetAscending("Posting Date", false);
                if ItemLedgerEntryG.FindFirst() then begin
                    LastPurchDate := ItemLedgerEntryG."Posting Date";
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    Caption = 'Filter';
                    field("Filter Date"; FilterDateG)
                    {
                        ShowMandatory = true;
                    }
                    field("Period Length"; PeriodLengthG)
                    {
                        ShowMandatory = true;
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
            LayoutFile = './Source Code/ReportLayout/ItemNonMovement.rdlc';
        }
    }

    trigger OnPreReport()
    begin
        if FilterDateG = 0D then
            Error('Filter Date is required.');

        if Format(PeriodLengthG) = '' then
            Error('Period Length is required.');

        if CompanyinfoG.get() then;

        Day := DATE2DMY(Today(), 1);
        Month := DATE2DMY(Today(), 2);
        Year := DATE2DMY(Today(), 3);

        case Month of
            1:
                Monthtext := 'มกราคม';
            2:
                Monthtext := 'กุมภาพันธ์';
            3:
                Monthtext := 'มีนาคม';
            4:
                Monthtext := 'เมษายน';
            5:
                Monthtext := 'พฤษภาคม';
            6:
                Monthtext := 'มิถุนายน';
            7:
                Monthtext := 'กรกฎาคม';
            8:
                Monthtext := 'สิงหาคม';
            9:
                Monthtext := 'กันยายน';
            10:
                Monthtext := 'ตุลาคม';
            11:
                Monthtext := 'พฤศจิกายน';
            12:
                Monthtext := 'ธันวาคม';
        end;

        PrintDatetext := Format(Day) + ' ' + Monthtext + ' ' + Format(Year);
    end;

    var
        UnitMeasureG: Record "Unit of Measure";
        ItemG: Record Item;
        CompanyinfoG: Record "Company Information";
        ReportNameG: Label 'รายงานสินค้าที่ไม่มีการขาย - เรียงตามสินค้า';
        FilterDateG: Date;
        PeriodLengthG: DateFormula;
        Day: Integer;
        Month: Integer;
        Year: Integer;
        Monthtext: text;
        PrintDatetext: text;
        ItemLedgerEntryG: Record "Item Ledger Entry";
        LastQuatity: Decimal;
        LastPostingDate: Date;
        BeforeFilterDateG: Date;
        LastPurchDate: Date;
}