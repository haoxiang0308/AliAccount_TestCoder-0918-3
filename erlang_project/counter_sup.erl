-module(counter_sup).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

init([]) ->
    Counter = {counter_server, {counter_server, start_link, []},
               permanent, 5000, worker, [counter_server]},
    {ok, {{one_for_one, 5, 10}, [Counter]}}.