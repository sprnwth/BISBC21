tableextension 50008 DocumentAttachmentApi extends "Document Attachment"
{
    fields
    {
        field(500; FileContent; Media)
        {
            DataClassification = ToBeClassified;
        }
        field(501; FileContentBlob; Blob)
        {
            DataClassification = ToBeClassified;
        }
        // Add changes to table fields here
    }

    var
        myInt: Integer;
}