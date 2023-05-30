page 50042 EclSetting
{
    PageType = List;
    SourceTable = EclLevel;
    Caption = 'ECL Setting';
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Starting; Rec.Starting)
                {
                }
                field(Ending; Rec.Ending)
                {
                }
                field(Aging; Rec.Aging)
                {
                }
                field("ECL %"; Rec.EclPercent)
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}