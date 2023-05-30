page 50007 GetLastSaleNo
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'getLastSaleNo';
    DelayedInsert = true;
    EntityName = 'bisnoserie';
    EntitySetName = 'bisnoseries';
    PageType = API;
    SourceTable = "No. Series Line";
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(seriesCode; Rec."Series Code")
                {
                    Caption = 'Series Code';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field(startingNo; Rec."Starting No.")
                {
                    Caption = 'Starting No.';
                }
                field(endingNo; Rec."Ending No.")
                {
                    Caption = 'Ending No.';
                }
            }
        }
    }
}
