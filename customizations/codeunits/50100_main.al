codeunit 50100 MainCodeUnit
{
    trigger OnRun()
    var
        factorial: Integer;
        num: Integer;
    begin
        num := 5;
        factorial := CalculateFactorial(num);
        Message('Running from codeunit. Factorial of 5 is %1', factorial);
    end;

    procedure CalculateFactorial(var num: Integer): Integer
    var
        temp: Integer;
        counter: Integer;
    begin
        if (num = 1) or (num = 0) then begin
            temp := 1;
            exit(temp);
        end
        else begin
            counter := num;
            temp := counter - 1;
            counter := counter * CalculateFactorial(temp);
        end;
    end;
}