page 50108 "Posted  Rental Card"
{

    Caption = 'Posted  Rental Card';
    PageType = Card;
    SourceTable = "Posted Rental Sales Header";
    UsageCategory = Lists;
    ApplicationArea = all;
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field';
                    ApplicationArea = All;
                }
                field("Customer Driving License"; Rec."Customer Driving License")
                {
                    ToolTip = 'Specifies the value of the Customer Name field';
                    ApplicationArea = All;
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ToolTip = 'Specifies the value of the Customer Name field';
                    ApplicationArea = All;
                }
                field("Sales Person No."; Rec."Sales Person No.")
                {
                    ToolTip = 'Specifies the value of the Sales Person field';
                    ApplicationArea = All;

                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ToolTip = 'Specifies the value of the Salesperson Name field';
                    ApplicationArea = All;
                }


                field("Contract Total sum"; Rec."Contract Total sum")
                {
                    ToolTip = 'Specifies the value of the Contract Total sum field';
                    ApplicationArea = All;
                }
            }
            group(Lines)
            {
                part("Posted Rental Sales Line"; "Posted Rental Sales Line")
                {
                    ApplicationArea = all;
                    Caption = 'Posted Rental Sales Line';
                    SubPageLink = "Document No." = FIELD("Document No.");
                    UpdatePropagation = Both;
                }
            }
        }
    }

}
