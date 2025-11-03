-module(generate_sequence).
-export([generate_and_save/0]).

generate_and_save() ->
    % Generate a sequence using list comprehension
    Sequence = [X * 2 || X <- lists:seq(1, 10)],
    
    % Generate a random filename
    RandomSuffix = integer_to_list(rand:uniform(1000000)),
    Filename = "sequence_output_" ++ RandomSuffix ++ ".txt",
    
    % Convert sequence to string format
    Output = io_lib:format("~p~n", [Sequence]),
    
    % Write to file
    case file:write_file(Filename, Output) of
        ok -> 
            io:format("Sequence ~p saved to file: ~s~n", [Sequence, Filename]);
        {error, Reason} ->
            io:format("Error writing file ~s: ~p~n", [Filename, Reason])
    end.