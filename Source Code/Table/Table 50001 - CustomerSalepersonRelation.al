table 50001 "Customer Saleperson Relation"
{
    Caption = 'Customer Saleperson Relation';
    DataClassification = ToBeClassified;
    LookupPageId = "Cust Saleperson Relation";
    fields
    {
        field(1; "Customer no."; Code[20])
        {
            Caption = 'Customer no.';
            DataClassification = ToBeClassified;
            TableRelation = customer;
        }
        field(2; "Sale Personcode"; Code[20])
        {
            Caption = 'Sale Personcode';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
        field(3; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Sale Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Customer no.", "Sale Personcode")
        {
            Clustered = true;
        }
    }


}
