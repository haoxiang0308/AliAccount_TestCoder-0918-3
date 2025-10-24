%% Randomly named file containing the complete OTP supervision tree
-module(supervision_tree_20968b20acf0f8c1).
-behaviour(supervisor).

%% API
-export([start_link/0, init/1]).

%% Helper functions for starting the application
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    % Define child specifications for the supervision tree
    ChildSpecs = [
        % Example worker process
        {
            my_worker,
            {my_worker, start_link, []},
            permanent,
            5000,
            worker,
            [my_worker]
        }
    ],
    % Return the supervision strategy and child specifications
    {ok, {{one_for_one, 5, 10}, ChildSpecs}}.