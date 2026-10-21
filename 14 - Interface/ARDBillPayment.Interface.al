namespace AardvarkLabs;

interface ARD_BillPayment
{
    procedure SetBillAmount(billAmount: Decimal);
    procedure GetBillAmount(): Decimal;

    [RequiredPending('This method must be implemented by the codeunit that implements this interface.', '30.0')]
    procedure GetTipAmount(): Decimal
    begin
        // Default implementation: simply store the tip amount
        exit(GetBillAmount() * 0.20); // Default tip is 20% of the bill amount
    end;
}
