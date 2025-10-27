%% Randomly named file containing complete OTP application supervision tree
-module(xgmo3he4).

%% This file demonstrates a complete OTP application structure with:
%% 1. Application behaviour
%% 2. Supervisor behaviour
%% 3. Gen_server worker process

-export([start_app/0, stop_app/0]).

%% Function to start the entire application
start_app() ->
    application:ensure_all_started(simple_app).

%% Function to stop the application
stop_app() ->
    application:stop(simple_app).

%% The complete OTP application structure includes:

%% 1. Application module (simple_app.erl)
%% ========================
%% -module(simple_app).
%% -behaviour(application).
%% -export([start/2, stop/1]).
%% 
%% start(_StartType, _StartArgs) ->
%%     simple_app_sup:start_link().
%% 
%% stop(_State) ->
%%     ok.

%% 2. Supervisor module (simple_app_sup.erl)
%% ========================
%% -module(simple_app_sup).
%% -behaviour(supervisor).
%% -export([start_link/0, init/1]).
%% 
%% start_link() ->
%%     supervisor:start_link({local, ?MODULE}, ?MODULE, []).
%% 
%% init([]) ->
%%     Worker = {
%%         simple_worker,                    % ID
%%         {simple_worker, start_link, []}, % Start function
%%         permanent,                       % Restart policy
%%         5000,                            % Shutdown time
%%         worker,                          % Type
%%         [simple_worker]                  % Modules used
%%     },
%%     {ok, { {one_for_one, 5, 60}, [Worker]} }.

%% 3. Worker module (simple_worker.erl)
%% ========================
%% -module(simple_worker).
%% -behaviour(gen_server).
%% 
%% -export([start_link/0]).
%% -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%%          terminate/2, code_change/3]).
%% 
%% -record(state, {}).
%% 
%% start_link() ->
%%     gen_server:start_link(?MODULE, [], []).
%% 
%% init([]) ->
%%     {ok, #state{}}.
%% 
%% handle_call(_Request, _From, State) ->
%%     {reply, ignored, State}.
%% 
%% handle_cast(_Msg, State) ->
%%     {noreply, State}.
%% 
%% handle_info(_Info, State) ->
%%     {noreply, State}.
%% 
%% terminate(_Reason, _State) ->
%%     ok.
%% 
%% code_change(_OldVsn, State, _Extra) ->
%%     {ok, State}.