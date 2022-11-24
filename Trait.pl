/*Begin Question 4.1*/

prime(N)
  :- divisible( N , 2 ).

divisible( N , Y )
   :- N = Y.
divisible( N , Y )
   :- N > Y,
      N mod Y =\= 0,
      Y1 is Y + 1,
      divisible(N,Y1).
       
    
/*End Question 4.1

Begin Question 4.2
possible( X, Y, Z )
  :-

End Question 4.2

Begin Question 4.3
acceptable( X, Y, Z ) 
  :-

trait( X, Y, Z )
  :-

End Question 4.3*/

main
    :- prime(2).
