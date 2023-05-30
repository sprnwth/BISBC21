// table 50107 SalesHeaderAttachApi
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; ID; Integer)
//         {
//             AutoIncrement = true;
//             Caption = 'ID';

//         }
//         field(2; FileContent; Blob)
//         {
//             Caption = 'File Content';
//         }
//         field(3; FileName; Text[250])
//         {
//             Caption = 'File Name';
//         }
//         field(4; "File Type"; Enum "Document Attachment File Type")
//         {
//             Caption = 'File Type';
//         }
//         field(5; "File Extension"; Text[30])
//         {
//             Caption = 'File Extension';
//         }
//         field(6; "Ref. System ID"; Guid)
//         {
//             Caption = 'Ref. System ID';
//         }
//         field(7; "Document Type"; Enum "Sales Document Type")
//         {
//             Caption = 'Document Type';
//         }
//         field(8; "No."; Code[20])
//         {
//             Caption = 'No.';
//         }
//         field(9; "Line No."; Integer)
//         {
//             Caption = 'Line No.';
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
//         myInt: Integer;

//     trigger OnInsert()
//     begin

//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

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