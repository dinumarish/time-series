par(mfrow=C(3,1))
phi1 = 0.6 ; phi2 =0.2
tsd = arima.sim(n=500,list(ar=c(phi1,phi2)))
plot(tsd, main=paste("AR process phi1 =",phi1," phi2=",phi2))
acf(tsd, main='auto correlation')
acf(tsd, type='partial', main='PACF')
