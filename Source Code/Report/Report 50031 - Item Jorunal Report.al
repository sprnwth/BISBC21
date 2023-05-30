report 50031 "Item Journal report"
{
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Item Journal Line"; "Item Journal Line")
        {
            RequestFilterFields = "Document No.";
            DataItemTableView = sorting("Document No.", "Item No.") order(ascending) where("Entry Type" = filter("Positive Adjmt." | "Negative Adjmt."));
            column(Posting_Date; "Posting Date")
            {

            }
            column(Entry_Type; EntryTypeName)
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }
            column(CompanyInfomationG_Name; CompanyInfomationG."NWTH 2nd Name")
            {

            }
            column(CompanyInfomationG_Picture; CompanyInfomationG.Picture)
            {

            }
            column(AddressG; AddressG)
            {

            }
            column(Address2G; Address2G)
            {

            }
            column(LotNoG; LotNoG)
            {

            }
            column(MfdDateG; WarantyDateG)
            {

            }
            column(SerialNoG; ItemTrackingG."Serial No.")
            {

            }
            column(Bin_Code; "Bin Code")
            {

            }
            column(Reason_Code; ReasoTextG)
            {

            }
            column(DepartTextG; DepartTextG)
            {

            }
            column(BranchTextG; BranchTextG)
            {

            }
            column(UserNameG; UserNameG)
            {

            }
            column(UOM_Name; "UOM Name")
            {

            }
            column(LocationTextG; LocationTextG)
            {

            }
            column(BincodeTextG; BincodeTextG)
            {

            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(ReasoTextG);
                Clear(DepartTextG);
                Clear(BranchTextG);
                Clear(EntryTypeName);

                "Item Journal Line".CalcFields("UOM Name");

                ItemTrackingG.Reset();
                ItemTrackingG.SetRange("Source Batch Name", "Item Journal Line"."Journal Batch Name");
                ItemTrackingG.SetRange("Source ID", "Item Journal Line"."Journal Template Name");
                ItemTrackingG.SetRange("Source Ref. No.", "Item Journal Line"."Line No.");
                if ItemTrackingG.FindFirst() then begin
                    LotNoG := 'Lot No. : ' + ItemTrackingG."Lot No.";
                    WarantyDateG := 'Mfd dt : ' + Format(ItemTrackingG."Warranty Date") + '   ' + 'Exp dt : ' + Format(ItemTrackingG."Expiration Date");
                end else begin
                    ReservationG.Reset();
                    ReservationG.SetRange("Source Batch Name", "Item Journal Line"."Journal Batch Name");
                    ReservationG.SetRange("Source ID", "Item Journal Line"."Journal Template Name");
                    ReservationG.SetRange("Source Ref. No.", "Item Journal Line"."Line No.");
                    if ReservationG.FindFirst() then begin
                        LotNoG := 'Lot No. : ' + ReservationG."Lot No.";
                        WarantyDateG := 'Mfd dt : ' + Format(ReservationG."Warranty Date") + '   ' + 'Exp dt : ' + Format(ReservationG."Expiration Date");
                    end else begin
                        LotNoG := 'Skip';
                        WarantyDateG := 'Skip';
                    end;

                end;

                ReasonCodeG.Reset();
                ReasonCodeG.SetRange(Code, "Item Journal Line"."Reason Code");
                if ReasonCodeG.FindFirst() then
                    ReasoTextG := ReasonCodeG.Code + ' ' + '(' + ReasonCodeG.Description + ')';

                DepartmentG.Reset();
                DepartmentG.SetFilter("Dimension Code", 'DEPARTMENT');
                DepartmentG.SetRange(Code, "Item Journal Line"."Shortcut Dimension 1 Code");
                if DepartmentG.FindFirst() then
                    DepartTextG := DepartmentG.Code + ' ' + '(' + DepartmentG.Name + ')';

                BranchG.Reset();
                BranchG.SetFilter("Dimension Code", 'BRANCH');
                BranchG.SetRange(Code, "Item Journal Line"."Shortcut Dimension 2 Code");
                if BranchG.FindFirst() then
                    BranchTextG := BranchG.Code + ' ' + '(' + BranchG.Name + ')';

                if "Item Journal Line"."Entry Type" = "Item Journal Line"."Entry Type"::"Positive Adjmt." then
                    EntryTypeName := 'เพิ่ม'
                else
                    EntryTypeName := 'ลด';

                LocationG.Reset();
                LocationG.SetRange(Code, "Item Journal Line"."Location Code");
                if LocationG.FindFirst() then
                    LocationTextG := LocationG.Name;

                BinG.Reset();
                BinG.SetRange(Code, "Item Journal Line"."Bin Code");
                if BinG.FindFirst() then
                    BincodeTextG := BinG.Description;





                UserIdG := UserId();
                UserG.Reset();
                UserG.SetRange("User Name", UserIdG);
                if UserG.FindFirst() then
                    UserNameG := UserG."Full Name";

            end;
        }
    }




    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/ReportItemJournal.rdlc';
        }
    }


    trigger OnPreReport()
    begin

        CompanyInfomationG.get();
        CompanyInfomationG.CalcFields(Picture);
        AddressG := CompanyInfomationG."NWTH 2nd Address" + ' ' + CompanyInfomationG."NWTH 2nd Address 2";
        Address2G := 'โทร. ' + CompanyInfomationG."Phone No." + ' ' + 'โทรสาร ' + CompanyInfomationG."Fax No." + ' ' + 'เลขประจำตัวผู้เสียภาษีอากร ' + CompanyInfomationG."Registration No."
    end;


    var
        CompanyInfomationG: Record "Company Information";
        ItemTrackingG: Record "Tracking Specification";
        ReservationG: Record "Reservation Entry";
        UserG: Record User;
        UnitofMeasureG: Record "Unit of Measure";
        ReasonCodeG: Record "Reason Code";
        DepartmentG: Record "Dimension Value";
        BranchG: Record "Dimension Value";
        LocationG: Record Location;
        BinG: Record Bin;
        AddressG: Text;
        Address2G: Text;
        EntryTypeG: Text;
        LotNoG: Text;
        WarantyDateG: Text;
        ReasoTextG: Text;
        BranchTextG: Text;
        DepartTextG: Text;
        LocationTextG: Text;
        BincodeTextG: Text;
        EntryTypeName: text;
        UserIdG: Text;
        UserNameG: Text;
        MaxLineG: Integer;
        LineNoG: Integer;
        BlankLineNoG: Integer;
        CountTransferLineG: Integer;
        ShowBlankG: Boolean;
        ShowTotalG: Boolean;
        ShowDetailG: Boolean;
        SumQtyG: Decimal;

}