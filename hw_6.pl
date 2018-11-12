go:- go([0,1,2,3,4]).
go([]):-!.
go([H|T]):- solve([H],S,14),!,print_sol(H,S),nl,nl,nl,go(T).

solve(_,[],1):-!.
solve(N,S,C):-
	move(N,M),solve(N,M,S,C).
	
solve(N,[HM|_],[HM|TS],C):- C1 is C-1,try_solve(N,HM,TS,C1),!.
solve(N,[_|T],TS,C):- solve(N,T,TS,C).

try_solve(N,HM,TS,C):- apply(N,HM,N1), solve(N1,TS,C).


print_sol(H,S):- write('=== '), write(H), write(' ==='), nl, print_steps([H],S).

print_steps(N,[]):- print_step(N),!.
print_steps(N,[H|T]):- print_step(N), nl,nl, apply(N,H,N1), print_steps(N1,T).

print_step(N):- print_step(N,[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]).

print_step(_,[]):-!.
print_step(N,[H|T]):- has(N,H),!, print_space(H), write('o '), print_nl(H),print_step(N,T).
print_step(N,[H|T]):- print_space(H), write('x '), print_nl(H), print_step(N,T).

print_space(0):- write('    '),!.
print_space(1):- write('   '),!.
print_space(3):- write('  '),!.
print_space(6):- write(' '),!.
print_space(_).

print_nl(0):- write('    '),nl,!.
print_nl(2):- write('   '),nl,!.
print_nl(5):- write('  '),nl,!.
print_nl(9):- write(' '),nl,!.
print_nl(_).


move(N,M):- moves(MM),move(N,M,MM).
move(_,[],[]):-!.
move(N,[HM|TM],[HM|TMM]):- contain(N,HM),!,move(N,TM,TMM).
move(N,TM,[_|TMM]):- move(N,TM,TMM),!.

contain(N,[H1,H2,H3]):- has(N,H1), !, not(has(N,H2)), not(has(N,H3)).
contain(N,[H1,H2,H3]):- not(has(N,H1)), not(has(N,H2)), has(N,H3).

has([N|_],N):-!.
has([_|T],N):- has(T,N).

remove([],_,[]):-!.
remove([N|T],N, T):-!.
remove([H|T],N,[H|T2]):- remove(T,N,T2),!.

apply(N,[],N):-!.
apply(N,[H|T],N1):- has(N,H),!, remove(N,H,N2), apply(N2,T,N1).
apply(N,[H|T],N1):- apply([H|N],T,N1),!.
moves([
  [0,1,3],
  [0,2,5],
  [1,3,6],
  [1,4,8],
  [2,4,7],
  [2,5,9],
  [3,6,10],
  [3,7,12],
  [4,7,11],
  [4,8,13],
  [5,8,12],
  [5,9,14],
  [3,4,5],
  [6,7,8],
  [7,8,9],
  [10,11,12],
  [11,12,13],
  [12,13,14]
]).