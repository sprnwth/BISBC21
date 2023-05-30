pageextension 50029 EmployeeList extends "Employee List"
{
    layout
    {
        
        addafter("Last Name")
        {
            field(Gender;Rec.Gender)
            {
                ApplicationArea = All;
                
            }
         
            field("Employment Date";Rec."Employment Date")
            {
                ApplicationArea = All;
                
            }
            field(Status;Rec.Status)
            {
                ApplicationArea = All;
                
            }
            field("Union Membership No.";Rec."Union Membership No.")
            {
                ApplicationArea = All;
                
            }
            field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                
            }
            field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
                
            }
            field("Salespers./Purch. Code";Rec."Salespers./Purch. Code")
            {
                ApplicationArea = All;
                
            }
            
        }
        addlast(Control1)
        {
            field(Balance;Rec.Balance)
            {
                ApplicationArea = All;
                
            }
        }
    }
}
