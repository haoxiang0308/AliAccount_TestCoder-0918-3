-module(random_server_8472).
-behaviour(gen_server).

%% API
-export([start_link/0, stop/1, get_state/1, update_state/2]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {data = []}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link(?MODULE, [], []).

stop(Pid) ->
    gen_server:call(Pid, stop).

get_state(Pid) ->
    gen_server:call(Pid, get_state).

update_state(Pid, NewData) ->
    gen_server:call(Pid, {update_state, NewData}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call(stop, _From, State) ->
    {stop, normal, ok, State};
handle_call(get_state, _From, State) ->
    {reply, State#state.data, State};
handle_call({update_state, NewData}, _From, State) ->
    NewState = State#state{data = NewData},
    {reply, ok, NewState};
handle_call(_Request, _From, State) ->
    {reply, {error, unknown_call}, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
