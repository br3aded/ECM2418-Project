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
       
    
/*End Question 4.1*/

/*Begin Question 4.2*/
possible(X,Y,Z)
  :- between(149,180,X),
     between(247,270,Y),
     between(346,360,Z).

     
          

/*End Question 4.2*/

/*Begin Question 4.3*/
trait( X, Y, Z )
  :- possible( X, Y, Z ),
     acceptable( X, Y, Z ).

acceptable( X, Y, Z ) 
  :- number_chars(X,XS),
     number_chars(Y,YS),
     number_chars(Z,ZS),
     append(XS,YS,XYS),
     append(XYS,ZS,XYZS),
     permutation(XYZS,['1','2','3','4','5','6','7','8','9']),
     \+ prime(X),
     \+ prime(Y),
     \+ prime(Z),
     100 < X,
     X < 180,
     180< Y,
     Y < 270,
     270 < Z,
     Z < 360.

/*End Question 4.3*/
