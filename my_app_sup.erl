-module(my_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    % Define child specifications
    ChildSpecs = [
        % Add the worker to the supervision tree
        {
            my_worker,
            {my_worker, start_link, []},
            permanent,
            5000,
            worker,
            [my_worker]
        }
    ],
    {ok, {{one_for_one, 5, 10}, ChildSpecs}}.