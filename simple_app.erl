-module(simple_app).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    io:format("Starting Simple OTP Application~n"),
    simple_supervisor:start_link().

stop(_State) ->
    io:format("Stopping Simple OTP Application~n"),
    ok.