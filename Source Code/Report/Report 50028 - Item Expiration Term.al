report 50028 "Item Expiration Term"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Item Expiration Term';

    dataset
    {
        dataitem(DataItemName; Integer)
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = FILTER(1 ..));

            column(CompName; CompanyinfoG."NWTH 2nd Name")
            {

            }
            column(ReportNameG; ReportNameG)
            {

            }
            column(PrintDatetext; PrintDatetext)
            {

            }
            column(DateAsOf; DateAsOf)
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
            column(Warranty_Date; ItemLedgerEntryTemp."Warranty Date")
            {

            }
            column(Expiration_Date; ItemLedgerEntryTemp."Expiration Date")
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

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/ItemExpirationTerm.rdlc';
        }
    }

    trigger OnPreReport()
    var

    begin
        CompanyinfoG.get();

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

        ItemLedgerEntryG.Reset();
        ItemLedgerEntryG.SetRange("Posting Date", 0D, DateAsOf);

        ItemLedgerEntryTemp.Reset();
        IF ItemLedgerEntryTemp.IsTemporary() then
            ItemLedgerEntryTemp.DeleteAll();

        if ItemLedgerEntryG.FindSet() then begin
            repeat
                ItemLedgerEntryTemp.SetCurrentKey("Item No.", "Lot No.", "Serial No.");
                ItemLedgerEntryTemp.SetRange("Item No.", ItemLedgerEntryG."Item No.");
                ItemLedgerEntryTemp.SetRange("Lot No.", ItemLedgerEntryG."Lot No.");
                ItemLedgerEntryTemp.SetRange("Serial No.", ItemLedgerEntryG."Serial No.");
                if ItemLedgerEntryTemp.FindFirst() then begin
                    ItemLedgerEntryTemp.Quantity += ItemLedgerEntryG.Quantity;
                    ItemLedgerEntryTemp.Modify();
                end else begin
                    ItemLedgerEntryTemp.Init();
                    ItemLedgerEntryTemp."Entry No." := ItemLedgerEntryG."Entry No.";
                    ItemLedgerEntryTemp."Item No." := ItemLedgerEntryG."Item No.";
                    ItemLedgerEntryTemp."Lot No." := ItemLedgerEntryG."Lot No.";
                    ItemLedgerEntryTemp."Serial No." := ItemLedgerEntryG."Serial No.";
                    ItemLedgerEntryTemp."Warranty Date" := ItemLedgerEntryG."Warranty Date";
                    ItemLedgerEntryTemp."Expiration Date" := ItemLedgerEntryG."Expiration Date";
                    ItemLedgerEntryTemp.Quantity := ItemLedgerEntryG.Quantity;
                    ItemLedgerEntryTemp.Insert();
                end;
            until ItemLedgerEntryG.Next() = 0;
        end;

    end;

    var
        ItemLedgerEntryTemp: Record "Item Ledger Entry" temporary;
        ItemLedgerEntryG: Record "Item Ledger Entry";
        ItemG: Record Item;
        CompanyinfoG: Record "Company Information";
        ReportNameG: Label 'รายงานสินค้ากำลังจะหมดอายุ';
        Day: Integer;
        Month: Integer;
        Year: Integer;
        Monthtext: text;
        PrintDatetext: text;
        DateAsOf: Date;
}