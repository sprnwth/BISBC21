page 50038 ItemGroupTypeAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'itemGroupTypeAPI';
    DelayedInsert = true;
    EntityName = 'bisitemgrouptype';
    EntitySetName = 'bisitemgrouptypes';
    PageType = API;
    SourceTable = ItemgroupType;
    
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
                field(biscode;Rec."BIS Code")
                {
                }
            }
        }
    }
}
