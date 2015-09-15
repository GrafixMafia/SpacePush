-module(spacepush_serv).
-behaviour(gen_server).

-include ("spacepush.hrl").

-define(SERVER, ?MODULE).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0]).

%% ------------------------------------------------------------------
%% gen_server Function Exports
%% ------------------------------------------------------------------

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%% Helper macro for declaring children of supervisor
-define(CHILD(Name, URL, State,I , Type), {Name, {I, start_link, [Name, URL, State]}, permanent, 5000, Type, [I]}).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%% ------------------------------------------------------------------
%% gen_server Function Definitions
%% ------------------------------------------------------------------

init(Args) ->
    {ok, Args}.
handle_call({test, Msg}, _From, State) ->
    SPMsg = #spmessage{},
    Config = #spconfig{},
    spacepush:send_pn(Config, SPMsg),
    {reply, done, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.
handle_cast(test, State) ->
    io:format("hallo"),
    {noreply, State};
handle_cast(_Msg, State) ->
    {noreply, State}.
handle_info(_Info, State) ->
    {noreply, State}.
terminate(_Reason, _State) ->
    ok.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

