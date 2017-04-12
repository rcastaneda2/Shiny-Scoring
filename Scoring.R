##Scoring


    #data <- read.csv("dat1.csv", header=T)


#Section used to generate item parameters
    # #Two Dimensional
    # model <- mirt.model("P = 2, 5-12
    #                     S = 1, 3, 4
    #                    COV = P*S")
    # Mod2F <- mirt(data, model, itemtype = "graded", SE = T, TOL = 0.001)
    # 
    # #Dimension 1
    # factor1.dat<-data[,c(2,5,6,7,8,9,10,11,12)]
    # factor2.dat<-data[,c(1,3,4)]
    # #One Dimensiona TWo Factors 
    # factor1 <- mirt.model("P = 1-9")
    # factor2 <- mirt.model("P = 1-3")
    # Mod.dim1 <- mirt(factor1.dat, factor1, itemtype = "graded", SE = T, TOL = 0.001)
    # Mod.dim2 <- mirt(factor2.dat, factor2, itemtype = "graded", SE = T, TOL = 0.001)
    # 
    # 
    # saveRDS(Mod2F,file="Mod2F.RDS")
    # saveRDS(Mod.dim1,file="Mod_dim1.RDS")
    # saveRDS(Mod.dim1,file="Mod_dim2.RDS")


    # F2<-readRDS("Mod2F.RDS")
    # fact1<-readRDS("Mod_dim1.RDS")
    # fact2<-readRDS("Mod_dim2.RDS")

# Scoring<-function(input){
#   
#   #pattern<-c(1,2,3,1,2,3,4,5,1,2,4,1)
#   patter<-input
#   scores1<-fscores(F2,method="EAP",response.pattern=pattern)
#   res=list(scores=scores1,data=data)
#   return(res)
#   
# }
#pattern.dim1<-pattern[c(2,5,6,7,8,9,10,11,12)]
#pattern.dim2<-pattern[c(1,3,4)]



#fscores(Mod2,method="EAP",response.pattern=pattern)

# Mod3 <- mirt(factor2.dat, factor2, itemtype = "graded", SE = T, TOL = 0.001)
# pattern<-c(2,6,7)
# fscores(Mod3,method="EAP",response.pattern=pattern)


#Ploting a color rectangle
#par(bg="red")


#Scoring(input = resp)
Scoring<-function(input){
  
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
    warn1<-paste0("Red: Patients in this range will have severe issues with psychological well-being and social relationships.", " Doctors should look for patients with cognitive impairments (e.g., memory), anxiety, mood disturbances, and complaints about social relationships")
    
  }else if(color[1]=="yellow"){
    warn1<-paste0("Yellow: Patients in this range will either have issues with their psychological well-being or social relationships. Doctors should look for patients with any of the following: cognitive impairments (e.g., memory), anxiety, mood disturbances, or complaints about social relationships")
    
  }else{
    warn1<-paste0("Green: Patients in this range will have little to no complaints about psychosocial well-being.")
  }
  
  
  if(color[2]=="red"){
    warn2<-paste0("Red: Patients in this range will have severe issues with physical well-being. Doctors should look for patients who are having trouble sleeping or complain about wounds(i.e., bruises or wounds).")
    
  }else if(color[2]=="yellow"){
    warn2<-paste0("Yellow: Patients in this range will either have issues with physical well-being. Doctors should look for patients who are having sleep disturbances or complaints about wounds (i.e., bruising or healing).")
  }else{
    warn2<-paste0("Green: Patients in this range will have little to no complaints about physical well-being.")
  }
  
  res=list(scoresF1=scores1[c(13,15)],scoresF2=scores1[c(14,16)],pattern=pattern,color=color,scale1=warn1,scale2=warn2)
  
  return(res)
  
}

warnings.labels<-function(color){
  
  color.score=color
  
  par(mfrow=c(1,2))
  plot(c(1,10),c(1,10),type='n',xlab="",ylab="",xaxt='n',yaxt='n',main="Physical")
  rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = color.score[1])
  
  plot(c(1,10),c(1,10),type='n',xlab="",ylab="",xaxt='n',yaxt='n',main="Social")
  rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = color.score[2])
  
  
}

