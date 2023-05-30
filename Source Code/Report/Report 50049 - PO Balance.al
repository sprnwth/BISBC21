report 50049 "PO Balance"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Source Code/ReportLayout/POBalance.rdl';
    Caption = 'PO Balance';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            DataItemTableView = where("Document Type" = const(Order));
            RequestFilterFields = "Order Date", "Expected Receipt Date", "Buy-from Vendor No.";
            column(DocDate; PO."Document Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(QuoteNo; PO."Quote No.")
            {

            }
            column(Vendor; Vendor."No.")
            {

            }
            column(VendorName; Vendor.Name)
            {

            }
            column(VendorAddress; Vendor.Address + ' ' + Vendor."Address 2" + ' ' + Vendor."Post Code")
            {

            }
            column(PaymentTerm; PaymentTerm.Description)
            {

            }
            column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
            {

            }
            column(Item_Category_Code; "Item Category Code")
            {

            }
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }

            column(UOM_Name; "UOM Name")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(Direct_Unit_Cost; "Direct Unit Cost")
            {

            }
            column(Line_Discount_Amount; "Line Discount Amount")
            {

            }
            column(Line_Amount; "Line Amount")
            {

            }
            column(CurrCode; PO."Currency Code")
            {

            }
            column(ExchRate; ExchRate)
            {

            }
            column(Expected_Receipt_Date; "Expected Receipt Date")
            {

            }
            column(comment; cmt.Comment)
            {

            }


            trigger OnAfterGetRecord()
            begin
                if Not Vendor.get("Buy-from Vendor No.") then
                    Vendor.Init();

                if Not PO.get("Document Type", "Document No.") then
                    PO.Init();

                if PO."Currency Factor" <> 0 then
                    ExchRate := 1 / PO."Currency Factor";


                if Not PaymentTerm.get(Vendor."Payment Terms Code") then
                    PaymentTerm.Init();

                cmt.reset();
                Cmt.setrange("Document Type", "Document Type"::Order);
                Cmt.setrange("No.", "Document No.");
                if not Cmt.FindFirst() then
                    Cmt.Init();

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
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    var
        DocDate: Date;
        Vendor: Record Vendor;
        PO: Record "Purchase Header";
        ExchRate: Decimal;
        PaymentTerm: Record "Payment Terms";
        Cmt: Record "Purch. Comment Line";

}