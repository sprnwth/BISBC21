query 50014 UpdateCertificate
{
    QueryType = Normal;
 DataAccessIntent = ReadOnly;
    elements
    {
        dataitem(Purch__Inv__Line; "Purch. Inv. Line")
        {
            DataItemTableFilter = "NWTH WHT %" = filter(<> 0);
            column(Document_No_; "Document No.")
            {

            }
            column(NWTH_Document_Date; "NWTH Document Date")
            {

            }
            column(NWTH_Vendor_No_; "NWTH Vendor No.")
            {

            }
            column(NWTH_WHT_Custom_Address; "NWTH WHT Custom Address")
            {

            }

            column(Cnt)
            {
                Method = Count;
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;

    Var
}