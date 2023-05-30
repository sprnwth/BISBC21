// table 50106 CustomerAttachments
// {
//     DataClassification = ToBeClassified;
//     // LookupPageID = "Sales Lines";

//     fields
//     {
//         field(1; ID; Integer)
//         {
//             Caption = 'ID';
//             AutoIncrement = true;
//             // TableRelation = Currency.SystemId;
//             // Editable = false;
//         }
//         field(2; "Table ID"; Integer)
//         {
//             Caption = 'Table ID';
//             // NotBlank = true;
//             // TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(Table));
//         }
//         field(3; "No."; Code[20])
//         {
//             Caption = 'No.';
//             // NotBlank = true;
//         }
//         field(4; "Attached Date"; DateTime)
//         {
//             Caption = 'Attached Date';
//         }
//         field(5; "File Name"; Text[250])
//         {
//             Caption = 'Attachment';
//         }
//         field(6; "File Type"; Enum "Document Attachment File Type")
//         {
//             Caption = 'File Type';
//         }
//         field(7; "File Extension"; Text[30])
//         {
//             Caption = 'File Extension';
//         }
//         field(8; "Document Reference ID"; Media)
//         {
//             Caption = 'Document Reference ID';
//         }
//         field(9; "Attached By"; Guid)
//         {
//             Caption = 'Attached By';
//             // Editable = false;
//             // TableRelation = User."User Security ID" WHERE("License Type" = CONST("Full User"));
//         }
//         field(10; User; Code[50])
//         {
//             // CalcFormula = Lookup(User."User Name" WHERE("User Security ID" = FIELD("Attached By"),
//             //  "License Type" = CONST("Full User")));
//             Caption = 'User';
//             // Editable = false;
//             // FieldClass = FlowField;
//         }
//         field(11; "Document Flow Purchase"; Boolean)
//         {
//             Caption = 'Flow to Purch. Trx';
//         }
//         field(12; "Document Flow Sales"; Boolean)
//         {
//             Caption = 'Flow to Sales Trx';
//         }
//         field(13; "Document Type"; Enum "Attachment Document Type")
//         {
//             Caption = 'Document Type';
//         }
//         field(14; "Line No."; Integer)
//         {
//             Caption = 'Line No.';
//         }
//         field(15; "Content"; Blob)
//         {
//             Caption = 'Content';
//         }
//         field(16; "FileContent"; Blob)
//         {
//             Caption = 'Content';
//             DataClassification = CustomerContent;
//             Subtype = Bitmap;
//         }
//         field(17; "FileContent2"; Media)
//         {
//             Caption = 'Content1';
//         }
//         field(18; "Document Reference ID MediaSet"; MediaSet)
//         {
//             Caption = 'Document Reference ID';
//         }
//         field(19; "Customer No."; Text[250])
//         {
//             Caption = 'Customer No.';
//         }
//         field(20; "Ref. System ID"; Guid)
//         {
//             Caption = 'Ref. System ID';
//         }
//     }

//     keys
//     {
//         key(Key1; ID)
//         {
//             Clustered = true;
//         }
//     }

//     var
//         table1: Record 1173;

//     procedure ImportAttachment(Bit64InputValue: Text)
//     var
//         Base64Convert: Codeunit "Base64 Convert";
//         TempBlob: Codeunit "Temp Blob";
//         TempOutstram: OutStream;
//         Recref: RecordRef;
//     begin
//         If Bit64InputValue = '' then
//             exit;
//         Recref.Open(Database::CustomerAttachments);
//         Recref.GetTable(Rec);
//         TempBlob.CreateOutStream(TempOutstram);
//         Base64Convert.FromBase64(Bit64InputValue, TempOutstram);

//         TempBlob.ToRecordRef(Recref, Rec.FieldNo(FileContent));
//         Recref.SetTable(Rec);
//         Recref.Close();
//     end;

// }