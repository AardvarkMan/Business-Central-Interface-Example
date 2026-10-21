namespace AardvarkLabs;

interface ARD_DinnerGuest
{
    //Abstract methods to be implemented by the codeunits that implement this interface
    procedure SetFirstName(firstName: Text[30]);
    Procedure SetLastName(lastName: Text[30]);
    Procedure GetFullName(): Text[61];
    Procedure SetBirthDate(birthDate: Date);
    Procedure GetBirthDate(): Date;


    //Default Implementation of the CanDrinkAlcohol method, which can be overridden by the implementing codeunits
    Procedure CanDrinkAlcohol(): Boolean
    var
        Age: Integer;
        TodayDate: Date;
        GuestBirthDate: Date;
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

        if Age >= 21 then
            exit(true)
        else
            exit(false);
    end;
}