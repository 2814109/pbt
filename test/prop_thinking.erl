-module(prop_thinking).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_test() ->
    ?FORALL({List, KnownLast}, {list(number()),number()},
        begin
            KnownList = List ++ [KnownLast],
            KnownLast =:= lists:last(KnownList)
        end).
