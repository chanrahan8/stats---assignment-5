#
# stats assignment 5

# load appropriate libraries
library(shiny)
library("ggplot2")
library("dplyr")

# set var for dataset
dig.df <- read.csv("DIG.csv")
dig.df <- dig.df %>% 
  select(ID, TRTMT, AGE, SEX, BMI, KLEVEL, CREAT, DIABP, SYSBP, HYPERTEN, CVD, WHF, DIG, HOSP, HOSPDAYS, DEATH, DEATHDAY)

dig_fact <- c("ID", "TRTMT", "SEX", "HYPERTEN", "CVD", "WHF", "DIG", "HOSP", "DEATH")
for(i in dig_fact){
  dig.df[, i] <- as.factor(dig.df[, i])
}

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "xval", 
                        label = "choose x value", 
                        choices = c("TRTMT", "SEX", "HYPERTEN", "CVD", "WHF", "DIG", "HOSP", "DEATH")), 
            selectInput(inputId = "yval", 
                        label = "choose y value", 
                        choices = c("TRTMT", "SEX", "HYPERTEN", "CVD", "WHF", "DIG", "HOSP", "DEATH"))
        
      ), 
      mainPanel = plotOutput("plot1")
  )
)
# Define server logic required to draw a histogram
server <- function(input, output) {

    #output$distPlot <- renderPlot({
      
    }


# Run the application 
shinyApp(ui = ui, server = server)
