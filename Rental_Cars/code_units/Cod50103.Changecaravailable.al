codeunit 50103 "Change_car_available"
{
    TableNo = "Rental Sales Line";

    trigger OnRun()
    var

        "Posted Rental Sales Line": Record "Posted Rental Sales Line";
        "Rental Sales Line": Record "Rental Sales Line";
        "Rental Sales Header": Record "Rental Sales Header";
        DT: date;
    begin
        if Rec."Rental End" = DT then
            exit;
        if Rec."Rental Start" = DT then
            exit;
        if not "Posted Rental Sales Line".FindSet(false, false) then
            exit;
        repeat
            if ((Rec."Rental Start" - "Posted Rental Sales Line"."Rental End") < 1) and (("Posted Rental Sales Line"."Rental Start" - Rec."Rental Start") < 1) then begin
                Message('The car is allready being used for this time from ' + Format("Posted Rental Sales Line"."Rental Start") + ' till ' + Format("Posted Rental Sales Line"."Rental End"));
                exit;
            end;
            if ((Rec."Rental End" - "Posted Rental Sales Line"."Rental End") < 1) and (("Posted Rental Sales Line"."Rental Start" - Rec."Rental End") < 1) then begin
                Message('The car is allready being used for this time from ' + Format("Posted Rental Sales Line"."Rental Start") + ' till ' + Format("Posted Rental Sales Line"."Rental End"));
                exit;
            end;
            if (Rec."Rental End" > "Posted Rental Sales Line"."Rental End") and ("Posted Rental Sales Line"."Rental Start" > Rec."Rental Start") then begin
                Message('The car is allready being used for this time from ' + Format("Posted Rental Sales Line"."Rental Start") + ' till ' + Format("Posted Rental Sales Line"."Rental End"));
                exit;
            end;

        until "Posted Rental Sales Line".Next() = 0;


        if (Rec."Rental Start" - DT2DATE(CurrentDateTime)) < 0 then begin
            Message('Are you a time traveller?');
            exit;
        end;
        if (Rec."Rental End" - Rec."Rental Start") < 1 then begin
            Message('Must be at least 1 day rented');
            exit;
        end;

        if not "Rental Sales Line".FindSet(false, false) then
            exit;
        repeat
            if (Rec."Line No." <> "Rental Sales Line"."Line No.") then begin

                if ((Rec."Rental Start" - "Rental Sales Line"."Rental End") < 1) and (("Rental Sales Line"."Rental Start" - Rec."Rental Start") < 1) then begin
                    Message('The car is allready planned to be used by you for this time from ' + Format("Rental Sales Line"."Rental Start") + ' till ' + Format("Rental Sales Line"."Rental End"));
                    exit;
                end;
                if ((Rec."Rental End" - "Rental Sales Line"."Rental End") < 1) and (("Rental Sales Line"."Rental Start" - Rec."Rental End") < 1) then begin
                    Message('The car is allready planned to be used by you for this time from ' + Format("Rental Sales Line"."Rental Start") + ' till ' + Format("Rental Sales Line"."Rental End"));
                    exit;
                end;
                if (Rec."Rental End" > "Rental Sales Line"."Rental End") and ("Rental Sales Line"."Rental Start" > Rec."Rental Start") then begin
                    Message('The car is allready planned to be used by you for this time from ' + Format("Rental Sales Line"."Rental Start") + ' till ' + Format("Rental Sales Line"."Rental End"));
                    exit;
                end;

            end;
        until "Rental Sales Line".Next() = 0;
    end;
}
