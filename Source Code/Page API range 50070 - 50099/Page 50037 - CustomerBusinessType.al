page 50037 "Customer Business Type"
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'customerBusinessType';
    DelayedInsert = true;
    EntityName = 'biscustbustype';
    EntitySetName = 'biscustbustypes';
    PageType = API;
    SourceTable = customerbusinessType;

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
    var r : Report 1320;
}
