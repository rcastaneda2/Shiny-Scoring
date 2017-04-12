# server.R

# library(maps)
# library(mapproj)
# source("plotscores.R")
# counties <- readRDS("data/counties.rds")


####################################################
library(mirt)

options(shiny.error = browser)
F2<-readRDS("Mod2F.RDS")
fact1<-readRDS("Mod_dim1.RDS")
fact2<-readRDS("Mod_dim2.RDS")
source("functions.R")


shinyServer(function(input, output) {
        
  

        

  newData <- reactive({
    
    resp<-c(input$v1,input$v2,input$v3,input$v4,input$v5,
            input$v6,input$v7,input$v8,input$v9,input$v10,input$v11,input$v12)
          resp2<-t(resp)
      
          resp2[resp2=="Always"] <- 1;
          resp2[resp2=="Often"] <- 2;
          resp2[resp2=="Sometimes"] <- 3;
          resp2[resp2=="Rarely"] <- 4;
          resp2[resp2=="Never"] <- 5;
          resp2[resp2=="NA"] <- NA;
      
          resp2<-as.numeric(resp2)
    
    isolate({
      
      datadata <- resp2
      
      
      
      
    })
    
  })
      
      
      
  
    output$scores <- renderPrint({
      
      resp2<-newData()

       scoring(input=resp2)

      
    })
    
    
    
    
    output$plot123<-renderPlot({
      
      resp2<-newData()
      res<-scoring(resp2)
      
      plotscore(res$scoresF1[1],c("Psycho-Social Symptoms Subscale"))
      
    })
    
    output$plot1234<-renderPlot({
      
      resp2<-newData()
      res<-scoring(resp2)
      
      plotscore(res$scoresF2[1],c("Physical Symptoms Subscale"))
      
    })
    
    # output$plot12345<-renderPlot({
    #   
    #   plotscore(1.25,c("Psychosocial"))
    #   
    # })
    

    output$tex <- renderUI({
        resp2<-newData()
        res<-scoring(resp2)
    
          if(res$color[1]=="green"){
    
              includeHTML("Green_phys.html")
            
          }else if(res$color[1]=="yellow"){
              
            includeHTML("Yellow_phys.html")
            
          }else if(res$color[1]=="red"){
            
            includeHTML("Red_phys.html")
            
          }else{
            
            includeHTML("Please_intput.html")
          }


      })
    
    output$tex2 <- renderUI({
          resp2<-newData()
          res<-scoring(resp2)
          
          if(res$color[2]=="green"){
            
            includeHTML("Green_psych.html")
            
          }else if(res$color[2]=="yellow"){
            
            includeHTML("Yellow_psych.html")
            
          }else if(res$color[2]=="red"){
            
            includeHTML("Red_psych.html")
            
          }else{
            
            
          }
      
      
    })
  
    
    
    
    
  
})