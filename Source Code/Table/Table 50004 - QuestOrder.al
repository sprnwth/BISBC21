table 50004 "Quest Order"
{
    Caption = 'Quest Order';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; DocID; Code[20])
        {
            Caption = 'DocID';
            DataClassification = ToBeClassified;
        }
        field(3; DocNo; Code[20])
        {
            Caption = 'DocNo';
            DataClassification = ToBeClassified;
        }
        field(4; DocDate; Date)
        {
            Caption = 'DocDate';
            DataClassification = ToBeClassified;
        }
        field(5; InvoiceNo; Code[20])
        {
            Caption = 'InvoiceNo';
            DataClassification = ToBeClassified;
        }
        field(6; InvoiceDate; Date)
        {
            Caption = 'InvoiceDate';
            DataClassification = ToBeClassified;
        }
        field(7; CashierCode; Code[20])
        {
            Caption = 'CashierCode';
            DataClassification = ToBeClassified;
        }
        field(8; CashierName; Text[100])
        {
            Caption = 'CashierName';
            DataClassification = ToBeClassified;
        }
        field(9; CashierNameEng; Text[100])
        {
            Caption = 'CashierNameEng';
            DataClassification = ToBeClassified;
        }
        field(10; CustType; Code[10])
        {
            Caption = 'CustType';
            DataClassification = ToBeClassified;
        }
        field(11; CustCode; Code[20])
        {
            Caption = 'CustCode';
            DataClassification = ToBeClassified;
        }
        field(12; CustName; Text[100])
        {
            Caption = 'CustName';
            DataClassification = ToBeClassified;
        }
        field(13; CustNameEng; Text[100])
        {
            Caption = 'CustNameEng';
            DataClassification = ToBeClassified;
        }
        field(14; ListNo; Code[10])
        {
            Caption = 'ListNo';
            DataClassification = ToBeClassified;
        }
        field(15; GoodsCode; Code[20])
        {
            Caption = 'GoodsCode';
            DataClassification = ToBeClassified;
        }
        field(16; GoodsName; Text[100])
        {
            Caption = 'GoodsName';
            DataClassification = ToBeClassified;
        }
        field(17; GoodsNameEng; Text[100])
        {
            Caption = 'GoodsNameEng';
            DataClassification = ToBeClassified;
        }
        field(18; UOMCode; Code[10])
        {
            Caption = 'UOMCode';
            DataClassification = ToBeClassified;
        }
        field(19; UOMName; Text[50])
        {
            Caption = 'UOMName';
            DataClassification = ToBeClassified;
        }
        field(20; UOMNameEng; Text[50])
        {
            Caption = 'UOMNameEng';
            DataClassification = ToBeClassified;
        }
        field(21; GoodQty; Decimal)
        {
            Caption = 'GoodQty';
            DataClassification = ToBeClassified;
        }
        field(22; GoodPrice; Decimal)
        {
            Caption = 'GoodPrice';
            DataClassification = ToBeClassified;
        }
        field(23; GoodsDiscFormula; Decimal)
        {
            Caption = 'GoodsDiscFormula';
            DataClassification = ToBeClassified;
        }
        field(24; GoodsDiscAmt; Decimal)
        {
            Caption = 'GoodsDiscAmt';
            DataClassification = ToBeClassified;
        }
        field(25; GoodsAmt; Decimal)
        {
            Caption = 'GoodsAmt';
            DataClassification = ToBeClassified;
        }
        field(26; SumGoodsAmt; Decimal)
        {
            Caption = 'SumGoodsAmt';
            DataClassification = ToBeClassified;
        }
        field(27; BillDiscFormula; Decimal)
        {
            Caption = 'BillDiscFormula';
            DataClassification = ToBeClassified;
        }
        field(28; BillDiscAmt; Decimal)
        {
            Caption = 'BillDiscAmt';
            DataClassification = ToBeClassified;
        }
        field(29; BillAfterDiscAmt; Decimal)
        {
            Caption = 'BillAfterDiscAmt';
            DataClassification = ToBeClassified;
        }
        field(30; VatAmt; Decimal)
        {
            Caption = 'VatAmt';
            DataClassification = ToBeClassified;
        }
        field(31; NetAmt; Decimal)
        {
            Caption = 'NetAmt';
            DataClassification = ToBeClassified;
        }
        field(32; DocType; Code[10])
        {
            Caption = 'DocType';
            DataClassification = ToBeClassified;
        }
        field(33; Lot; Code[50])
        {
            Caption = 'Lot';
            DataClassification = ToBeClassified;
        }
        field(34; Serial; Code[50])
        {
            Caption = 'Serial';
            DataClassification = ToBeClassified;
        }
        field(35; CustBillName; Text[100])
        {
            Caption = 'CustBillName';
            DataClassification = ToBeClassified;
        }
        field(36; CustShortName; Text[50])
        {
            Caption = 'CustShortName';
            DataClassification = ToBeClassified;
        }
        field(37; CustTaxID; Code[20])
        {
            Caption = 'CustTaxID';
            DataClassification = ToBeClassified;
        }
        field(38; resvstr1; Code[20])
        {
            Caption = 'resvstr1';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
