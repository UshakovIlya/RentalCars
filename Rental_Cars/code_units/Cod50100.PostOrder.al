codeunit 50100 "Post Order"
{
    TableNo = "Rental Sales Header";

    trigger OnRun()
    begin
        CopyOrderToPosted(Rec);
    end;

    local procedure CopyOrderToPosted(RentalSalesHeader: Record "Rental Sales Header")
    var
        PostedRentalSalesHeader: Record "Posted Rental Sales Header";
        PostDocNo: Code[20];
    begin
        PostedRentalSalesHeader."Document No." := '';
        PostedRentalSalesHeader.Insert(true);
        PostDocNo := PostedRentalSalesHeader."Document No.";
        PostedRentalSalesHeader.TransferFields(RentalSalesHeader);
        PostedRentalSalesHeader."Document No." := PostDocNo;
        PostedRentalSalesHeader.Modify(true);
        CopyOrderLineToPosted(RentalSalesHeader, PostDocNo);
        RentalSalesHeader.Delete(true);

    end;

    local procedure CopyOrderLineToPosted(RentalSalesHeader: Record "Rental Sales Header"; PostDocNo: Code[20])
    var
        RentalSalesLine: Record "Rental Sales Line";
        PostedRentalSalesLine: Record "Posted Rental Sales Line";
    begin
        RentalSalesLine.SetRange("Document No.", RentalSalesHeader."Document No.");
        if not RentalSalesLine.FindSet(false, false) then
            exit;
        repeat
            PostedRentalSalesLine."Document No." := PostDocNo;
            PostedRentalSalesLine."Line No." := RentalSalesLine."Line No.";
            PostedRentalSalesLine.Insert(true);
            PostedRentalSalesLine.TransferFields(RentalSalesLine);
            PostedRentalSalesLine."Document No." := PostDocNo;
            PostedRentalSalesLine.Modify(true);
        until RentalSalesLine.Next() = 0;

    end;
}
