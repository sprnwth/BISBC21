pageextension 50071 PostedSalesShipmentExt extends "Posted Sales Shipments"
{
    layout
    {

        // Add changes to page layout here
        addbefore(Control1)
        {
            field(SISeries; SISeries)
            {
                ApplicationArea = All;
                Caption = 'Sales Invoice Nos.';

                trigger OnDrillDown()
                var
                    NoSeriesRelation: Record "No. Series Relationship";
                    NoSeriesRelationPage: Page "No. Series Relationships";
                begin

                    NoSeriesRelation.setrange(Code, SalesSetup."Invoice Nos.");
                    NoSeriesRelationPage.LookupMode(True);
                    NoSeriesRelationPage.SetTableView(NoSeriesRelation);
                    if NoSeriesRelationPage.RunModal() = action::LookupOK then
                        SISeries := NoSeriesRelation."Series Code";
                end;
            }
        }
        addafter("No.")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = All;

            }
            field("Invoice No."; Rec."Invoice No.")
            {
                ApplicationArea = All;
                ToolTip = 'Only 1st Invoice No.';
            }
            field(Invoiced; Rec.Invoiced)
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Shipment")
        {
            action("Create Sales Invoice")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesInvoice: Record "Sales Header";
                    PSH: Record "Sales Shipment Header";
                    PSL: Record "Sales Shipment Line";
                    SalesGetShp: Codeunit "Sales-Get Shipment";
                    SameCustomer: Boolean;
                    CurrCust: Code[20];
                begin
                    if SISeries = '' then
                        Error('Sales Invoice Nos. must be filled');
                    CurrPage.SetSelectionFilter(PSH);
                    PSH.SetAutoCalcFields(Invoiced, "Invoice No.");
                    if PSH.FindSet() then begin
                        PSH.TestField(Invoiced, false);
                        PSH.TestField("Invoice No.", '');
                        CurrCust := PSH."Sell-to Customer No.";
                        repeat
                            if CurrCust <> PSH."Sell-to Customer No." then
                                Error('Customer No. must be same for all document');
                        until PSH.Next() = 0;
                    end;

                    if PSH.FindSet() then begin

                        SalesInvoice.Init();
                        SalesInvoice."Document Type" := SalesInvoice."Document Type"::Invoice;
                        SalesInvoice."No." := NoSeriesMgt.GetNextNo(SISeries, 0D, true);
                        SalesInvoice.insert(True);

                        SalesInvoice.Validate("Sell-to Customer No.", PSH."Sell-to Customer No.");
                        SalesInvoice.Modify(true);

                        repeat

                            PSL.Reset();
                            PSL.setrange("Document No.", PSH."No.");
                            if PSL.FindSet() then
                                repeat
                                    SalesGetShp.SetSalesHeader(SalesInvoice);
                                    SalesGetShp.CreateInvLines(PSL);
                                until PSL.Next() = 0;

                        until PSH.Next() = 0;
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()

    begin
        SalesSetup.Get();
        NoSeries.setrange("From Sales Shipment", true);
        if NoSeries.FindFirst() then begin
            SISeries := NoSeries.Code;
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        SISeries: Code[20];
        NoSeries: Record "No. Series";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}