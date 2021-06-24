codeunit 50101 "OrderValidation"
{
    TableNo = "Rental Sales Header";

    trigger OnRun()
    var
        "Rental Sales Line": Record "Rental Sales Line";
        "Rental Sales Header": Record "Rental Sales Header";
        "Post Order": Codeunit "Post Order";
    begin
        if not "Rental Sales Line".FindSet(false, false) then begin
            Message('Select at least 1 car');
            exit;
        end;
        repeat
            if "Rental Sales Line"."Driving License Needed" <> "Rental Sales Header"."Customer Driving License" then begin
                Message('Be sure your license matches all needed');

                exit;
            end;
            if ("Rental Sales Line"."Rental End" - "Rental Sales line"."Rental Start") < 1 then begin
                Message('Must be at least 1 day rented');
                exit;
            end;
            if "Rental Sales Line"."Car available" = false then begin
                Message('Car is not available right now');
                exit;
            end;
        until "Rental Sales Line".Next() = 0;
        "Post Order".Run("Rec");
    end;
}
