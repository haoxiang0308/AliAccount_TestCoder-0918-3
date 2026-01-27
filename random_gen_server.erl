-module(random_gen_server).
-behaviour(gen_server).

%% API
-export([start_link/0,
         stop/0,
         get_state/0,
         update_state/1]).

%% gen_server callbacks
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record(state, {
    counter = 0 :: non_neg_integer()
}).

%%====================================================================
%% API
%%====================================================================

-spec(start_link() -> {ok, pid()} | ignore | {error, term()}).
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

-spec(stop() -> ok).
stop() ->
    gen_server:call(?MODULE, stop).

-spec(get_state() -> any()).
get_state() ->
    gen_server:call(?MODULE, get_state).

-spec(update_state(fun((any()) -> any())) -> ok).
update_state(UpdateFun) when is_function(UpdateFun, 1) ->
    gen_server:cast(?MODULE, {update_state, UpdateFun}).

%%====================================================================
%% gen_server callbacks
%%====================================================================

-spec(init([]) -> {ok, #state{}}).
init([]) ->
    io:format("Starting gen_server with initial state~n", []),
    {ok, #state{}}.

-spec(handle_call(request(), from(), State) -> {reply, Reply, State} | 
                                           {reply, Reply, State, Timeout} |
                                           {noreply, State} |
                                           {noreply, State, Timeout} |
                                           {stop, Reason, Reply, State} |
                                           {stop, Reason, State})
        when request() :: stop | get_state,
             from() :: {pid(), Tag},
             Reply :: term(),
             State :: #state{},
             Timeout :: timeout() | infinity,
             Reason :: term().
handle_call(stop, _From, State) ->
    {stop, normal, ok, State};
handle_call(get_state, _From, State) ->
    Reply = State#state.counter,
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    Reply = {error, unknown_request},
    {reply, Reply, State}.

-spec(handle_cast(request(), State) -> {noreply, State} | 
                                      {noreply, State, Timeout} |
                                      {stop, Reason, State})
        when request() :: {update_state, fun((non_neg_integer()) -> non_neg_integer())},
             State :: #state{},
             Timeout :: timeout() | infinity,
             Reason :: term().
handle_cast({update_state, UpdateFun}, State) ->
    NewCounter = UpdateFun(State#state.counter),
    NewState = State#state{counter = NewCounter},
    {noreply, NewState};
handle_cast(_Msg, State) ->
    {noreply, State}.

-spec(handle_info(Info, State) -> {noreply, State} |
                                   {noreply, State, Timeout} |
                                   {stop, Reason, State})
        when Info :> term(),
             State :: #state{},
             Timeout :: timeout() | infinity,
             Reason :: term().
handle_info(_Info, State) ->
    {noreply, State}.

-spec(terminate(reason(), State) -> term())
        when reason() :: normal | shutdown | {shutdown, term()} | term(),
             State :: #state{}.
terminate(_Reason, _State) ->
    io:format("Terminating gen_server~n", []),
    ok.

-spec(code_change(old_vsn(), State, Extra) -> {ok, NewState})
        when old_vsn() :: Vsn | {down, Vsn},
             Vsn :: term(),
             State :: #state{},
             Extra :: term().
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%====================================================================
%% Internal functions
%%====================================================================