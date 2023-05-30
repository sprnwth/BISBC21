page 50032 "Subgroup1 API"
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'subgroup1API';
    DelayedInsert = true;
    EntityName = 'bisitemsubgroup1';
    EntitySetName = 'bisitemsubgroup1s';
    PageType = API;
    SourceTable = Itemsubgroup1;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}
