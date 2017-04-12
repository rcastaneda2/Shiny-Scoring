# ui.R

# Always <- 5; Often <- 4; Sometimes <- 3; Rarelely <- 2; Never <- 1;
# 
# opts<-list(Always = Always, Often = Often, Sometimes = Sometimes, Rarelely = Rarelely, Never = Never)

library(markdown)

shinyUI(fluidPage(#theme="bootstrap_flatly.css",
  titlePanel("Cushing Quality of Life IRT Scoring"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Enter Cushings Patient Answers"),
      
      
      selectInput("v1", 
                  label = "I have trouble sleeping",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v2", 
                  label = "I have pain that keeps me from leading a normal life",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v3", 
                  label = "My wounds take a long time to heal",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v4", 
                  label = "I bruise easily",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v5", 
                  label = "I am more irritable, I have sudden mood swings and angry outbursts",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v6", 
                  label = "I have less self-confidence, I feel more insecure",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v7", 
                  label = "I'm worried about the chnages in my physical appearance due to my illness",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v8", 
                  label = "I feel less like giong out or seeing relatives or friends",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v9", 
                  label = "I have had to give up my social or leisure activities due to my illness",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v10", 
                  label = "My illness affects my everyday activities such as working or studying",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v11", 
                  label = "It's difficult for me to remember things",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      selectInput("v12", 
                  label = "I'm worried about my health in the future",
                  choices = c("Always", "Often",
                              "Sometimes", "Rarely", "Never","NA"),
                  selected = "Never"),
      
      submitButton("Score")
      
      
      ,width=3, fluid=FALSE),
    
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Summary",htmlOutput("tex"),htmlOutput("tex2"),icon=icon("sticky-note-o",lib="font-awesome")),
                  tabPanel("Results",h2("Score Distributions"),p("Dotted line indicates the patient's score relative to other Cushings Patients"),plotOutput("plot123"),plotOutput("plot1234"),verbatimTextOutput("scores"),icon=icon("area-chart",lib="font-awesome")),
                  
                  #tabPanel("Overview",plotOutput("plot12345",width="700px",height="350px")),
                  tabPanel("Descriptions",includeHTML("summary.html"),icon=icon("navicon",lib="font-awesome")),
                  tabPanel("About",icon=icon("book",lib="font-awesome"),br(),
                           
                           p("The CushingQoL is the most commonly used diseases-specific health-related QoL questionnaire designed for patients diagnosed with CS (Webb et al., 2008). Webb et al. (2008) developed the CushingQoL using standardized interviews with patients and endocrinologists. The single total score of the CushingQoL has demonstrated good construct validity (Badia et al., 2013; Roset, Badia, Forsythe, & Webb, 2013; Santos et al., 2012), test-retest reliability (Nelson et al., 2013), and internal consistency (Santos et al., 2012). Recent research indicates the CushingQoL better represents patients QoL concerns when scored with two subscales: psychosocial issues and physical problems (Tiemensma, Depaoli, & Felt, 2016). "),
                           p("If you have questions or comments about using or interpreting the subscale scores, or if you have a bug or issue to report about this Shiny app, please feel free to send an email to Dr. Jitske Tiemensma, Dr. Sarah Depaoli or Dr. Ruben Castaneda."), 
                           br(), 
                           strong('Authors:'),
                           p(div(a("Ruben Castaneda,", href="http://www.rubencastaneda.net/"),target="_blank", "Statistician"),
                           em("rcastaneda2@ucmerced.edu")),
                           p(div(a("Sarah Depaoli,", href="http://sarahdepaoli.com/", target="_blank"),"Statistician (PI)"),
                           em("sdepaoli@ucmerced.edu")),
                           p(div(a("Jitske Tiemensma,", href="http://pnelab.com/?facstaff=jitske-tiemensma", target="_blank"),"Psychoneuroendocrinologist (PI)"),
                           em("jtimensma@ucmerced.edu"),br(),br()), 
                           
                           
                           strong('Acknowledgments:'), 
                           p(div("We would like to acknowledge Dr. Webb as the original author and creator of the Acromegaly Quality of Life Scale. Her work and dedication has brought countless benefit to patients and researchers who rely on his work.")), 
                           br(),
                
                           strong('References:'), 
                           p(div(a("J. Tiemensma, S. Depaoli, J.M. Felt (2016). Using subscales when scoring the Cushing’s Quality of Life (CushingQoL) questionnaire. European Journal of Endocrinology, 174(1):33-40."))), 
                           p(a("J. Tiemensma, E. Gaab, M. Voorhaar, G. Asijee, A.A. Kaptein (2016). Illness perceptions and coping determine QoL in COPD-patients. International Journal of Chronic Obstructive Pulmonary Disease, 11:2001-2007")),
                           p(a("Webb S. M., Badia X., Barahona M. J., Colao A., Strasburger C. J., Taarin A., van Aken M. O., Pivonello R., Stall G., Lamberts S. W. J., & Glusman J. E. (2008). Evaluation of health-related quality of life in patients with Cushing’s syndrome with a new questionnaire. European Journal of Endocrinology, 158, 623-630.")))
                  
                  
                  
                  #tabPanel("Details",)
                  
                  
      )))
  
))


