// codeunit 50005 CodeunitDocumentsAttachment
// {
//     trigger OnRun()
//     begin
//         base64String := base64Convert.ToBase64(pdfInstream);
//         TableIncomingDocumentsAttachment.SetRange("Document No.", TableCustomer."No.");
//         if TableIncomingDocumentsAttachment.FindSet() then begin
//             TableIncomingDocumentsAttachment.CalcFields(Content);
//             tempBlob.FromRecord(TableIncomingDocumentsAttachment, TableIncomingDocumentsAttachment.FieldNo(Content));
//             tempBlob.CreateInStream(pdfInStraem);
//             base64Convert := base64Convert.ToBase64(pdfInStraem);
//             TableCustomer.Add('Base64PDF', base64String);
//             TableCustomer.Add('FileName', TableIncomingDocumentsAttachment.Name);
//         end;
//     end;

//     var
//         myInt: Integer;
//         TableIncomingDocumentsAttachment: Record "Incoming Document Attachment";
//         tempBlob: Codeunit "Temp Blob";
//         pdfInStraem: InStream;
//         base64Convert: Codeunit "Base64 Convert";
//         TableCustomer: Record Customer;

// }