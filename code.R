> list.files("dataSets")
character(0)
> getwd()
[1] "C:/Users/rick/Desktop/files/linear_regression/linear_regression/dataSets"
> list.files()
[1] "Exam.rds"   "states.dta" "states.rds"
> states.data <- readRDS("states.rds")
> str(states.data)
'data.frame':	51 obs. of  21 variables:
 $ state  : chr  "Alabama" "Alaska" "Arizona" "Arkansas" ...
 $ region : Factor w/ 4 levels "West","N. East",..: 3 1 1 3 1 1 2 3 NA 3 ...
 $ pop    : num  4041000 550000 3665000 2351000 29760000 ...
 $ area   : num  52423 570374 113642 52075 155973 ...
 $ density: num  77.08 0.96 32.25 45.15 190.8 ...
 $ metro  : num  67.4 41.1 79 40.1 95.7 ...
 $ waste  : num  1.11 0.91 0.79 0.85 1.51 ...
 $ energy : int  393 991 258 330 246 273 234 349 NA 237 ...
 $ miles  : num  10.5 7.2 9.7 8.9 8.7 ...
 $ toxic  : num  27.86 37.41 19.65 24.6 3.26 ...
 $ green  : num  29.2 NA 18.4 26 15.6 ...
 $ house  : int  30 0 13 25 50 36 64 69 NA 45 ...
 $ senate : int  10 20 33 37 47 58 87 83 NA 47 ...
 $ csat   : int  991 920 932 1005 897 959 897 892 840 882 ...
 $ vsat   : int  476 439 442 482 415 453 429 428 405 416 ...
 $ msat   : int  515 481 490 523 482 506 468 464 435 466 ...
 $ percent: int  8 41 26 6 47 29 81 61 71 48 ...
 $ expense: int  3627 8330 4309 3700 4491 5064 7602 5865 9259 5276 ...
 $ income : num  27.5 48.3 32.1 24.6 41.7 ...
 $ high   : num  66.9 86.6 78.7 66.3 76.2 ...
 $ college: num  15.7 23 20.3 13.3 23.4 ...
 - attr(*, "datalabel")= chr "U.S. states data 1990-91"
 - attr(*, "time.stamp")= chr " 6 Apr 2012 08:40"
 - attr(*, "formats")= chr  "%20s" "%9.0g" "%9.0g" "%9.0g" ...
 - attr(*, "types")= int  20 251 254 254 254 254 254 252 254 254 ...
 - attr(*, "val.labels")= chr  "" "region" "" "" ...
 - attr(*, "var.labels")= chr  "State" "Geographical region" "1990 population" "Land area, square miles" ...
 - attr(*, "expansion.fields")=List of 4
  ..$ : chr  "_dta" "_lang_c" "default"
  ..$ : chr  "_dta" "_lang_list" "default"
  ..$ : chr  "_dta" "__xi__Vars__To__Drop__" "_Iregion_2 _Iregion_3 _Iregion_4 _IregXperce_2 _IregXperce_3 _IregXperce_4"
  ..$ : chr  "_dta" "__xi__Vars__Prefix__" "_I _I _I _I _I _I"
 - attr(*, "version")= int 12
 - attr(*, "label.table")=List of 1
  ..$ region: Named int  1 2 3 4
  .. ..- attr(*, "names")= chr  "West" "N. East" "South" "Midwest"
> states.info <- data.frame(attributes(states.data)[c("names", "var.labels")])
> tail(states.info, 8)
     names                      var.labels
14    csat        Mean composite SAT score
15    vsat           Mean verbal SAT score
16    msat             Mean math SAT score
17 percent       % HS graduates taking SAT
18 expense Per pupil expenditures prim&sec
19  income Median household income, $1,000
20    high             % adults HS diploma
21 college         % adults college degree
> 
> sts.ex.sat <- subset(states.data, select = c("expense", "csat"))
> summary(sts.ex.sat)
    expense          csat       
 Min.   :2960   Min.   : 832.0  
 1st Qu.:4352   1st Qu.: 888.0  
 Median :5000   Median : 926.0  
 Mean   :5236   Mean   : 944.1  
 3rd Qu.:5794   3rd Qu.: 997.0  
 Max.   :9259   Max.   :1093.0  
> cor(sts.ex.sat)
           expense       csat
expense  1.0000000 -0.4662978
csat    -0.4662978  1.0000000
> plot(sts.ex.sat)
> sat.mod <- lm(csat ~ expense, data = states.data)
> summary(stat.mod)
Error in summary(stat.mod) : object 'stat.mod' not found
> summary(sat.mod)

Call:
lm(formula = csat ~ expense, data = states.data)

Residuals:
     Min       1Q   Median       3Q      Max 
-131.811  -38.085    5.607   37.852  136.495 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.061e+03  3.270e+01   32.44  < 2e-16 ***
expense     -2.228e-02  6.037e-03   -3.69 0.000563 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 59.81 on 49 degrees of freedom
Multiple R-squared:  0.2174,	Adjusted R-squared:  0.2015 
F-statistic: 13.61 on 1 and 49 DF,  p-value: 0.0005631
