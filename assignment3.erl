-module(assignment3).
-export([start/0, get_numData/0, process_input/1, factorial/1]).

% team: Comfort Donkor

get_numData() ->
        {ok, Number} = io:read("Enter a number: "),
        io:format("The number you entered is: ~w~n", [Number]).

process_input(Num) when Num < 0 ->
    PowerResult = math:pow(abs(Num), 7),
    IntPowerResult = trunc(PowerResult),  % Truncate the result to an integer
    io:format("Absolute value raised to the 7th power: ~p~n", [IntPowerResult]);

process_input(Num) when Num == 0 ->
    io:format("0~n");

process_input(Num) when Num > 0 ->
    case Num rem 7 of
        0 ->
            FifthRoot = math:pow(Num, 1/5),
            io:format("5th root: ~p~n", [FifthRoot]);
        _ ->
            FactResult = factorial(Num),
            io:format("Factorial: ~p~n", [FactResult])
    end.

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).

start() ->
    io:format("Enter a number or enter 0 to quit: "),
    case io:fread("", "~d") of
        {ok, [0]} -> io:format("That's it, thank you!~n");
        {ok, [Num]} -> 
            process_input(Num),
            start(); 
        _ -> 
            io:format("Your number is not an integer~n"),
            start()
    end.
