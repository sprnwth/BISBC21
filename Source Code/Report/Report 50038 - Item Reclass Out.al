report 50038 "Item Reclass Out"
{
    // UsageCategory = ReportsAndAnalysis;
    // ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Item Reclass Transfer Out';


    dataset
    {
        dataitem("Item Journal Line"; "Item Journal Line")
        {
            RequestFilterFields = "Document No.";
            DataItemTableView = sorting("Document No.", "Item No.") order(ascending);
            column(No_; "Document No.")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_No_; "Document No.")
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
            column(ReasoTextG; ReasoTextG)
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Transfer_from_Code; "Location Code")
            {

            }
            column(Transfer_to_Code; "Location Code")
            {

            }
            column(Transfer_To_Bin_Code; "Bin Code")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Unit_of_Measure; "Unit of Measure Code")
            {

            }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {

            }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            {

            }
            column(ShowDetailG; ShowDetailG)
            {

            }
            column(DepartTextG; DepartTextG)
            {

            }
            column(BranchTextG; BranchTextG)
            {

            }
            column(LotNoG; LotNoG)
            {

            }
            column(WarantyDateG; WarantyDateG)
            {

            }
            column(EXPDateG; EXPDateG)
            {

            }



            trigger OnAfterGetRecord()
            var
            begin
                ReasonCodeG.Reset();
                ReasonCodeG.SetRange(Code, "Item Journal Line"."Reason Code");
                if ReasonCodeG.FindFirst() then
                    ReasoTextG := ReasonCodeG.Description;

                Clear(DepartTextG);
                Clear(BranchTextG);
                Clear(LotNoG);
                Clear(EXPDateG);
                Clear(WarantyDateG);

                // ItemLedgerEntriesG.Reset();
                // ItemLedgerEntriesG.SetRange("Item No.", "Item Journal Line"."Item No.");
                // ItemLedgerEntriesG.SetRange("Document No.", "Item Journal Line"."Document No.");
                // ItemLedgerEntriesG.SetFilter(Quantity, '>0');
                // if ItemLedgerEntriesG.FindFirst() then begin
                //     if ItemLedgerEntriesG."Lot No." <> '' then
                //         LotNoG := 'Lot No. : ' + ItemLedgerEntriesG."Lot No."
                //     else
                //         LotNoG := 'Skip';

                //     if (ItemLedgerEntriesG."Warranty Date" = 0D) AND (ItemLedgerEntriesG."Expiration Date" = 0D) then
                //         WarantyDateG := 'Skip'
                //     else
                //         WarantyDateG := 'Mfd dt : ' + Format(ItemLedgerEntriesG."Warranty Date") + '   ' + 'Exp dt : ' + Format(ItemLedgerEntriesG."Expiration Date")
                // end else begin
                //     LotNoG := 'Skip';
                //     WarantyDateG := 'Skip'
                // end;

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
                        LotNoG := 'Lot No. : ' + ReservationG."New Lot No.";
                        WarantyDateG := 'Mfd dt : ' + Format(ReservationG."Warranty Date") + '   ' + 'Exp dt : ' + Format(ReservationG."Expiration Date");
                    end else begin
                        LotNoG := 'Skip';
                        WarantyDateG := 'Skip';
                    end;

                end;


                DimensionValueDepartG.Reset();
                DimensionValueDepartG.SetFilter("Dimension Code", 'DEPARTMENT');
                DimensionValueDepartG.SetRange(Code, "Item Journal Line"."New Shortcut Dimension 1 Code");
                if DimensionValueDepartG.FindFirst() then
                    DepartTextG := DimensionValueDepartG.Code + DimensionValueDepartG.Name;

                DimensionValueBranchG.Reset();
                DimensionValueBranchG.SetFilter("Dimension Code", 'BRANCH');
                DimensionValueBranchG.SetRange(Code, "Item Journal Line"."New Shortcut Dimension 2 Code");
                if DimensionValueBranchG.FindFirst() then
                    BranchTextG := DimensionValueBranchG.Code + DimensionValueBranchG.Name;

            end;
        }


    }
    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/Item Reclass Out.rdlc';
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
        DimensionValueBranchG: Record "Dimension Value";
        DimensionValueDepartG: Record "Dimension Value";
        ItemLedgerEntriesG: Record "Item Ledger Entry";
        ReasonCodeG: Record "Reason Code";
        ItemTrackingG: Record "Tracking Specification";
        ReservationG: Record "Reservation Entry";
        ReasoTextG: Text;
        AddressG: Text;
        Address2G: Text;
        CheckItemLineG: Text;
        DepartTextG: Text;
        BranchTextG: Text;
        EXPDateG: Text;
        LotNoG: Text;
        WarantyDateG: Text;
        MaxLineG: Integer;
        LineNoG: Integer;
        BlankLineNoG: Integer;
        CountTransferLineG: Integer;
        ShowBlankG: Boolean;
        ShowTotalG: Boolean;
        ShowDetailG: Boolean;
        SumQtyG: Decimal;

}