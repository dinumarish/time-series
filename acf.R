set.seed(2021)
x= NULL
z= rnorm(1000,0,1)
x[1]=z[1]
for (i in 2:1000){x[i]=z[i]+0.9*x[i-1]}

par(mfrow=c(3,1))
plot(ts(x), main='time series',lwd=0.3,col='blue') 
acf(x, main='Auto correlation', lwd=0.2)
pacf(x,main='partial auto correlation')