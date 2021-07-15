codeunit 50101 "OrderValidation"
{
    TableNo = "Rental Sales Header";

    trigger OnRun()
    begin
    end;

    procedure ValodationOnPosting(RentalSalesLine: Record "Rental Sales Line"; RentalSalesHeader: Record "Rental Sales Header")
    var
        PostOrder: Codeunit "Post Order";
    begin
        RentalSalesLine.SetRange("Document No.", RentalSalesHeader."Document No.");

        if RentalSalesLine.IsEmpty() then
            Error(NoCarErr);

        RentalSalesLine.SetFilter("Driving License Needed", '<>%1', RentalSalesHeader."Customer Driving License");

        if not RentalSalesLine.IsEmpty() then
            Error(LicenseMatchErr);
        PostOrder.Run(RentalSalesHeader);
    end;

    var
        NoCarErr: label 'Select at least 1 car';
        LicenseMatchErr: Label 'Be sure your license matches all needed';
}
