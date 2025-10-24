-module(simple_app_sup).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% API functions
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% Supervisor callbacks
init([]) ->
    % Define child specifications
    ChildSpecs = [
        % Add your child processes here
        ?CHILD(example_worker, worker)
    ],
    
    % Supervisor flags
    SupFlags = #{strategy => one_for_one,
                 intensity => 1,
                 period => 5},
    
    {ok, {SupFlags, ChildSpecs}}.