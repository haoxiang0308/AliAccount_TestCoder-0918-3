-module(simple_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    % 定义子进程规格
    ChildSpecs = [
        #{id => simple_worker,
          start => {simple_worker, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [simple_worker]}
    ],
    % 定义监督策略
    SupFlags = #{strategy => one_for_one,
                 intensity => 1,
                 period => 5},
    {ok, {SupFlags, ChildSpecs}}.