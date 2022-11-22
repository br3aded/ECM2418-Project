/*Begin Question 3.1*/
indices([],_,[]).
indices(_,[],[]).
indices([H|T],IS, [X|U])
  :- nth(H,IS,X),
     indices(T,IS,U).
     
nth(0,[H|_],H).
nth(N,[_|T],W)
	:- N1 is N - 1,
       nth(N1,T,W).

/*End Question 3.1*/

/*Begin Question 3.2*/
possible( GRID )
  :- permutation(GRID, [1,2,3,4,5,6,7,8,9]).
/*End Question 3.2*/

/*Begin Question 3.3*/
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
	:-possible(GRID),
      acceptable(T0,T1,T2,T3,US,U,VS,V,WS,W,GRID).

acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
  :- indices(US,GRID,USS),
     sum_list(USS,U),
     indices(VS,GRID,VSS),
     sum_list(VSS,V),
     indices(WS,GRID,WSS),
     sum_list(WSS,W),
     indices([0,1,3],US,US1),
     indices(US1,GRID,US2),
     indices([0],VS,VS1),
     indices(VS1,GRID,VS2),
     append(US2,VS2,UVS1),
     sum_list(UVS1,T0),
     indices([1,2],US,US3),
     indices(US3,GRID,US4),
     indices([0],WS,WS1),
     indices(WS1,GRID,WS2),
     append(US4,VS2,UVS2),
     append(UVS2,WS2,UVWS),
     sum_list(UVWS,T1),
     indices([3],US,US5),
     indices(US5,GRID,US6),
     indices([0,1,2],VS,VS3),
     indices(VS3,GRID,VS4),
     append(US6,VS4,UVS3),
     sum_list(UVS3,T2),
     indices([0,2],VS,VS5),
     indices(VS5,GRID,VS6),
     indices([0,1],WS,WS3),
     indices(WS3,GRID,WS4),
     append(VS6,WS4,VWS),
     sum_list(VWS,T3).
/*End Question 3.3*/

main
    :- suko( 15, 14, 26, 23
		, [0,1,2,3], 16
		, [4,6,7], 17
		, [5,8], 12
		, GRID ), write(GRID).


 
 