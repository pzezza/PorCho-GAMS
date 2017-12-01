
$TITLE Short Term Financing 03

$Ontext
From Chapter 3 of Optimization Methods in Finance (Mathematics, Finance and Risk) by Reha Tutuncu and Gerard Cornuejols
$Offtext 

SET
    month due dates /january, february, march, april, may, june/

ALIAS(month,t)
 PARAMETER
   s(t) dates in months from today;
   s(t) = ord(t);
 
VARIABLE 
          W objective to be maximized; 

POSITIVE VARIABLE 
          lc(t) cash withdrawal from the line of credit per month
          cp(t) issued amount of commercial paper per month
          ef(t) excess fund per year; 

EQUATION 
          con(t) the constraints
          OBJ  the objective function ; 

$INCLUDE  STF03.inc

con(t).. lc(t)+cp(t)-(1+rlc)*lc(t-1)-(1+rcp)*cp(t-3)+(1+ref)*ef(t-1)-ef(t) =E= L(t) ;
OBJ..   W =E= ef('june') ;

  lc.UP(t) = 100 ; 

  lc.FX('june') = 0  ;
  cp.FX('april') = 0  ;
  cp.FX('may') = 0  ;
  cp.FX('june') = 0  ;

MODEL STF03 / ALL / ; 

SOLVE STF03 USING LP MAXIMIZING W;
