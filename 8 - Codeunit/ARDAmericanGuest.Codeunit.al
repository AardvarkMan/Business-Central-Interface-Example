namespace AardvarkLabs;

codeunit 50000 ARD_AmericanGuest Implements ARD_DinnerGuest
{
    var
        GuestFirstName: Text[30];
        GuestLastName: Text[30];
        GuestBirthDate: Date;

    procedure SetFirstName(firstName: Text[30])
    begin
        GuestFirstName := firstName;
    end;

    procedure SetLastName(lastName: Text[30])
    begin
        GuestLastName := lastName;
    end;

    procedure GetFullName(): Text[61]
    begin
        exit(GuestFirstName + ' ' + GuestLastName);
    end;

    procedure SetBirthDate(birthDate: Date)
    begin
        GuestBirthDate := birthDate;
    end;

    procedure GetBirthDate(): Date
    begin
        exit(GuestBirthDate);
    end;
}
