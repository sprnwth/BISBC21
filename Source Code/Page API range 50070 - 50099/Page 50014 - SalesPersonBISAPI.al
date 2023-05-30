page 50014 "Sales Person BIS"
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'salesPersonBIS';
    DelayedInsert = true;
    EntityName = 'bissalesperson';
    EntitySetName = 'bissalespersons';
    PageType = API;
    SourceTable = "Salesperson/Purchaser";
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                
              
                field(areacode;Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Areacode';
                }
                field(targetSalesMonthly; Rec."Target Sales Monthly")
                {
                    Caption = 'Target Sales Monthly';
                }
                field(targetSalesYearly; Rec."Target Sales Yearly")
                {
                    Caption = 'Target Sales Yearly';
                }
            }
        }
    }
}
