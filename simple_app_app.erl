-module(simple_app_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_StartType, _StartArgs) ->
    simple_app_sup:start_link().

stop(_State) ->
    ok.