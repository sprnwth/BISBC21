pageextension 50023 WorkflowUserGroup extends "Workflow User Group"
{
    layout
    {
        addafter(Code)
        {
            field(FEFO; Rec.FEFO)
            {
                ApplicationArea = All;

            }
        }
    }
}
