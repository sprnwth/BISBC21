page 50013 "Document Attachedment API"
{
    APIGroup = 'bis';
    APIPublisher = 'nwth';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'documentAttachedmentAPI';
    DelayedInsert = true;
    EntityName = 'bisdocattachment';
    EntitySetName = 'bisdocattachments';
    PageType = API;
    SourceTable = "Document Attachment";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(tableid; tableid)
                {

                }
                field(refdoctype; refdoctype)
                {

                }
                field(refno; refno)
                {
                }
                field(fileName; FileName)
                {

                }
                field(base64value; Base64Value)
                {
                    Caption = 'base64value';
                    trigger OnValidate()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        Base64CU: codeunit "Base64 Convert";
                        OutStr: OutStream;
                        SalesHeader: Record "Sales Header";
                        Customer: Record Customer;
                    begin                        
                        case tableid of
                            database::customer:
                                begin
                                    customer.get(refno);
                                    RecRef.Open(tableid, false);
                                    Recref.GetBySystemId(Customer.SystemId);
                                end;
                            database::"Sales Header":
                                begin
                                    SalesHeader.get(refdoctype, refno);
                                    RecRef.Open(tableid, false);
                                    Recref.GetBySystemId(SalesHeader.SystemId);
                                end;
                            else
                                Error('table id %1 cannot be use', tableid);
                        end;
                        If Base64Value <> '' then begin

                            TempBlob.CreateOutStream(OutStr);
                            TempBlob.CreateInStream(DocStream);
                            Base64CU.FromBase64(Base64Value, OutStr);
                            CopyStream(OutStr, DocStream);
                            Rec.SaveAttachmentFromStream(DocStream, RecRef, FileName);
                            RecRef.Close();
                        end;
                    end;
                }

            }
        }
    }

    var
        refno: Code[20];
        refdoctype: enum "Sales Document Type";
        tableid: Integer;
        Base64Value: Text;
        DocStream: InStream;
        RecRef: RecordRef;
        FileName: Text[100];
        refdocsystemid: Guid;
        DocAttachedment: Record "Document Attachment";
        docat: page "Document Attachment Details";
}
