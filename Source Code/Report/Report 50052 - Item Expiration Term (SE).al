report 50072 "Item Expiration Term (SE)"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Item Expiration Term (SE)';

    dataset
    {
        dataitem(DataItemName; Integer)
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = FILTER(1 ..));
            column(DateAsOf; DateAsOf)
            {

            }
            column(PeriodLengthG; PeriodLengthG)
            {

            }
            column(PrintDatetext; PrintDatetext)
            {

            }
            column(ReportNameG; ReportNameG)
            {

            }
            column(Item_No_; ItemLedgerEntryTemp."Item No.")
            {

            }
            column(Item_Name; ItemG.Description)
            {

            }
            column(Lot_No_; ItemLedgerEntryTemp."Lot No.")
            {

            }
            column(Serial_No_; ItemLedgerEntryTemp."Serial No.")
            {

            }
            column(Location_code; ItemLedgerEntryTemp.Description)
            {

            }
            column(Warranty_Date; ItemLedgerEntryTemp."Warranty Date")
            {

            }
            column(Expiration_Date; ItemLedgerEntryTemp."Expiration Date")
            {

            }
            column(DiffDays; ItemLedgerEntryTemp."Invoiced Quantity")
            {

            }
            column(Quantity; ItemLedgerEntryTemp.Quantity)
            {

            }

            trigger OnPreDataItem()

            begin
                ItemLedgerEntryTemp.Reset();
                ItemLedgerEntryTemp.SetFilter(Quantity, '<>0');
            end;

            trigger OnAfterGetRecord()
            begin
                if Number = 1 then begin
                    if not ItemLedgerEntryTemp.FindSet() then
                        CurrReport.Break()
                    else begin
                        if ItemG.Get(ItemLedgerEntryTemp."Item No.") then;
                    end;
                end else begin
                    if ItemLedgerEntryTemp.Next() = 0 then
                        CurrReport.Break()
                    else begin
                        if ItemG.Get(ItemLedgerEntryTemp."Item No.") then;
                    end;
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
                    field(DateAsOf; DateAsOf)
                    {
                        Caption = 'Date As Of';
                        ShowMandatory = true;
                    }
                    field("Period Length"; PeriodLengthG)
                    {
                        Caption = 'Period Length';
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
            LayoutFile = './Source Code/ReportLayout/ItemExpirationTermSE.rdlc';
        }
    }

    trigger OnPreReport()
    var
        RevisePeriodLengthL: DateFormula;
        ExpiraFilterDate: Date;
    begin
        CompanyinfoG.get();

        Day := DATE2DMY(Today(), 1);
        Month := DATE2DMY(Today(), 2);
        Year := DATE2DMY(Today(), 3);

        PrintMonth := ThaiMonth(Month);

        Month := DATE2DMY(DateAsOf, 2);

        TitleMonth := ThaiMonth(Month);

        ReportNameG := 'สรุปรายงานสต็อกสินค้าใกล้หมดอายุ ประจำเดือน' + TitleMonth + ' ' + Format(Year + 543);
        PrintDatetext := Format(Day) + ' ' + PrintMonth + ' ' + Format(Year);

        ItemLedgerEntryG.Reset();
        ItemLedgerEntryG.SetRange("Posting Date", 0D, DateAsOf);

        if Format(PeriodLengthG) <> '' then begin
            //Evaluate(RevisePeriodLengthL, '-' + Format(PeriodLengthG));
            ExpiraFilterDate := CalcDate(PeriodLengthG, DateAsOf);
            ItemLedgerEntryG.SetRange("Expiration Date", DateAsOf, ExpiraFilterDate);
        end;

        ItemLedgerEntryTemp.Reset();
        IF ItemLedgerEntryTemp.IsTemporary() then
            ItemLedgerEntryTemp.DeleteAll();

        if ItemLedgerEntryG.FindSet() then begin
            repeat
                ItemLedgerEntryTemp.SetCurrentKey("Item No.", "Lot No.", "Serial No.");
                ItemLedgerEntryTemp.SetRange("Item No.", ItemLedgerEntryG."Item No.");
                ItemLedgerEntryTemp.SetRange("Lot No.", ItemLedgerEntryG."Lot No.");
                ItemLedgerEntryTemp.SetRange("Serial No.", ItemLedgerEntryG."Serial No.");
                ItemLedgerEntryTemp.SetRange("Location Code", ItemLedgerEntryG."Location Code");
                if ItemLedgerEntryTemp.FindFirst() then begin
                    ItemLedgerEntryTemp.Quantity += ItemLedgerEntryG.Quantity;
                    ItemLedgerEntryTemp.Modify();
                end else begin
                    ItemLedgerEntryTemp.Init();
                    ItemLedgerEntryTemp."Entry No." := ItemLedgerEntryG."Entry No.";
                    ItemLedgerEntryTemp."Item No." := ItemLedgerEntryG."Item No.";
                    ItemLedgerEntryTemp."Location Code" := ItemLedgerEntryG."Location Code";
                    ItemLedgerEntryTemp."Lot No." := ItemLedgerEntryG."Lot No.";
                    ItemLedgerEntryTemp."Serial No." := ItemLedgerEntryG."Serial No.";
                    ItemLedgerEntryTemp."Warranty Date" := ItemLedgerEntryG."Warranty Date";
                    ItemLedgerEntryTemp."Expiration Date" := ItemLedgerEntryG."Expiration Date";
                    ItemLedgerEntryTemp.Quantity := ItemLedgerEntryG.Quantity;

                    if LocationG.Get(ItemLedgerEntryG."Location Code") then
                        ItemLedgerEntryTemp.Description := LocationG.Name;

                    ItemLedgerEntryTemp.Insert();
                end;
            until ItemLedgerEntryG.Next() = 0;
        end;
    end;

    local procedure ThaiMonth(MouthP: Integer) Monthtext: Text
    begin
        case MouthP of
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
        exit(Monthtext);
    end;

    var
        DateAsOf: Date;
        PeriodLengthG: DateFormula;
        ItemLedgerEntryTemp: Record "Item Ledger Entry" temporary;
        ItemLedgerEntryG: Record "Item Ledger Entry";
        ItemG: Record Item;
        CompanyinfoG: Record "Company Information";
        ReportNameG: Text;
        Day: Integer;
        Month: Integer;
        Year: Integer;
        DiffDaysG: Integer;
        PrintDatetext: Text;
        TitleMonth: Text;
        PrintMonth: Text;
        LocationG: Record Location;

}