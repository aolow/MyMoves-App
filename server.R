library(shiny)
library(ggplot2)
library(reshape2)
source("helpers.R")

my_data <- read.csv("data/summary.csv")[,-1]

# server.R

shinyServer(
  function(input, output) {
    
    output$plot1 <- renderPlot({  
      
      p(act = input$activity,
        var = input$variable,
        min = input$daterange[1], 
        max = input$daterange[2])
    
      })
   
    
  }
)
