codeunit 50102 UpdateTotalSum
{
    TableNo = "Rental Sales Line";

    trigger OnRun()
    var
        "Rental Sales Header": Record "Rental Sales Header";
        TotalAmount: Decimal;
        Disc: Decimal;
        MyDate: Duration;
        Duto: Date;
    begin
        if Rec."Rental Start" = Duto then
            exit;
        if Rec."Rental End" = Duto then
            exit;
        MyDate := (CREATEDATETIME(Rec."Rental End", 0T) - CREATEDATETIME(Rec."Rental Start", 0T));
        TotalAmount := ROUND((MyDate / 86400), 1);
        Rec.Validate("Total Item Cost", Rec."Item Cost" * TotalAmount);

    end;


}
