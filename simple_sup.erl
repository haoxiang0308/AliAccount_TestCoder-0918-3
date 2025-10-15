-module(simple_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Worker = {simple_worker, {simple_worker, start_link, []},
              permanent, 5000, worker, [simple_worker]},
    Procs = [Worker],
    {ok, {{one_for_one, 1, 5}, Procs}}.