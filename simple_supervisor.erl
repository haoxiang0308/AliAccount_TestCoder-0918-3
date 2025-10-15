-module(simple_supervisor).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 5,
    MaxTime = 10,

    ChildSpecs = [
        #{id => worker1,
          start => {simple_worker, start_link, [worker1]},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [simple_worker]},
        #{id => worker2,
          start => {simple_worker, start_link, [worker2]},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [simple_worker]}
    ],

    {ok, {{RestartStrategy, MaxRestarts, MaxTime}, ChildSpecs}}.