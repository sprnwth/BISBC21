tableextension 50043 WHActivityHdrBISExt extends "Warehouse Activity Header"
{
    fields
    {
        field(50000; "Approve break FEFO"; Boolean)
        {
            Caption = 'Approve break FEFO';
            DataClassification = ToBeClassified;

            trigger OnLookup()
            var
                WorkflowuserGroup: Record "Workflow User Group";
                WorkflowUserGroupMember: Record "Workflow User Group Member";
            begin

                if "Approve break FEFO" then begin
                    if confirm('กรุณายืนยันการหยิบสินค้าข้ามวันที่หมดอายุ') then begin
                        "Sender USERID" := UserId;
                        WorkflowuserGroup.Reset();
                        WorkflowuserGroup.setrange(FEFO, true);
                        WorkflowuserGroup.FindFirst();
                        WorkflowUserGroupMember.Reset();
                        WorkflowUserGroupMember.setrange("Workflow User Group Code", WorkflowuserGroup.Code);
                        "Approve USERID" := WorkflowUserGroupMember."User Name";
                    end else
                        Error('ยกเลิก');
                end else begin
                    "Sender USERID" := '';
                    "Approve USERID" := '';
                end;
            end;
        }
        field(50001; "Sender USERID"; Code[50])
        {
            Caption = 'Sender USERID';
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(50002; "Approve USERID"; Code[50])
        {
            Caption = 'Approve USERID';
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
    }
}
