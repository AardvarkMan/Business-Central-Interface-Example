namespace AardvarkLabs;

page 50000 ARD_DinnerGuestExample
{
    ApplicationArea = All;
    Caption = 'Dinner Guest Example';
    PageType = Card;
    
    layout
    {
        area(Content)
        {
            group(AmericanGuestGroup)
            {
                Caption = 'American Guest';
                field(P1FullName; AmericanDinnerGuestInterface.GetFullName())
                {
                    ApplicationArea = All;
                    Caption = 'Full Name';
                    tooltip = 'Displays the full name of the American guest.';
                }
                field(P1FirstName; AmericanGuestFirstName)
                {
                    ApplicationArea = All;
                    Caption = 'First Name';
                    tooltip = 'Enter the first name of the American guest.';

                    trigger onValidate()
                    begin
                        AmericanDinnerGuestInterface.SetFirstName(AmericanGuestFirstName);
                    end;
                }
                field(P1LastName; AmericanGuestLastName)
                {
                    ApplicationArea = All;
                    Caption = 'Last Name';
                    tooltip = 'Enter the last name of the American guest.';

                    trigger onValidate()
                    begin
                        AmericanDinnerGuestInterface.SetLastName(AmericanGuestLastName);
                    end;
                }
                field(P1BirthDate; AmericanGuestBirthDate)
                {
                    ApplicationArea = All;
                    Caption = 'Birth Date';
                    tooltip = 'Enter the birth date of the American guest.';

                    trigger onValidate()
                    begin
                        AmericanDinnerGuestInterface.SetBirthDate(AmericanGuestBirthDate);
                    end;
                }
                field(P1CanDrinkAlcohol; AmericanDinnerGuestInterface.CanDrinkAlcohol())
                {
                    ApplicationArea = All;
                    Caption = 'Can Drink Alcohol';
                    tooltip = 'Indicates whether the American guest can legally drink alcohol based on their birth date.';
                }
            }
            group(CanadianGuestGroup)
            {
                Caption = 'Canadian Guest';
                
                field(P2FullName; CanadianDinnerGuestInterface.GetFullName())
                {
                    ApplicationArea = All;
                    Caption = 'Full Name';
                    tooltip = 'Displays the full name of the Canadian guest.';
                }
                field(P2FirstName; CanadianGuestFirstName)
                {
                    ApplicationArea = All;
                    Caption = 'First Name';
                    tooltip = 'Enter the first name of the Canadian guest.';

                    trigger onValidate()
                    begin
                        CanadianDinnerGuestInterface.SetFirstName(CanadianGuestFirstName);
                    end;
                }
                field(P2LastName; CanadianGuestLastName)
                {
                    ApplicationArea = All;
                    Caption = 'Last Name';
                    tooltip = 'Enter the last name of the Canadian guest.';

                    trigger onValidate()
                    begin
                        CanadianDinnerGuestInterface.SetLastName(CanadianGuestLastName);
                    end;
                }
                field(P2BirthDate; CanadianGuestBirthDate)
                {
                    ApplicationArea = All;
                    Caption = 'Birth Date';
                    tooltip = 'Enter the birth date of the Canadian guest.';

                    trigger onValidate()
                    begin
                        CanadianDinnerGuestInterface.SetBirthDate(CanadianGuestBirthDate);
                    end;
                }
                field(P2CanDrinkAlcohol; CanadianDinnerGuestInterface.CanDrinkAlcohol())
                {
                    ApplicationArea = All;
                    Caption = 'Can Drink Alcohol';
                    tooltip = 'Indicates whether the Canadian guest can legally drink alcohol based on their birth date.';
                }
            }
        }
    }

    var
        //Implementations of the ARD_DinnerGuest interface for American and Canadian guests
        AmericanGuest: CodeUnit ARD_AmericanGuest;
        CanadianGuest: CodeUnit ARD_CanadianGuest;

        //Interface references to the ARD_DinnerGuest interface for American and Canadian guests
        AmericanDinnerGuestInterface: Interface ARD_DinnerGuest;
        CanadianDinnerGuestInterface: Interface ARD_DinnerGuest;

        AmericanGuestFirstName: Text[30];
        AmericanGuestLastName: Text[30];
        AmericanGuestBirthDate: Date;

        CanadianGuestFirstName: Text[30];
        CanadianGuestLastName: Text[30];
        CanadianGuestBirthDate: Date;

    trigger OnOpenPage()
    begin
        // Assign the interface references to the respective codeunit instances
        // This allows us to call the interface methods on the codeunit instances
        AmericanDinnerGuestInterface := AmericanGuest;
        CanadianDinnerGuestInterface := CanadianGuest;
        
        // Initialize the guest information
        AmericanGuestFirstName := '';
        AmericanGuestLastName := '';
        AmericanGuestBirthDate := 0D;

        CanadianGuestFirstName := '';
        CanadianGuestLastName := '';
        CanadianGuestBirthDate := 0D;
    end;


}
