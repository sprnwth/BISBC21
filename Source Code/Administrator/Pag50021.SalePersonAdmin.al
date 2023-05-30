page 50021 SalePersonAdmin
{
    ApplicationArea = All;
    Caption = 'SalePersonAdmin';
    PageType = List;
    SourceTable = "Salesperson/Purchaser";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies a code for the salesperson or purchaser.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name of the salesperson or purchaser.';
                }
                field("Commission %"; Rec."Commission %")
                {
                    ToolTip = 'Specifies the percentage to use to calculate the salesperson''s commission.';
                }
                field(Image; Rec.Image)
                {
                    ToolTip = 'Specifies the picture that has been inserted for the salesperson or purchaser.';
                }
                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                }
                // field("Coupled to CRM"; Rec."Coupled to CRM")
                // {
                //     ToolTip = 'Specifies that the salesperson/purchaser is coupled to a user in Dataverse.';
                // }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the salesperson''s email address.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the salesperson''s telephone number.';
                }
                field("Next Task Date"; Rec."Next Task Date")
                {
                    ToolTip = 'Specifies the date of the next task assigned to the salesperson.';
                }
                field("No. of Opportunities"; Rec."No. of Opportunities")
                {
                    ToolTip = 'Specifies the number of open opportunities handled by the salesperson.';
                }
                field("Estimated Value (LCY)"; Rec."Estimated Value (LCY)")
                {
                    ToolTip = 'Specifies the total estimated value of all the opportunities handled by the salesperson. The field is not editable.';
                }
                field("Calcd. Current Value (LCY)"; Rec."Calcd. Current Value (LCY)")
                {
                    ToolTip = 'Specifies the total calculated current value of all the opportunities handled by the salesperson. The field is not editable.';
                }
                field("No. of Interactions"; Rec."No. of Interactions")
                {
                    ToolTip = 'Specifies the number of interactions handled by this salesperson.';
                }
                field("Cost (LCY)"; Rec."Cost (LCY)")
                {
                    ToolTip = 'Specifies the total cost of all the interactions handled by the salesperson. The field is not editable.';
                }
                field("Duration (Min.)"; Rec."Duration (Min.)")
                {
                    ToolTip = 'Specifies the total duration of all the interactions handled by the salesperson. The field is not editable.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the salesperson''s job title.';
                }
                field("Avg. Estimated Value (LCY)"; Rec."Avg. Estimated Value (LCY)")
                {
                    ToolTip = 'Specifies the average estimated value of the opportunities handled by the salesperson.';
                }
                field("Avg.Calcd. Current Value (LCY)"; Rec."Avg.Calcd. Current Value (LCY)")
                {
                    ToolTip = 'Specifies the average calculated current value of the opportunities handled by that salesperson.';
                }
                field("Opportunity Entry Exists"; Rec."Opportunity Entry Exists")
                {
                    ToolTip = 'Specifies the value of the Opportunity Entry Exists field.';
                }
                field("Task Entry Exists"; Rec."Task Entry Exists")
                {
                    ToolTip = 'Specifies the value of the Task Entry Exists field.';
                }
                field("Search E-Mail"; Rec."Search E-Mail")
                {
                    ToolTip = 'Specifies the value of the Search Email field.';
                }
                field("E-Mail 2"; Rec."E-Mail 2")
                {
                    ToolTip = 'Specifies the value of the Email 2 field.';
                }
                field("Target Sales Monthly"; Rec."Target Sales Monthly")
                {
                    ToolTip = 'Specifies the value of the Target Sales Monthly field.';
                }
                field("Target Sales Yearly"; Rec."Target Sales Yearly")
                {
                    ToolTip = 'Specifies the value of the Target Sales Yearly field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field(Initial; Rec.Initial)
                {
                    ToolTip = 'Specifies the value of the Initial field.';
                }
                field("Shortcut Dimension 6 Code";Rec."Shortcut Dimension 6 Code")
                {
                    ToolTip = 'Specifies the value of the Areacode field.';
                }
                field("Employee Head"; Rec."Employee Head")
                {
                    ToolTip = 'Specifies the value of the Employee Head field.';
                }
                field(Team; Rec.Team)
                {
                    ToolTip = 'Specifies the value of the Team field.';
                }
                field(Buddy; Rec.Buddy)
                {
                    ToolTip = 'Specifies the value of the Buddy field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Update Employee")
            {

                trigger OnAction()
                var
                    Employee: Record Employee;
                    SalePerson: Record "Salesperson/Purchaser";
                begin
                    SalePerson.Reset();
                    if SalePerson.findset() then
                        repeat
                            if Employee.get(SalePerson.Code) then begin
                                SalePerson.Validate("Employee No.", Employee."No.");
                                SalePerson.Modify();
                            end;
                        until SalePerson.Next() = 0;
                    message('Finished');
                end;
            }
        }
    }
}
