%First question
max([H], H).
max([X,Y|T], R) :- X > Y, max([X|T], R).
max([X,Y|T], R) :- X =< Y, max([Y|T], R).



%Second question
deleteNList(N, L, R) :- deleteNListHelper(N, 1, L, R).

deleteNListHelper(_, _, [], []).
%deleteNListHelper(N, N, [_|T], T) :- deleteNListHelper(N, 1, T, T).
deleteNListHelper(N, C, [H|T], R) :-  
(N == C -> deleteNListHelper(N, 1, T, R1), R = R1;
	C1 is C + 1, deleteNListHelper(N, C1, T, R2), R = [H|R2]).



%Third question
replace_first_k(0, T, T).
replace_first_k(K, [H|T], R) :- 
(H == 1 -> K1 is K - 1, replace_first_k(K1, T, R1), R = [8|R1];
	K1 is K - 1, replace_first_k(K1, T, R2), R = [H|R2]).



%Fourth question
position(X, L, R) :- position_helper(X, 1, L, R).

position_helper(_, _, [], []).
position_helper(X, P, [H|T], R) :- 
(X == H -> P1 is P + 1, position_helper(X, P1, T, R1), R = [P|R1];
	P1 is P + 1, position_helper(X, P1, T, R2), R = R2).