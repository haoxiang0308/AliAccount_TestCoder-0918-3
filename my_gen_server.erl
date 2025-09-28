-module(my_gen_server).
-behaviour(gen_server).

%% API
-export([start_link/1, stop/1, get_state/1, update_state/2]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {data}).

%%%===================================================================
%%% API
%%%===================================================================

start_link(InitialData) ->
    gen_server:start_link(?MODULE, InitialData, []).

stop(Pid) ->
    gen_server:stop(Pid).

get_state(Pid) ->
    gen_server:call(Pid, get_state).

update_state(Pid, NewData) ->
    gen_server:cast(Pid, {update_state, NewData}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init(InitialData) ->
    {ok, #state{data = InitialData}}.

handle_call(get_state, _From, State) ->
    {reply, State#state.data, State}.

handle_cast({update_state, NewData}, State) ->
    {noreply, State#state{data = NewData}}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.