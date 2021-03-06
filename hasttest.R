hash = read.csv("hashTest.csv",sep = ",",header = F)
View(hash)
colnames(hash)= c("size","time")
summary(hash$time)

fit1 = lm(time~size,data = hash)
summary(fit1)
plot(hash$size,hash$time,xlab = "Size", ylab = "Time",pch=21, main = "Polynomial function of degree 1")
lines(hash$size,fit1$fitted.values, col="red")

plot(hash$size,hash$time,xlab = "Size", ylab = "Time", main = "Time measurement of Hash in Ruby")
abline( h=0.7e-06, col="red")
hist(hash$time)
abline(8,8E+05)

fit1 = lm(time~poly(size,100,raw = T),data = hash)
summary(fit1)
plot(hash$size,hash$time,xlab = "Size", ylab = "Time",pch=21, main = "Polynomial function of degree 1")
lines(hash$size,fit1$fitted.values, col="red")
length(hash$time<6.00e-07)

plot(hash$time)
which.max(hash$time)
s = sort(hash$time)
plot(which(hash$time),s)
index = c(1:length(hash$time))
