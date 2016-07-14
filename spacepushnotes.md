# Commands

	erl -pa deps/*/ebin ebin -s spacepush_app start
	1> gen_server:cast(spacepush_serv, test).
	gen_server:call(spacepush_serv, {test, "test"}).
	 	
	
# Intended Feature

* run as erlang gen_server
* send message function call with parameter
	* Message, UUID
