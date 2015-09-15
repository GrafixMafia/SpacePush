
%% Connection Parameters
-record(spconfig, {
  applehost  = "gateway.sandbox.push.apple.com"      :: undefined | string(),
  appleport  = 2195                                  :: undefined | integer(),
  certfile   = "priv/myapnsappcert.pem"              :: undefined | string(),
  keyfile    = "priv/myapnsappprivatekey.pem"        :: undefined | string(),
  timeout     = 20000                                :: undefined | integer()
}).

%% Message Information
-record(spmessage, {
  receiver = "028aced8757c9e51dd57164d22281bc19d602b150cb70ce63607f12b16bc0752" :: string(),
  alert  = "Test Message"                         :: string(),
  badge  = 0                                      :: undefined | integer(),
  sound  = undefined                              :: undefined | string()
}).