-module(counter_server).
-behaviour(gen_server).

%% API
-export([start_link/0, increment/0, decrement/0, get_count/0, stop/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {count = 0}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

increment() ->
    gen_server:call(?MODULE, increment).

decrement() ->
    gen_server:call(?MODULE, decrement).

get_count() ->
    gen_server:call(?MODULE, get_count).

stop() ->
    gen_server:stop(?MODULE).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call(increment, _From, State) ->
    NewCount = State#state.count + 1,
    {reply, ok, State#state{count = NewCount}};
handle_call(decrement, _From, State) ->
    NewCount = State#state.count - 1,
    {reply, ok, State#state{count = NewCount}};
handle_call(get_count, _From, State) ->
    {reply, State#state.count, State};
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