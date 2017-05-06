kruskal = read.csv("kruskal.csv", header = F)
View(kruskal)
colnames(kruskal)=c("edges","vertices","time")
View(kruskal)

#The function that we will use is based on two variables: edges and time, becuase the hypothesis function is
# O(mlog(n)) where m is edges and n is vertices but that equation was reduced from O(mlog(m)) and n^2 = m ,
# so log(n^2) = 2*log(n) , therefore we can just use log(n).

ylm1 = lm(time~edges,data=kruskal)
summary(ylm1)
plot(kruskal$edges,kruskal$time,xlab = "Size", ylab = "Time",pch=21, main = "Polynomial function of degree 1")
lines(kruskal$edges,ylm1$fitted.values, col="red")
ylm1$coefficients
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -1.614e+01  2.394e+00  -6.741 4.15e-09 ***
#   edges        2.350e-05  2.147e-07 109.426  < 2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 13.29 on 68 degrees of freedom
# Multiple R-squared:  0.9944,	Adjusted R-squared:  0.9943 
# F-statistic: 1.197e+04 on 1 and 68 DF,  p-value: < 2.2e-16



fit2=lm(time~poly(edges,2,raw = T),data=kruskal)
summary(fit2)
fit2$coefficients
plot(kruskal$edges,kruskal$time,xlab = "Size", ylab = "Time",pch=21,main = "Polynomial function of degree 2" )
lines(kruskal$edges,fit2$fitted.values, col="green")
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)              -1.603e+00  7.456e-01   -2.15   0.0352 *  
#   poly(edges, 2, raw = T)1  1.772e-05  1.869e-07   94.81   <2e-16 ***
#   poly(edges, 2, raw = T)2  2.705e-13  8.392e-15   32.23   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3.297 on 67 degrees of freedom
# Multiple R-squared:  0.9997,	Adjusted R-squared:  0.9996 
# F-statistic: 9.787e+04 on 2 and 67 DF,  p-value: < 2.2e-16





fit3=lm(time~poly(edges,3,raw = T),data=kruskal)
summary(fit3)
fit3$coefficients
plot(kruskal$edges,kruskal$time,xlab = "Size", ylab = "Time",pch=21,main ="Polynomial function of degree 3" )
lines(kruskal$edges,fit3$fitted.values, col="blue")
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)              -2.749e+00  8.381e-01  -3.280 0.001662 ** 
#   poly(edges, 3, raw = T)1  1.867e-05  4.045e-07  46.153  < 2e-16 ***
#   poly(edges, 3, raw = T)2  1.561e-13  4.438e-14   3.518 0.000792 ***
#   poly(edges, 3, raw = T)3  3.370e-21  1.287e-21   2.620 0.010913 *  
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3.162 on 66 degrees of freedom
# Multiple R-squared:  0.9997,	Adjusted R-squared:  0.9997 
# F-statistic: 7.096e+04 on 3 and 66 DF,  p-value: < 2.2e-16







fit4=lm(time~poly(edges,4,raw = T),data=kruskal)
summary(fit4)
fit4$coefficients
plot(kruskal$edges,kruskal$time,xlab = "Size", ylab = "Time",pch=21,main ="Polynomial function of degree 4" )
lines(kruskal$edges,fit4$fitted.values, col="brown")
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)              -1.549e+00  8.998e-01  -1.722 0.089847 .  
# poly(edges, 4, raw = T)1  1.698e-05  7.068e-07  24.019  < 2e-16 ***
#   poly(edges, 4, raw = T)2  5.299e-13  1.374e-13   3.857 0.000266 ***
#   poly(edges, 4, raw = T)3 -2.267e-20  9.193e-21  -2.467 0.016288 *  
#   poly(edges, 4, raw = T)4  5.613e-28  1.964e-28   2.859 0.005713 ** 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3.003 on 65 degrees of freedom
# Multiple R-squared:  0.9997,	Adjusted R-squared:  0.9997 
# F-statistic: 5.9e+04 on 4 and 65 DF,  p-value: < 2.2e-16



fit5=lm(time~poly(edges,5,raw = T) ,data=kruskal)
summary(fit5)
fit5$coefficients
plot(kruskal$edges,kruskal$time,xlab = "Size", ylab = "Time",pch=21,main ="Polynomial function of degree 5" )
lines(kruskal$edges,fit5$fitted.values, col="red")
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)              -2.759e-01  9.301e-01  -0.297 0.767702    
# poly(edges, 5, raw = T)1  1.424e-05  1.078e-06  13.212  < 2e-16 ***
#   poly(edges, 5, raw = T)2  1.480e-12  3.223e-13   4.591 2.12e-05 ***
#   poly(edges, 5, raw = T)3 -1.372e-19  3.667e-20  -3.742 0.000393 ***
#   poly(edges, 5, raw = T)4  6.158e-27  1.752e-27   3.516 0.000812 ***
#   poly(edges, 5, raw = T)5 -9.516e-35  2.962e-35  -3.213 0.002059 ** 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.808 on 64 degrees of freedom
# Multiple R-squared:  0.9998,	Adjusted R-squared:  0.9997 
# F-statistic: 5.397e+04 on 5 and 64 DF,  p-value: < 2.2e-16




fit6=lm(time~I( edges*log2(edges) ),data=kruskal)
summary(fit6)
fit6$coefficients
plot(kruskal$edges,kruskal$time,xlab = "Size", ylab = "Time",pch=21,main ="m*log2(m) function" )
lines(kruskal$edges,fit6$fitted.values, col="blue")
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)            -9.352e+00  1.696e+00  -5.515 5.85e-07 ***
#   I(edges * log2(edges))  9.609e-07  6.337e-09 151.623  < 2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 9.608 on 68 degrees of freedom
# Multiple R-squared:  0.9971,	Adjusted R-squared:  0.997 
# F-statistic: 2.299e+04 on 1 and 68 DF,  p-value: < 2.2e-16




fit7=lm(time~I( edges*log2(edges))+ edges + vertices  ,data=kruskal)
summary(fit7)
plot(kruskal$edges,kruskal$time,xlab = "Size", ylab = "Time",pch=21,main ="m*log2(m) function type 2" )
lines(kruskal$edges,fit7$fitted.values, col="brown")

# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)            -7.297e+00  2.485e+00  -2.936  0.00457 ** 
#   I(edges * log2(edges))  5.490e-06  5.003e-07  10.973  < 2e-16 ***
#   edges                  -1.170e-04  1.334e-05  -8.770 1.11e-12 ***
#   vertices                2.319e-02  4.262e-03   5.440 8.37e-07 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 4.308 on 66 degrees of freedom
# Multiple R-squared:  0.9994,	Adjusted R-squared:  0.9994 
# F-statistic: 3.82e+04 on 3 and 66 DF,  p-value: < 2.2e-16

s = (kruskal$time/(kruskal$edges*log2(kruskal$edges)))
summary(s)












