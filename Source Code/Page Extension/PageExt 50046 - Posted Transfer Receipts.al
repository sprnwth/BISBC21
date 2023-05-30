pageextension 50046 "Posted Transfer Receipts Ext" extends "Posted Transfer Receipt"
{
    actions
    {
        addlast(Reporting)
        {
            action("Transfer In Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                Caption = 'ใบโอนสินค้าเข้า';
                //Image = Report;

                trigger OnAction()
                var
                    PostedTransferReceiptL: Record "Transfer Receipt Header";
                begin
                    PostedTransferReceiptL.Reset();
                    PostedTransferReceiptL.SetRange("No.", Rec."No.");
                    if PostedTransferReceiptL.FindFirst() then;

                    Report.Run(Report::"Transfer in Report", true, true, PostedTransferReceiptL);

                end;
            }
        }
    }
}