query 50011 EmployeeandSalesperson
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    EntityName = 'bissaleperson';
    EntitySetName = 'bissalepersons';
    QueryType = API;
     DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(salespersonPurchaser; "Salesperson/Purchaser")
        {
            column("code"; "Code")
            {
            }
            column(name; Name)
            {
            }
            column(eMail; "E-Mail")
            {
            }
            column(phoneNo; "Phone No.")
            {
            }
            column(targetSalesMonthly; "Target Sales Monthly")
            {
            }
            column(targetSalesYearly; "Target Sales Yearly")
            {
            }
           
            column(initial; Initial)
            {
            }
            column(employeeHead; "Employee Head")
            {
            }
            column(team; Team)
            {
            }
            column(buddy; Buddy)
            {
            }
            column(areacode;"Shortcut Dimension 6 Code")
            {
            }
            dataitem(Employee;Employee)
            {
                DataItemLink = "No." = salespersonPurchaser.Code;
                column(Employment_Date;"Employment Date")
                {
                    
                }
                column(Employee_Type;"Employee Type")
                {
                    
                }
                column(username;username)
                {
                    
                }
                column(Password;Password)
                {
                    
                }
            }
        }
    }
    
    trigger OnBeforeOpen()
    begin
    
    end;
}
