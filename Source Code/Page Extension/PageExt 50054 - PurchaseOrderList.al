pageextension 50054 PurchaseOrderList extends "Purchase Order List"
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field("Expected Receipt Date"; Rec."Expected Receipt Date")
            {
                ApplicationArea = All;

            }
            field("Quote No."; Rec."Quote No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Print)
        {
            action("PO Balance")
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()

                begin
                    Report.run(Report::"PO Balance");
                end;
            }
        }
        addafter("Create &Whse. Receipt")
        {
            action("Create Warehouse Receipt Multiple")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    GetSourceDocInbound: Codeunit "Get Source Doc. Inbound";
                    PurchHeader: Record "Purchase Header";
                begin

                    CurrPage.SetSelectionFilter(PurchHeader);
                    if PurchHeader.findset() then
                        repeat
                            GetSourceDocInbound.CreateFromPurchOrder(PurchHeader);
                        until PurchHeader.Next() = 0;
                    Message('Warehouse Receipt Created');
                end;
            }
        }
    }
}
