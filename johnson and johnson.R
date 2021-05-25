# Time plot for Johnson&Johnson

plot(JohnsonJohnson, 
     main='Johnson&Johnosn earnings per share',
     col='blue', lwd=3)

logjj = diff(log(JohnsonJohnson))
logjj0 = logjj-mean(logjj)

par(mfrow=c(3,1))
plot(logjj0,main='stationary representation')
acf(logjj0,main='ACF')
pacf(logjj0,main='PACF')
p=4
#obtain the auto corelation terms terms and store in r vector
r=acf(logjj0,plot=F)$acf[2:(p+1)]

R=matrix(1,p,p)
for (i in 1:p){ 
  for (j in 1:p){
    if(i!=j)
      R[i,j]=r[abs(i-j)]
    }
}
#solving linear equations for finding phihats the estimators
phihat=solve(R,r)

c0 = acf(logjj0,type='covariance',plot=F)$acf[1]

variance = c0*(1-sum(phihat*r))

constant = mean(logjj0)*(1-sum(phihat))

cat('constant = ',constant, 'Co-efficients = ',
    phihat,'and Variance = ',variance)