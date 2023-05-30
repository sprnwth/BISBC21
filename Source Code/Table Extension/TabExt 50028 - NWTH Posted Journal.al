tableextension 50028 NWTHPostedJournalBISExt extends "NWTH Posted Journal"
{
    fields
    {
        // Add changes to table fields here

        field(50004; "Cheque Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Cheque Branch Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

    }
   

    var
        myInt: Integer;
}