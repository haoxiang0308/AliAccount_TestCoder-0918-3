%% OTP Application with Supervisor Tree
-module(d8b8f56b6ca3e92f).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% Supervisor callbacks
-behaviour(supervisor).
-export([start_link/0, init/1]).

%% Gen Server example
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%% API
-export([start_worker/0]).

%%% Application callbacks
start(_StartType, _StartArgs) ->
    start_link().

stop(_State) ->
    ok.

%%% Supervisor functions
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Worker = {example_worker, {d8b8f56b6ca3e92f, start_worker, []},
              permanent, 5000, worker, [d8b8f56b6ca3e92f]},
    {ok, {{one_for_one, 5, 60}, [Worker]}}.

%%% Gen Server functions
start_worker() ->
    gen_server:start_link(?MODULE, [], []).

init([]) ->
    {ok, #{}}.

handle_call(_Request, _From, State) ->
    {reply, ignored, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.