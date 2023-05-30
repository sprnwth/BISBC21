page 50077 Item
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'bisitem';
    DelayedInsert = true;
    EntityName = 'bisitem';
    EntitySetName = 'bisitems';
    PageType = API;
    SourceTable = Item;
    ODataKeyFields = SystemId;
    Editable = true;
    Permissions = tabledata Item = rimd;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec."No.")
                {
                    Caption = 'Username';
                }
                field(ItemTrackingCode; Rec."Item Tracking Code")
                {
                    Caption = 'SystemId';
                }
                field(systemId; Rec.SystemId)
                {

                }
            }
        }
    }
}
