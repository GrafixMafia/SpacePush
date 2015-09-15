%%%-------------------------------------------------------------------
%% @author Markus Mueller <markus@grafixmafia.net>
%% @doc spacepush sending push notifications to ios devices.
%% @reference <a href="http://oreilly.com/catalog/9780596518189/">
%% @copyright 2015 Makrus Mueller
%% @end
%%%-------------------------------------------------------------------


-module(spacepush).

-include ("spacepush.hrl").

-export([send_pn/2]).
%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

send_pn(Config, SPMsg) ->
  AppleAddress = Config#spconfig.applehost,
  ApplePort = Config#spconfig.appleport,
  Cert = Config#spconfig.certfile,
  Key  = Config#spconfig.keyfile,


  Msg = {[{<<"aps">>, {[{<<"alert">>, list_to_bitstring(SPMsg#spmessage.alert)},
        {<<"badge">>, SPMsg#spmessage.badge}
    ]}}]},
  
  Options = [{certfile, Cert}, {keyfile, Key}, {mode, binary}, {verify, verify_none}],
  Timeout = 10000,
  case ssl:connect(AppleAddress, ApplePort, Options, Timeout) of
    {ok, Socket} ->
      PayloadString = jiffy:encode(Msg),
      Packet = create_packet(SPMsg,PayloadString),
      ssl:send(Socket, Packet),
      ssl:close(Socket),
      PayloadString;
    {error, Reason} ->
      Reason
  end.

%%====================================================================
%% Internal functions
%%====================================================================

%%
%%
%%
create_packet(Msg,Payload) -> 
  BinDeviceID = hexstr_to_bin(Msg#spmessage.receiver),
  PayloadLength = size(Payload),
  <<0:8,
    32:16/big,
    BinDeviceID/binary,
    PayloadLength:16/big,
    Payload/binary>>.

hexstr_to_bin(S) ->
  hexstr_to_bin(S, []).
hexstr_to_bin([], Acc) ->
  list_to_binary(lists:reverse(Acc));
hexstr_to_bin([$ |T], Acc) ->
    hexstr_to_bin(T, Acc);
hexstr_to_bin([X, Y|T], Acc) ->
  {ok, [V], []} = io_lib:fread("~16u", [X, Y]),
  hexstr_to_bin(T, [V | Acc]).