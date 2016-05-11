%% @author LeafCherngchaosil
%% @doc @todo Add description to modPartTwo.


-module(modPartTwo).
-export([firstFunction/2, secFunction/2, thirdFunction/1, fourthFunction/1, lowerString/1]).


firstFunction(FileName, Delimiter) ->
   % opens and read the file
	{ok, S} = file:open(FileName, [read]),
   % since its one line, read the whole line
	L1 = io:get_line(S,""),
	Tokens = string:tokens(L1, Delimiter),
	Tokens.

secFunction(StringWord, ListOfTuples) ->
	% check if there is a tuple already in the list
	CurrentTuple = lists:keyfind(StringWord, 1, ListOfTuples),
	% if no such tuple exists
	if (CurrentTuple == false) ->
		% make a new tuple
		% append the new tuple to the list
		[{StringWord, 1} | ListOfTuples];
	% if such tuple exists, update the tuple and replace it in the list
	true -> NewTuple = setelement(2, CurrentTuple, (element(2,CurrentTuple) + 1))
			,NewListOfTuples = lists:keyreplace(element(1,CurrentTuple),1,ListOfTuples, NewTuple),
			NewListOfTuples
	end.

lowerString(StrWord) -> string:to_lower(StrWord).

thirdFunction(ListOfWords) ->
% applies lower_string to every words in the list
ListOfTuples = lists:map(fun(StrWord) -> string:to_lower(StrWord) end, ListOfWords),
% make an empty list
Acc = [], 
lists:foldl(fun secFunction/2 , Acc, ListOfTuples).

fourthFunction(FileName) ->
% sort from high to low
  io:format("~p~n",[lists:reverse(lists:keysort(2,thirdFunction(firstFunction(FileName, " ,.\n 0123456789"))))]).

