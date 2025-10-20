-module(gen_server_1aeb4613bbc80f92).
-behaviour(gen_server).

%% API
-export([start_link/1, stop/1, get_value/1, set_value/2, increment/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {value}).

%%%===================================================================
%%% API
%%%===================================================================

start_link(InitialValue) ->
    gen_server:start_link(?MODULE, InitialValue, []).

stop(Pid) ->
    gen_server:stop(Pid).

get_value(Pid) ->
    gen_server:call(Pid, get_value).

set_value(Pid, NewValue) ->
    gen_server:call(Pid, {set_value, NewValue}).

increment(Pid) ->
    gen_server:call(Pid, increment).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init(InitialValue) ->
    {ok, #state{value = InitialValue}}.

handle_call(get_value, _From, State) ->
    {reply, State#state.value, State};

handle_call({set_value, NewValue}, _From, State) ->
    NewState = State#state{value = NewValue},
    {reply, ok, NewState};

handle_call(increment, _From, State) ->
    NewValue = State#state.value + 1,
    NewState = State#state{value = NewValue},
    {reply, NewValue, NewState};

handle_call(_Request, _From, State) ->
    {reply, {error, unknown_request}, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================