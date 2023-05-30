table 50002 EclLevel
{
    DataClassification = ToBeClassified;

    fields
    {
       
        field(1; ID; Integer)
        {
            Caption = 'ID';
            AutoIncrement = true;
        }
        field(2; Starting; Decimal)
        {
            Caption = 'Starting';
        }
        field(3; Ending; Decimal)
        {
            Caption = 'Ending';
        }
        field(4; Aging; Decimal)
        {
            Caption = 'Aging';
        }
        field(5; EclPercent; Decimal)
        {
            Caption = 'ECL %';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

}