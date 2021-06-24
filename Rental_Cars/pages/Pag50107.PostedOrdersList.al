page 50107 "Posted Orders List"
{

    ApplicationArea = All;
    Caption = 'Posted Orders List';
    PageType = List;
    SourceTable = "Posted Rental Sales Header";
    UsageCategory = Lists;
    CardPageId = "Posted  Rental Card";
    layout
    {
        area(content)
        {
            repeater(General)
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
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field';
                    ApplicationArea = All;
                }

                field("Sales Person No."; Rec."Sales Person No.")
                {
                    ToolTip = 'Specifies the value of the Sales Person No. field';
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

        }
    }

}
