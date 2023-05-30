page 50001 "Quest Order"
{
    ApplicationArea = All;
    Caption = 'Quest Order';
    PageType = List;
    SourceTable = "Quest Order";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(BillAfterDiscAmt; Rec.BillAfterDiscAmt)
                {
                    ToolTip = 'Specifies the value of the BillAfterDiscAmt field.';
                }
                field(BillDiscAmt; Rec.BillDiscAmt)
                {
                    ToolTip = 'Specifies the value of the BillDiscAmt field.';
                }
                field(BillDiscFormula; Rec.BillDiscFormula)
                {
                    ToolTip = 'Specifies the value of the BillDiscFormula field.';
                }
                field(CashierCode; Rec.CashierCode)
                {
                    ToolTip = 'Specifies the value of the CashierCode field.';
                }
                field(CashierName; Rec.CashierName)
                {
                    ToolTip = 'Specifies the value of the CashierName field.';
                }
                field(CashierNameEng; Rec.CashierNameEng)
                {
                    ToolTip = 'Specifies the value of the CashierNameEng field.';
                }
                field(CustBillName; Rec.CustBillName)
                {
                    ToolTip = 'Specifies the value of the CustBillName field.';
                }
                field(CustCode; Rec.CustCode)
                {
                    ToolTip = 'Specifies the value of the CustCode field.';
                }
                field(CustName; Rec.CustName)
                {
                    ToolTip = 'Specifies the value of the CustName field.';
                }
                field(CustNameEng; Rec.CustNameEng)
                {
                    ToolTip = 'Specifies the value of the CustNameEng field.';
                }
                field(CustShortName; Rec.CustShortName)
                {
                    ToolTip = 'Specifies the value of the CustShortName field.';
                }
                field(CustTaxID; Rec.CustTaxID)
                {
                    ToolTip = 'Specifies the value of the CustTaxID field.';
                }
                field(CustType; Rec.CustType)
                {
                    ToolTip = 'Specifies the value of the CustType field.';
                }
                field(DocDate; Rec.DocDate)
                {
                    ToolTip = 'Specifies the value of the DocDate field.';
                }
                field(DocID; Rec.DocID)
                {
                    ToolTip = 'Specifies the value of the DocID field.';
                }
                field(DocNo; Rec.DocNo)
                {
                    ToolTip = 'Specifies the value of the DocNo field.';
                }
                field(DocType; Rec.DocType)
                {
                    ToolTip = 'Specifies the value of the DocType field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field(GoodPrice; Rec.GoodPrice)
                {
                    ToolTip = 'Specifies the value of the GoodPrice field.';
                }
                field(GoodQty; Rec.GoodQty)
                {
                    ToolTip = 'Specifies the value of the GoodQty field.';
                }
                field(GoodsAmt; Rec.GoodsAmt)
                {
                    ToolTip = 'Specifies the value of the GoodsAmt field.';
                }
                field(GoodsCode; Rec.GoodsCode)
                {
                    ToolTip = 'Specifies the value of the GoodsCode field.';
                }
                field(GoodsDiscAmt; Rec.GoodsDiscAmt)
                {
                    ToolTip = 'Specifies the value of the GoodsDiscAmt field.';
                }
                field(GoodsDiscFormula; Rec.GoodsDiscFormula)
                {
                    ToolTip = 'Specifies the value of the GoodsDiscFormula field.';
                }
                field(GoodsName; Rec.GoodsName)
                {
                    ToolTip = 'Specifies the value of the GoodsName field.';
                }
                field(GoodsNameEng; Rec.GoodsNameEng)
                {
                    ToolTip = 'Specifies the value of the GoodsNameEng field.';
                }
                field(InvoiceDate; Rec.InvoiceDate)
                {
                    ToolTip = 'Specifies the value of the InvoiceDate field.';
                }
                field(InvoiceNo; Rec.InvoiceNo)
                {
                    ToolTip = 'Specifies the value of the InvoiceNo field.';
                }
                field(ListNo; Rec.ListNo)
                {
                    ToolTip = 'Specifies the value of the ListNo field.';
                }
                field(Lot; Rec.Lot)
                {
                    ToolTip = 'Specifies the value of the Lot field.';
                }
                field(NetAmt; Rec.NetAmt)
                {
                    ToolTip = 'Specifies the value of the NetAmt field.';
                }
                field(Serial; Rec.Serial)
                {
                    ToolTip = 'Specifies the value of the Serial field.';
                }
                field(SumGoodsAmt; Rec.SumGoodsAmt)
                {
                    ToolTip = 'Specifies the value of the SumGoodsAmt field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field(UOMCode; Rec.UOMCode)
                {
                    ToolTip = 'Specifies the value of the UOMCode field.';
                }
                field(UOMName; Rec.UOMName)
                {
                    ToolTip = 'Specifies the value of the UOMName field.';
                }
                field(UOMNameEng; Rec.UOMNameEng)
                {
                    ToolTip = 'Specifies the value of the UOMNameEng field.';
                }
                field(VatAmt; Rec.VatAmt)
                {
                    ToolTip = 'Specifies the value of the VatAmt field.';
                }
                field(resvstr1; Rec.resvstr1)
                {
                    ToolTip = 'Specifies the value of the resvstr1 field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Import CSV")
            {

                trigger OnAction();
                var
                    QuestOrder: XmlPort "Quest Order";
                begin
                    QuestOrder.Run();
                end;
            }
        }
    }
}
