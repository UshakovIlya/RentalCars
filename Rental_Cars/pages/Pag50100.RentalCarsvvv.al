page 50100 "Rental_Carsvvv"
{

    Caption = 'vvv';
    PageType = Card;
    SourceTable = car;
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field(c; Rec.c)
                {
                    ToolTip = 'Specifies the value of the c field';
                    ApplicationArea = All;
                }
                field(na; Rec.na)
                {
                    ToolTip = 'Specifies the value of the na field';
                    ApplicationArea = All;
                }
            }
        }
    }

}
