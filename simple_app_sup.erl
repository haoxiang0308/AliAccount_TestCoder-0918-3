-module(simple_app_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Worker = {
        simple_worker,                    % ID
        {simple_worker, start_link, []}, % Start function
        permanent,                       % Restart policy
        5000,                            % Shutdown time
        worker,                          % Type
        [simple_worker]                  % Modules used
    },
    {ok, { {one_for_one, 5, 60}, [Worker]} }.