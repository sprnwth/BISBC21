tableextension 50019 SalesSetupBISExt extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        /// <summary>
        /// (BIS) Max Overdue Date for Over due calculation
        /// </summary>
        field(50000; "Max Overdue Date"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        /// <summary>
        /// (BIS) Autoblock after create Customer
        /// </summary>
        field(50001; "Autoblock after create"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        /// <summary>
        /// (BIS) Force to validate Sales Person by Sales person relation table
        /// </summary>
        field(50002; "Force Sales Person by Rel."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        /// <summary>
        /// (BIS) Copy Posting Group and Description From Sales Shipment Line for Item Charge Line
        /// </summary>
        field(50003; "ISO for SI"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Copy Ship. to Item Charge"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Customer Workflow Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Workflow";
        }
        field(50006; "Order Workflow Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Workflow";
        }
        field(50007; "Max Credit Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Skip Desc. Line Get Ship."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}