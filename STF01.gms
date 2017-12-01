* Short Term Financing LP Model
$TITLE Short Term Financing 02

* Description of the code's content
$Ontext
From Chapter 3 of Optimization Methods in Finance (Mathematics, Finance and Risk) by Reha Tutuncu and Gerard Cornuejols
$Offtext 

* The index set
SET
    i months /1,2,3,4,5,6/
 
* The vector of liabilities
PARAMETER
    b(i) liabilities
    / 
    1 150
    2 100
    3 -200
    4 200
    5 -50
    6 -300 /
        
* The free variables' names and descriptions
VARIABLE
          W objective to be maximized; 

* The positive variables' names and descriptions
POSITIVE VARIABLE
          x(i) cash withdrawal from the line of credit per month
          y(i) issued amount of commercial paper per month
          z(i) excess fund per year; 

* The equations' names and description
EQUATION
          con(i) the constraints
          OBJ  the objective function ; 

* Assign a math expression to the names of the equations
con(i).. x(i)+y(i)-1.01*x(i-1)-1.02*y(i-3)+1.003*z(i-1)-z(i) =E= b(i) ;
* the excess fund of June is the final wealth of the company 
OBJ..   W =E= z('6') ;

*Upper bounds on the variables
  x.up(i) = 100 ; 

*Set zero the values of the extra variables
*IMPORTANT when the index is "out of range" the variable is by default set zero
  x.fx('6') = 0  ;
  y.fx('4') = 0  ;
  y.fx('5') = 0  ;
  y.fx('6') = 0  ;

* The model's name and the equations to be included
MODEL STF01 / ALL / ; 

* The solve statement
SOLVE STF01 USING LP Maximizing W;
