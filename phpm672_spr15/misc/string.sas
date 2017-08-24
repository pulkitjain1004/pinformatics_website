data test;
str2="  ";  * declare string variable of length 2;
str3="   ";  * declare string variable of length 3;
do num=100 to 110;
   str2=num;
   str3=num;
   output;
end;

proc print data=test(obs=30);
run;
