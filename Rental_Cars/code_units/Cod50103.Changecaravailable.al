codeunit 50103 "ChangeCarAvailable"
{
    TableNo = "Rental Sales Line";

    trigger OnRun()

    begin




    end;

    procedure CheckIfCustomerATimeTraveller(RentalSalesLine: Record "Rental Sales Line")
    begin
        if (RentalSalesLine."Rental End" <> 0D) and (RentalSalesLine."Rental Start" <> 0D) then begin
            if RentalSalesLine."Rental End" < RentalSalesLine."Rental Start" then
                Error(StartDateLessThenEndDateErr);

            if RentalSalesLine."Rental Start" < DT2DATE(CurrentDateTime) then
                Error(StartDateLessThenCurrentDateErr);
        end;
    end;

    procedure CheckIfCarIsBusyInPosted(PostedRentalSalesLine: Record "Posted Rental Sales Line"; RentalSalesLine: Record "Rental Sales Line")
    begin
        PostedRentalSalesLine.SetRange("Item No.", RentalSalesLine."Item No.");
        PostedRentalSalesLine.SetFilter("Rental End", '>%1', RentalSalesLine."Rental Start");
        PostedRentalSalesLine.SetFilter("Rental Start", '<%1', RentalSalesLine."Rental End");
        if not PostedRentalSalesLine.IsEmpty() then
            Error(ItemIsAlreadyBeingUsedForThatDateErr);
        PostedRentalSalesLine.SetRange("Item No.");
        PostedRentalSalesLine.SetRange("Rental End");
        PostedRentalSalesLine.SetRange("Rental Start");
    end;

    procedure CheckIfCarIsBusyInSameOrder(RentalSalesLineComp: Record "Rental Sales Line"; RentalSalesLine: Record "Rental Sales Line"; RentalSalesHeader: Record "Rental Sales Header")
    begin

        RentalSalesLineComp.SetRange("Document No.", RentalSalesHeader."Document No.");
        RentalSalesLineComp.SetFilter("Item No.", RentalSalesLine."Item No.");
        RentalSalesLineComp.SetFilter("Line No.", '<>%1', RentalSalesLine."Line No.");
        RentalSalesLineComp.SetFilter("Rental End", '>=%1', RentalSalesLine."Rental Start");
        RentalSalesLineComp.SetFilter("Rental Start", '<=%1', RentalSalesLine."Rental End");
        if not RentalSalesLineComp.IsEmpty() then
            Error(ItemIsAlreadyBeingUsedForThatDateErr);

        RentalSalesLineComp.SetRange("Document No.");
        RentalSalesLineComp.SetRange("Item No.");
        RentalSalesLineComp.SetRange("Line No.");
        RentalSalesLineComp.SetRange("Rental End");
        RentalSalesLineComp.SetRange("Rental Start");
    end;

    var
        StartDateLessThenCurrentDateErr: Label 'Start Date must be greater then current date';
        StartDateLessThenEndDateErr: Label 'Must be at least 1 day rented';
        ItemIsAlreadyBeingUsedForThatDateErr: Label 'The car is already being reserved or used for that date';
}
