

plotscore<-function(score,title){
  
      # draw the normal curve
      curve(dnorm(x,0,1), xlim=c(-3,3), main=title)
      
      # define shaded region
      from.z <- -3
      to.z.green<-c(3)
      to.z.yellow <- qnorm(.158)
      to.z.red<-qnorm(.02275)
      
      # 
      # to.z.red <- qnorm(.158) #Z score of -1
      # to.z.green <- qnorm(.025)
      
      
      
      S.x  <- c(from.z, seq(from.z, to.z.green, 0.01), to.z.green)
      S.y  <- c(0, dnorm(seq(from.z, to.z.green, 0.01)), 0)
      polygon(S.x,S.y, col="green") #85% people
      
      
      S.x  <- c(from.z, seq(from.z, to.z.yellow, 0.01), to.z.yellow)
      S.y  <- c(0, dnorm(seq(from.z, to.z.yellow, 0.01)), 0)
      polygon(S.x,S.y, col="yellow") #95% People
      
      
      S.x  <- c(from.z, seq(from.z, to.z.red, 0.01), to.z.red)
      S.y  <- c(0, dnorm(seq(from.z, to.z.red, 0.01)), 0)
      polygon(S.x,S.y, col="red") #<1% People
      
      abline(v=score,col="black",lwd=3,lty="dotted")

}



plotscore(-2.5,c("Physical Subscale"))

plotscore(-2.5,c("Psycho-Social Subscale"))
