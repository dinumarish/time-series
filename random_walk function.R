rwalk=function(steps, sigma=1,seed=47,step0=0){
  set.seed(seed)
  x=step0
  for(i in 2:steps){
    x[i] =x[i-1]+rnorm(1,0,sigma)
  }
  return(x)
}
par(mfrow=c(1,1))
rw1 = rwalk(1000,1,seed=1220)
rw2 = rwalk(1000,1,seed=2201)
rw3 = rwalk(1000,1,seed=2032)
rw4 = rwalk(1000,1,seed=2023)
plot(rw1,main='random walks',ylab='',type='l')
lines(rw2)
lines(rw3)
lines(rw4)