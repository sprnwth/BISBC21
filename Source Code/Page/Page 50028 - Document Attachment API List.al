page 50028 "Document Attachment API List"
{
    Caption = 'Document Attachment API List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Document Attachment";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("ID"; Rec."ID")
                {

                }
                field("TableID"; Rec."Table ID")
                {

                }
                field("Line No."; Rec."Line No.")
                {

                }
                field("No"; Rec."No.")
                {

                }
                field("FileName"; Rec."File Name")
                {

                }
                field("File Extension"; Rec."File Extension")
                {

                }
                field("Attached Date"; Rec."Attached Date")
                {

                }
                field("File Type"; Rec."File Type")
                {

                }
                field("Document Reference ID"; Rec."Document Reference ID")
                {
                }
                field("Attached By"; Rec."Attached By")
                {

                }
                field("User"; Rec.User)
                {

                }
                field("Document Type"; Rec."Document Type")
                {

                }
                field("Document Flow Sales"; Rec."Document Flow Sales")
                {

                }
                field("System ID"; Rec.SystemId)
                {
                }
                field("File Content"; Rec.FileContent)
                {
                    // Editable = false;
                    // ToolTip = 'Specifies the filename of the attachment.';

                    // trigger OnDrillDown()
                    // var
                    //     Selection: Integer;
                    // begin
                    //     if FileContent.HasValue() then
                    //         Export(true)
                    //     else
                    //         if not IsOfficeAddin or not EmailHasAttachments then
                    //             InitiateUploadFile()
                    //         else begin
                    //             Selection := StrMenu(MenuOptionsTxt, 1, SelectInstructionTxt);
                    //             case
                    //                 Selection of
                    //                 1:
                    //                     InitiateAttachFromEmail();
                    //                 2:
                    //                     InitiateUploadFile();
                    //             end;
                    //         end;
                    // end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Tranfer Data To Customer Master")
            {
                Caption = 'Tranfer To Customer Master';
                Image = Import;

                trigger OnAction()
                var
                    TableAttachments: Record "Document Attachment";
                begin
                    TableAttachments.Reset();
                    if TableAttachments.FindSet() then
                        repeat
                            Message(Format(TableAttachments."Document Reference ID"));
                        until TableAttachments.Next() = 0;     // Break row = 0  
                end;

            }
        }
    }

    var
        BisTransferDataCustomer: Codeunit BisFunctionCenter;
        sdff: Page "Order Processor Role Center";
}