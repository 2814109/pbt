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

prop_symmetric() ->
        ?FORALL(Data, list({atom(),any()}),
        begin
            Encoded = encode(Data), is_binary(Encoded) andalso
            Data =:= decode(Encoded)
        end).

encode(T) -> term_to_binary(T).
decode(T) -> binary_to_term(T).