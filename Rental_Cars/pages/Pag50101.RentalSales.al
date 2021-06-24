page 50101 "Rental Sales"
{

    Caption = 'Rental Sales';
    PageType = Card;
    SourceTable = "Rental Sales Header";
    UsageCategory = Lists;
    ApplicationArea = All;

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
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
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
                part("Rental Sales Line"; "Rental Sales Line")
                {
                    ApplicationArea = all;
                    Caption = 'Rental Sales Line';
                    SubPageLink = "Document No." = FIELD("Document No.");
                    UpdatePropagation = Both;
                }
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action("Post The Order")
            {
                ToolTip = 'adfs';
                ApplicationArea = All;
                Image = Post;

                trigger OnAction()
                var
                    OrderValidation: Codeunit OrderValidation;
                begin
                    CurrPage.Update(true);
                    OrderValidation.Run("Rec");
                    Commit();
                end;
            }
        }
    }

}
