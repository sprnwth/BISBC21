// pageextension 50105 DocumentAttachment extends "Document Attachment Details"
// {
//     layout
//     {
//         addafter("File Type")
//         {
//             field("ID"; Rec."ID")
//             {
//                 ApplicationArea = All;

//                 trigger OnDrillDown()
//                 var
//                     FileMedia: Record "Document Attachment";
//                     InS: InStream;
//                     OutS: OutStream;
//                     FileMgt: Codeunit "File Management";
//                     TempBlob: Codeunit "Temp Blob";
//                     FileName: Text[50];
//                 begin
//                     FileMedia.Reset();
//                     FileMedia.SetRange(ID, Rec.ID);
//                     FileName := '';
//                     if FileMedia.FindSet() then
//                         if FileMedia.FileContentBlob.HasValue then begin
//                             FileMedia.CalcFields(FileContentBlob);
//                             FileName := FileMedia."File Name" + '.pdf';
//                             FileMedia.FileContentBlob.CreateInStream(InS);
//                             DownloadFromStream(InS, 'Export', '', 'All Files (*.*)|*.*', FileName);
//                         end;
//                 end;
//             }
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }