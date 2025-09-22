-module(test_counter).
-export([run_test/0]).

run_test() ->
    % Start the application
    application:start(counter),
    
    % Test increment
    counter_server:increment(),
    counter_server:increment(),
    
    % Test get_count
    Count1 = counter_server:get_count(),
    io:format("Count after 2 increments: ~p~n", [Count1]),
    
    % Test decrement
    counter_server:decrement(),
    Count2 = counter_server:get_count(),
    io:format("Count after 1 decrement: ~p~n", [Count2]),
    
    % Test reset
    counter_server:reset(),
    Count3 = counter_server:get_count(),
    io:format("Count after reset: ~p~n", [Count3]),
    
    % Stop the application
    application:stop(counter).