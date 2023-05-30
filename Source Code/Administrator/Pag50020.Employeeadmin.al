page 50020 EmployeeAdmin
{
    ApplicationArea = All;
    Caption = 'EmployeeAdmin';
    PageType = List;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the employee''s middle name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field(Initials; Rec.Initials)
                {
                    ToolTip = 'Specifies the employee''s initials.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the employee''s address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies additional address information.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the city of the address.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the postal code.';
                }
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the county of the employee.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the employee''s private telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the employee''s private email address.';
                }
                field("Alt. Address Code"; Rec."Alt. Address Code")
                {
                    ToolTip = 'Specifies a code for an alternate address.';
                }
                field("Alt. Address Start Date"; Rec."Alt. Address Start Date")
                {
                    ToolTip = 'Specifies the starting date when the alternate address is valid.';
                }
                field("Alt. Address End Date"; Rec."Alt. Address End Date")
                {
                    ToolTip = 'Specifies the last day when the alternate address is valid.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ToolTip = 'Specifies the employee''s date of birth.';
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ToolTip = 'Specifies the social security number of the employee.';
                }
                field("Union Code"; Rec."Union Code")
                {
                    ToolTip = 'Specifies the employee''s labor union membership code.';
                }
                field("Union Membership No."; Rec."Union Membership No.")
                {
                    ToolTip = 'Specifies the employee''s labor union membership number.';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the employee''s gender.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("Manager No."; Rec."Manager No.")
                {
                    ToolTip = 'Specifies the value of the Manager No. field.';
                }
                field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
                {
                    ToolTip = 'Specifies the employment contract code for the employee.';
                }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ToolTip = 'Specifies a statistics group code to assign to the employee for statistical purposes.';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the employment status of the employee.';
                }
                field("Inactive Date"; Rec."Inactive Date")
                {
                    ToolTip = 'Specifies the date when the employee became inactive, due to disability or maternity leave, for example.';
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ToolTip = 'Specifies a code for the cause of inactivity by the employee.';
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ToolTip = 'Specifies the date when the employee was terminated, due to retirement or dismissal, for example.';
                }
                field("Grounds for Term. Code"; Rec."Grounds for Term. Code")
                {
                    ToolTip = 'Specifies a termination code for the employee who has been terminated.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ToolTip = 'Specifies a resource number for the employee.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies if a comment has been entered for this entry.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ToolTip = 'Specifies when this record was last modified.';
                }
                field("Total Absence (Base)"; Rec."Total Absence (Base)")
                {
                    ToolTip = 'Specifies the value of the Total Absence (Base) field.';
                }
                field(Extension; Rec.Extension)
                {
                    ToolTip = 'Specifies the employee''s telephone extension.';
                }
                field(Pager; Rec.Pager)
                {
                    ToolTip = 'Specifies the employee''s pager number.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ToolTip = 'Specifies the value of the Fax No. field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ToolTip = 'Specifies the employee''s email address at the company.';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ToolTip = 'Specifies a salesperson or purchaser code for the employee.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Last Modified Date Time"; Rec."Last Modified Date Time")
                {
                    ToolTip = 'Specifies the value of the Last Modified Date Time field.';
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ToolTip = 'Specifies the employee''s type to link business transactions made for the employee with the appropriate account in the general ledger.';
                }
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ToolTip = 'Specifies a number of the bank branch.';
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ToolTip = 'Specifies the number used by the bank for the bank account.';
                }
                field(IBAN; Rec.IBAN)
                {
                    ToolTip = 'Specifies the bank account''s international bank account number.';
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("SWIFT Code"; Rec."SWIFT Code")
                {
                    ToolTip = 'Specifies the SWIFT code (international bank identifier code) of the bank where the employee has the account.';
                }
                field("Application Method"; Rec."Application Method")
                {
                    ToolTip = 'Specifies how to apply payments to entries for this employee.';
                }

                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                }
                field("Cost Center Code"; Rec."Cost Center Code")
                {
                    ToolTip = 'Specifies the value of the Cost Center Code field.';
                }
                field("Cost Object Code"; Rec."Cost Object Code")
                {
                    ToolTip = 'Specifies the value of the Cost Object Code field.';
                }

                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ToolTip = 'Specifies the value of the Payment Terms Code field.';
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ToolTip = 'Specifies the value of the Employee Type field.';
                }
                field(username; Rec.username)
                {
                    ToolTip = 'Specifies the value of the username field.';
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.';
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
            action("Update Sales Person Code")
            {

                trigger OnAction()
                var
                    Employee: Record Employee;
                    SalePerson: Record "Salesperson/Purchaser";
                begin
                    Employee.Reset();
                    if Employee.findset() then
                        repeat
                            if SalePerson.get(Employee."No.") then begin
                                Employee.Validate("Salespers./Purch. Code", Employee."No.");
                                Employee.Modify();

                            end;
                        until Employee.Next() = 0;
                    message('Finished');
                end;
            }
        }
    }
}
