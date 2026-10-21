namespace AardvarkLabs;

codeunit 50001 ARD_CanadianGuest Implements ARD_DinnerGuest
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

    Procedure CanDrinkAlcohol(): Boolean
    var
        Age: Integer;
        TodayDate: Date;
    begin
        GuestBirthDate := GetBirthDate();
        TodayDate := Today();

        if GuestBirthDate = 0D then
            exit(false); // If the birth date is not set, return false

        Age := Date2DMY(TodayDate, 3) - Date2DMY(GuestBirthDate, 3);
        if (Date2DMY(TodayDate, 2) < Date2DMY(GuestBirthDate, 2)) or
            ((Date2DMY(TodayDate, 2) = Date2DMY(GuestBirthDate, 2)) and
              (Date2DMY(TodayDate, 1) < Date2DMY(GuestBirthDate, 1)))
        then
            Age -= 1;

        if Age >= 18 then
            exit(true)
        else
            exit(false);
    end;
}