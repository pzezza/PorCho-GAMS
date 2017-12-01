
$TITLE   Short Term Financing 02

$Ontext
From Chapter 3 of Optimization Methods in Finance (Mathematics, Finance and Risk) by Reha Tutuncu and Gerard Cornuejols
$Offtext 

SETS
    month due dates /january, february, march, april, may, june/

* another name for the index
ALIAS(month,t)

*  The indices as numbers
PARAMETER
   s(t) dates in months from today;
   s(t) = ORD(t);
 
PARAMETER
    L(t) liabilities
    / 
    january 150
    february 100
    march -200
    april 200
    may -50
    june -300 /
        
* The interest rates, external data,  as numbers 
SCALAR rlc  interest rate for the line of credit /0.01/
       rcp  interest rate for the commercial paper /0.02/
       ref  interest rate for the excess fund /0.003/;

VARIABLE 
          W objective to be maximized; 

POSITIVE VARIABLE 
          lc(t) cash withdrawal from the line of credit per month
          cp(t) issued amount of commercial paper per month
          ef(t) excess fund per year; 

EQUATION 
          con(t) the constraints
          OBJ  the objective function ; 

con(t).. lc(t)+cp(t)-(1+rlc)*lc(t-1)-(1+rcp)*cp(t-3)+(1+ref)*ef(t-1)-ef(t) =E= L(t) ;
OBJ..   W =E= ef('june') ;

  lc.UP(t) = 100 ; 

  lc.FX('june') = 0  ;
  cp.FX('april') = 0  ;
  cp.FX('may') = 0  ;
  cp.FX('june') = 0  ;

MODEL STF02 / ALL / ; 

SOLVE STF02 USING LP Maximizing W;

rlc = 0.005 ;
display rlc;
SOLVE STF02 USING LP Maximizing W;