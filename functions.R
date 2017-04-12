

plotscore<-function(score,title){
  
      # draw the normal curve
      curve(dnorm(x,0,1), xlim=c(-3,3), main=title, xlab="Average", ylab="",yaxt="n")
      
      # define shaded region
      from.z <- -3.5
      to.z.green<-c(3.5)
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



warning.labels<-function(warn1,warn2){
  
  color.score=c(warn1,warn2)
  
  par(mfrow=c(1,2))
  #par(width=5, height=4)
  #par(mar=c(10,0,0,10))
  
  col.font<-c("black","black")
  if(color.score[1]=="red"){col.font[1]<-c("white")}
  if(color.score[2]=="red"){col.font[2]<-c("white")}
  
  plot(c(1,10),c(1,10),type='n',xlab="",ylab="",xaxt='n',yaxt='n',main="Physical")
  rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = color.score[1])
  text(1,7,res$scale1,col=col.font[1],font=2, pos=4)
  #text(5,5, text(5,5, paste("Place holder")))
  
  
  plot(c(1,10),c(1,10),type='n',xlab="",ylab="",xaxt='n',yaxt='n',main="Social")
  rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = color.score[2])
  text(1,7,res$scale2, col=col.font[2],font=2, pos=4)
  
  
}



scoring<-function(mod,input){
  F2<-mod
  pattern<-input
  scores1<-fscores(F2,method="EAP",response.pattern=pattern)
  color<-c("blank","blank")
  
  color[scores1[13]>=(-1)][1]<-c("green")
  color[scores1[13]<=(-1)][1]<-c("yellow")
  color[scores1[13]<=(-2)][1]<-c("red")
  
  color[scores1[14]>=(-1)][2]<-c("green")
  color[scores1[14]<=(-1)][2]<-c("yellow")
  color[scores1[14]<=(-2)][2]<-c("red")
  
  if(color[1]=="red"){
    warn1<-paste0("Patients in this range will have severe issues with psychological well-being and social relationships. Doctors should look for patients with cognitive impairments (e.g., memory), anxiety, mood disturbances, and complaints about social relationships")
    
  }else if(color[1]=="yellow"){
    warn1<-paste0("Patients in this range will either have issues with their psychological well-being or social relationships. Doctors should look for patients with any of the following: cognitive impairments (e.g., memory), anxiety, mood disturbances, or complaints about social relationships")
    
  }else{
    warn1<-paste0("Patients in this range will have little to no complaints about psychosocial well-being.")
  }
  
  
  if(color[2]=="red"){
    warn2<-paste0("Patients in this range will have severe issues with physical well-being. Doctors should look for patients who are having trouble sleeping or complain about wounds(i.e., bruises or wounds).")
    
  }else if(color[2]=="yellow"){
    warn2<-paste0("Patients in this range will either have issues with physical well-being. Doctors should look for patients who are having sleep disturbances or complaints about wounds (i.e., bruising or healing).")
  }else{
    warn2<-paste0("Patients in this range will have little to no complaints about physical well-being.")
  }
  
  res=list(scoresF1=scores1[c(13,15)],scoresF2=scores1[c(14,16)],pattern=pattern,color=color,scale1=warn1,scale2=warn2)
  
  return(res)
  
}
