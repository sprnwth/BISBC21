report 50022 "Transfer Out Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    Caption = 'Transfer Out Report';

    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            column(Posting_Date; "Posting Date")
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
            column(Reason_Code; "Reason Code")
            {

            }
            column(ReasoTextG; ReasoTextG)
            {

            }

            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLinkReference = "Transfer Shipment Header";
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Item No.") order(ascending);

                column(Item_No_; "Item No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Transfer_from_Code; "Transfer-from Code")
                {

                }
                column(Transfer_to_Code; "Transfer-to Code")
                {

                }
                column(Transfer_from_Bin_Code; "Transfer-from Bin Code")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure; "Unit of Measure")
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


                trigger OnPreDataItem()
                begin

                end;

                trigger OnAfterGetRecord()
                var
                begin
                    Clear(DepartTextG);
                    Clear(BranchTextG);
                    Clear(LotNoG);
                    Clear(EXPDateG);
                    Clear(WarantyDateG);

                    ItemLedgerEntriesG.Reset();
                    ItemLedgerEntriesG.SetRange("Item No.", "Transfer Shipment Line"."Item No.");
                    ItemLedgerEntriesG.SetRange("Document No.", "Transfer Shipment Line"."Document No.");
                    ItemLedgerEntriesG.SetFilter(Quantity, '<0');
                    if ItemLedgerEntriesG.FindFirst() then begin
                        if ItemLedgerEntriesG."Lot No." <> '' then
                            LotNoG := 'Lot No. : ' + ItemLedgerEntriesG."Lot No."
                        else
                            LotNoG := 'Skip';

                        if (ItemLedgerEntriesG."Warranty Date" = 0D) AND (ItemLedgerEntriesG."Expiration Date" = 0D) then
                            WarantyDateG := 'Skip'
                        else
                            WarantyDateG := 'Mfd dt : ' + Format(ItemLedgerEntriesG."Warranty Date") + '   ' + 'Exp dt : ' + Format(ItemLedgerEntriesG."Expiration Date")
                    end else begin
                        LotNoG := 'Skip';
                        WarantyDateG := 'Skip'
                    end;

                    DimensionValueDepartG.Reset();
                    DimensionValueDepartG.SetFilter("Dimension Code", 'DEPARTMENT');
                    DimensionValueDepartG.SetRange(Code, "Transfer Shipment Line"."Shortcut Dimension 1 Code");
                    if DimensionValueDepartG.FindFirst() then
                        DepartTextG := DimensionValueDepartG.Code + DimensionValueDepartG.Name;

                    DimensionValueBranchG.Reset();
                    DimensionValueBranchG.SetFilter("Dimension Code", 'BRANCH');
                    DimensionValueBranchG.SetRange(Code, "Transfer Shipment Line"."Shortcut Dimension 2 Code");
                    if DimensionValueBranchG.FindFirst() then
                        BranchTextG := DimensionValueBranchG.Code + DimensionValueBranchG.Name;

                end;

            }

            trigger OnPreDataItem()
            begin

            end;

            trigger OnAfterGetRecord()
            var
            begin
                ReasonCodeG.Reset();
                ReasonCodeG.SetRange(Code, "Transfer Shipment Header"."Reason Code");
                if ReasonCodeG.FindFirst() then
                    ReasoTextG := ReasonCodeG.Description;

            end;

        }


    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './Source Code/ReportLayout/ReportTransferOut.rdlc';
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