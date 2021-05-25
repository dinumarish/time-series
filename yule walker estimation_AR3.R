n=100000
phi=NULL
phi = c(1/3,1/2,7/100)
sig=4
set.seed(2017)
ar3 = arima.sim(n,model=list(ar=phi),sd=sig)
r=NULL
r[1:3]=acf(ar3,plot=F)$acf[2:4]
R=matrix(1,3,3)
R[1,2]=r[1]
R[1,3]=r[2]
R[2,1]=r[1]
R[3,1]=r[2]
R[2,3]=r[1]
R[3,2]=r[1]
b = matrix(r,3,1)
phihat=solve(R,b)

c0 = acf(ar3,type='covariance',plot=F)$acf[1]
varhat = c0*(1-sum(phihat*r))
par(mfrow=c(3,1))
plot(ar3,main='AR(3) process')
acf(ar3,main='ACF')
pacf(ar3,main='PACF')

