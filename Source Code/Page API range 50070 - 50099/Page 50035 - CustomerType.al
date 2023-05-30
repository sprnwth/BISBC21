page 50035 CustomerTypeAPI
{
    
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'customerType';
    DelayedInsert = true;
    EntityName = 'biscustomertype';
    EntitySetName = 'biscustomertypes';
    PageType = API;
    SourceTable = customerType;

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
