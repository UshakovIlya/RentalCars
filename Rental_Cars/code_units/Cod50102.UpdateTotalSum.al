codeunit 50102 "UpdateTotalSum"
{
    TableNo = "Rental Sales Line";

    trigger OnRun()

    begin

    end;

    procedure TotalSumForOneItem(var ItemInLine: Record "Rental Sales Line"; RentalSalesHeader: Record "Rental Sales Header")
    var
        TheLowestDiscount: Decimal;
    begin
        if (ItemInLine."Rental Start" = 0D) or (ItemInLine."Rental End" = 0D) then
            exit;
        RentalSalesHeader.Get(ItemInLine."Document No.");
        if ItemInLine."Vehicle Discount" > RentalSalesHeader."Customer Discount" then
            TheLowestDiscount := ItemInLine."Vehicle Discount"
        else
            TheLowestDiscount := RentalSalesHeader."Customer Discount";

        if ((ItemInLine."Item Cost" * (ItemInLine."Rental End" - ItemInLine."Rental Start")) - TheLowestDiscount) > 0 then
            ItemInLine.Validate("Total Item Cost", (ItemInLine."Item Cost" * (ItemInLine."Rental End" - ItemInLine."Rental Start")) - TheLowestDiscount)
        else
            ItemInLine.Validate("Total Item Cost", (ItemInLine."Item Cost" * (ItemInLine."Rental End" - ItemInLine."Rental Start")));

    end;


}
