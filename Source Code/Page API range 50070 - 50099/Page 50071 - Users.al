page 50071 UsersAPI
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'bisuser';
    DelayedInsert = true;
    EntityName = 'bisuser';
    EntitySetName = 'bisusers';
    PageType = API;
    SourceTable = User;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Username; Rec."User Name")
                {
                    Caption = 'Username';
                }
                field("Fullname"; Rec."Full Name")
                {
                    Caption = 'Code';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
