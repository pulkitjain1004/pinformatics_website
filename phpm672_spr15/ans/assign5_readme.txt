< Assignment 5: Full Data >----------------------------------------------
<County Year Analysis> 
1. How many total observations do you have when the merge is complete? 
After the merge is complete,  there were 762 (254*3) observations. 

ANS: 762

> NOTE: There were 762 observations read from the data set DATA.AGGRDATA2.

2. How many observations are missing patient data? 
386 observations are missing patient data.

ANS: 386

> NOTE: There were 386 observations read from the data set DATA.AGGRDATA2.
      WHERE yeardisc=.;
> NOTE: 254 observations with duplicate key values were deleted.
> NOTE: The data set DATA.AGGRDATA2 has 132 observations and 24 variables.


3. How many counties in your dataset are missing patient data for AT LEAST 1 year? (notice, we 
want the number of counties, not the number of observations that are missing patient data) ? 
131 counties are missing patient data for at least 1 year.

ANS: 131

> NOTE: There were 386 observations read from the data set DATA.AGGRDATA2.
      WHERE yeardisc=.;
> NOTE: 254 observations with duplicate key values were deleted.
> NOTE: The data set DATA.AGGRDATA2 has 132 observations and 24 variables.


4. What is the average size (in terms of the population variable) of all observations (county/years) 
that have missing patient data? 

ANS: 10,825.83

(10712.40625 + 10811.773438 + 10951.346154)/3 = 32475.525842/3=10,825.83

                   Obs    year    _FREQ_    yeardisc        pop
                    1     2010      128         .        10712.40625
                    2     2011      128         .       10811.773438
                    3     2012      130         .       10951.346154


5. Which observations (which county/years) have more deaths than inpatient discharges? How many observations have more deaths than physicians ? 

ANS: 3 (Llano 2010, Randall 2010, VanZandt 2010 )
		252
		
q5_1: 3 observations have more death than inpatient discharges.
q5_2: 252 observations have more deaths than physicians.


6. How does the Ratio of DPC per 100,000 Population variable differ by border and non-border 
counties; that is, which has a higher average Ratio of DPC per 100,000 Population? 

ANS: non-border

From 2010 to 2012, non-border counties have a higher average Ratio of DPC per 100,000 population.

 
<PHR Year Analysis> 
7. Compare the average number of physicians and the average number of patients across all PHRs 
for each year. Which PHR has the highest average physician to average patients ratio in each 
year? (Hint: you will need to calculate this ratio before running a command to compare across 
PHRs) 

ANS: PHR 3

From 2010-2012, PHR 3 had the highest average among all PHRs each year.

				Obs    pubhlt        year    yeardisc      dpctotal      avgratio

                                   1    PHR 3         2011    42843.17    658.52631579    0.015371
                                   2    PHR 3         2012    45974.47    683.36842105    0.014864
                                   3    PHR 3         2010    43408.83    632.05263158    0.014560
                                   4    PHR 7         2012    14694.33    188.76666667    0.012846
                                   5    PHR 6         2010    64022.73    807.76923077    0.012617
                                   6    PHR 7         2011    14445.14    181.16666667    0.012542
                                   7    PHR 6         2012    72346.40    880.92307692    0.012176
                                   8    PHR 6         2011    71155.00    844.30769231    0.011866
                                   9    PHR 7         2010    14939.15    172.83333333    0.011569
                                  10    PHR 4         2012     8590.41    84.173913043    0.009799

<MSA Border Analysis> 
8. How many MSAs are in the border region? 
ANS: 4 MSAs are in the La Paz border region.
(rownsville-Harlinge, El Paso, Laredo and McAllen-Edinburg-Pha.)

31 MSAs are in the border region.

9. Which MSA had the largest increase in patient discharges in patient discharges in 2011? What about 2012? (Hint: one way to do this would be to sort your data before printing)

ANS:
The Midland MSA had the largest increase in patient discharges in 2011 (10.2% increase).
The Victoria MSA had the largest increase in patient discharges in 2012 (7.8% increase).




