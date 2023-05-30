page 50033 subgroup2API
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'subgroup2API';
    DelayedInsert = true;
    EntityName = 'bisitemsubgroup2';
    EntitySetName = 'bisitemsubgroup2s';
    PageType = API;
    SourceTable = "Item Category";
    
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
                field(engdescription;Rec."ENG Description")
                {
                    
                }
            }
        }
    }
}
