-module(simple_worker).
-behaviour(gen_server).

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {name}).

start_link(Name) ->
    gen_server:start_link(?MODULE, [Name], []).

init([Name]) ->
    io:format("Worker ~p started~n", [Name]),
    {ok, #state{name = Name}}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    io:format("Worker terminating~n", []),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.