codeunit 50100 "Post Order"
{
    TableNo = "Rental Sales Header";

    trigger OnRun()
    begin
        CopyOrderToPosted(Rec);
    end;

    local procedure CopyOrderToPosted("Rental Sales Header": Record "Rental Sales Header")
    var
        "Posted Rental Sales Header": Record "Posted Rental Sales Header";
        PostDocNo: Code[20];
    begin
        "Posted Rental Sales Header"."Document No." := '';
        "Posted Rental Sales Header".Insert(true);
        PostDocNo := "Posted Rental Sales Header"."Document No.";
        "Posted Rental Sales Header".TransferFields("Rental Sales Header");
        "Posted Rental Sales Header"."Document No." := PostDocNo;
        "Posted Rental Sales Header".Modify(true);
        CopyOrderLineToPosted("Rental Sales Header", PostDocNo);
        "Rental Sales Header".Delete(true);
    end;

    local procedure CopyOrderLineToPosted("Rental Sales Header": Record "Rental Sales Header"; PostDocNo: Code[20])
    var
        "Rental Sales Line": Record "Rental Sales Line";
        "Posted Rental Sales Line": Record "Posted Rental Sales Line";
    begin
        "Rental Sales Line".SetRange("Document No.", "Rental Sales Header"."Document No.");
        if not "Rental Sales Line".FindSet(false, false) then
            exit;
        repeat
            "Posted Rental Sales Line"."Document No." := PostDocNo;
            "Posted Rental Sales Line"."Line No." := "Rental Sales Line"."Line No.";
            "Posted Rental Sales Line".Insert(true);
            "Posted Rental Sales Line".TransferFields("Rental Sales Line");
            "Posted Rental Sales Line"."Document No." := PostDocNo;
            "Posted Rental Sales Line".Modify(true);
        until "Rental Sales Line".Next() = 0;
    end;
}
