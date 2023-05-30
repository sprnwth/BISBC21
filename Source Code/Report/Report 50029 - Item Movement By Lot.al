report 50029 "Item Movement By Lot"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Item Movement By Lot';

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Date Filter";
            column(CompanyinfoGName; CompanyinfoG.Name)
            {

            }
            column(VATReg; CompanyinfoG."VAT Registration No.")
            {

            }
            column(ItemDesc; Description)
            {

            }
            column(Unitofmeasure; Unitofmeasure.Description)
            {

            }
            column(Item_No_; "No.")
            {

            }

            dataitem(Integer; Integer) // Lot List
            {
                DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                column(Number; Number)
                {

                }
                column(LotNo; ItembyLotNo.LotNo)
                {

                }
                column(Serial; ItembyLotNo.SerialNo)
                {

                }

                column(MfgDate; '')
                {

                }
                column(ExpDate; '')
                {

                }
                dataitem("Bin Content"; "Bin Content") //OB Of Lot Detail
                {
                    DataItemLinkReference = Item;
                    DataItemLink = "Item No." = field("No.");
                    column(OBQty; OBQty)
                    {

                    }
                    column(Location_Code; "Location Code")
                    {

                    }
                    column(Location_Name; LocationG.Name)
                    {

                    }
                    column(BinName; BinG.Description)
                    {

                    }
                    column(Bin_Code; "Bin Code")
                    {

                    }


                    dataitem("Warehouse Entry"; "Warehouse Entry")
                    {
                        // DataItemLink = "Item No." = field("Item No."),
                        //                 "Location Code" = field("Location Code"),
                        //                 "Bin Code" = field("Bin Code");

                        column(Entry_No_; "Entry No.")
                        {

                        }
                        column(Registering_Date; "Registering Date")
                        {

                        }
                        column(Source_No_; "Source No.")
                        {

                        }
                        column(Source_Document; "Source Document")
                        {

                        }
                        column(BalanceQty; BalanceQty)
                        {

                        }
                        column(QtyIn; QtyIn)
                        {

                        }
                        column(QtyOut; QtyOut)
                        {

                        }
                        column(WARE_Description; Description)
                        {

                        }
                        column(Lot_No_; "Lot No.")
                        {

                        }
                        column(Serial_No_; "Serial No.")
                        {

                        }
                        column(Location_CodeWE; "Location Code")
                        {

                        }
                        column(Bin_CodeWE; "Bin Code")
                        {

                        }



                        trigger OnPreDataItem() // Warehouse Entry
                        begin
                            setrange("Item No.", ItembyLotNo.ItemNo);
                            setrange("Location Code", "Bin Content"."Location Code");
                            Setrange("Bin Code", "Bin Content"."Bin Code");
                            if ItembyLotNo.LotNo <> '' then
                                setrange("Lot No.", ItembyLotNo.LotNo);
                            if ItembyLotNo.SerialNo <> '' then
                                SetRange("Serial No.", ItembyLotNo.SerialNo);

                            setfilter("Registering Date", '%1..%2', StartingDate, EndingDate);

                            BalanceQty := OBQty;
                        end;

                        trigger OnAfterGetRecord()
                        begin
                            QtyIn := 0;
                            QtyOut := 0;
                            if Quantity > 1 then
                                QtyIn := Quantity
                            else
                                QtyOut := Quantity;
                            BalanceQty += Quantity;

                            // Message(Description);
                        end;
                    }

                    trigger OnAfterGetRecord() // Bin Content
                    begin
                        OBQty := 0;
                        ItembyLotOB.SetRange(ItembyLotOB.ItemNo, Item."No.");
                        ItembyLotOB.SetFilter(ItembyLotOB.LocationCode, "Location Code");
                        ItembyLotOB.setrange(ItembyLotOB.BinCode, "Bin Code");
                        if ItembyLotNo.LotNo <> '' then
                            ItembyLotOB.setrange(ItembyLotOB.LotNo, ItembyLotNo.LotNo);
                        if ItembyLotNo.SerialNo <> '' then
                            ItembyLotOB.setrange(ItembyLotOB.SerialNo, ItembyLotNo.SerialNo);
                        ItembyLotOB.setrange(ItembyLotOB.Registering_Date, 0D, OBDate);
                        if ItembyLotOB.Open() then begin
                            if ItembyLotOB.Read() then begin
                                OBQty := ItembyLotOB.Quantity;
                            end;
                        end;
                        BalanceQty := OBQty;


                        LocationG.Reset();
                        LocationG.SetRange(Code, "Bin Content"."Location Code");
                        If LocationG.FindFirst() then;

                        BinG.Reset();
                        BinG.SetRange(Code, "Bin Content"."Bin Code");
                        If BinG.FindFirst() then;
                    end;

                    trigger OnPostDataItem()

                    begin
                        ItembyLotOB.Close();
                    end;
                }

                trigger OnPreDataItem() // Group Lot Under Item
                begin
                    ItembyLotNo.SetRange(ItembyLotNo.ItemNo, Item."No.");
                    ItembyLotNo.SetFilter(ItembyLotNo.LocationCode, Item.GetFilter("Location Filter"));
                    if ItembyLotNo.Open() then;

                end;

                trigger OnAfterGetRecord()
                begin
                    if Not ItembyLotNo.Read() then
                        CurrReport.Break();
                end;

                trigger OnPostDataItem()
                begin
                    ItembyLotNo.Close();
                end;

            }

            trigger OnAfterGetRecord() //BIN Content            
            begin

                if not Unitofmeasure.get("Base Unit of Measure") then
                    Unitofmeasure.Init();
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
                group(GroupName)
                {
                    Caption = 'Filter';

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/ItemMovementByLot.rdlc';
        }
    }

    trigger OnPreReport()

    begin

        StartingDate := Item.GetRangeMin("Date Filter");
        EndingDate := Item.GetRangeMax("Date Filter");
        OBdate := CalcDate('-1D', StartingDate);
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
    end;

    var
        BinG: Record Bin;
        OBQty: Decimal;
        OBDate: Date;
        LocationName: Text;
        Location: Record Location;
        LocationG: Record Location;
        UOMName: Text;
        UOM: Record "Unit of Measure";
        ItemG: Record Item;
        CompanyinfoG: Record "Company Information";
        ReportNameG: Label 'รายงานสินค้าและวัตถุดิบ (แยกตาม Lot) แยกตามคลังและที่เก็บ';
        Day: Integer;
        Month: Integer;
        Year: Integer;
        Monthtext: text;
        PrintDatetext: text;

        BIN: Record Bin;
        BinName: Text;
        QtyIn: Decimal;
        QtyOut: Decimal;
        ItembyLotNo: Query WHReport;
        ItembyLotOB: Query WHReport;
        BalanceQty: Decimal;
        StartingDate: Date;
        EndingDate: Date;
        LotNo: Code[50];
        Serial: Code[50];
        //WHByLotcal: Query WarehouseEntryByLot;
        Unitofmeasure: Record "Unit of Measure";

}