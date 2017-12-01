
$TITLE Short Term Financing 04

$Ontext
From Chapter 3 of Optimization Methods in Finance (Mathematics, Finance and Risk) by Reha Tutuncu and Gerard Cornuejols
$Offtext 

SET
    month due dates /january, february, march, april, may, june/

ALIAS(month,t)
 PARAMETER
   s(t) dates in months from today;
   s(t) = ord(t);

* january is month 1 
PARAMETER 
    L(t) liabilities
    / 
    january 150
    february 100
    march -200
    april 200
    may -50
    june -300 /
        
SCALAR rcp  interest rate for the commercial paper /0.02/
       ref  interest rate for the excess fund /0.003/
       spread /0.007/
       rlc   interest rate for the line of credit;

rlc = ref +spread ;

DISPLAY rcp, ref, rlc;

VARIABLES 
          W objective to be maximized; 

POSITIVE VARIABLE 
          lc(t) cash withdrawal from the line of credit per month
          cp(t) issued amount of commercial paper per month
          ef(t) excess fund per year; 

EQUATION 
          con(t) the constraints
          OBJ  the objective function ; 

con(t).. lc(t)              $(s(t)<=5)
         +cp(t)             $(s(t)<=3)
         -(1+rlc)*lc(t-1)   $(s(t)>=2)
         -(1+rcp)*cp(t-3)   $(s(t)>=4) 
         +(1+ref)*ef(t-1)   $(s(t)>=2)
         -ef(t) =E= L(t) ;

OBJ..   W =E= ef('june') ;

  lc.UP(t) = 100 ; 

MODEL STF04 / ALL / ; 

SOLVE STF04 USING LP MAXIMIZING W;

OPTION LP=BDMLP 
SOLVE STF04 USING LP MAXIMIZING W;

