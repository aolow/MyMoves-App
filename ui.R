library(shiny)
# ui.R

shinyUI(fluidPage(
  titlePanel("My Moves 2014 - 2015"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("This application allows to explore my own personal activity dataset collected using 'Moves' application on my mobile device."),
      helpText("Please select a type of activity, output and time-frame you're interested in from the choices below"),
      
      selectInput("activity", 
                  label = "Choose a type of activity to display",
                  choices = list("walking", "running", "transport"),
                  selected = "walking"),
     
      checkboxGroupInput("variable", 
                         label = "Pick outputs to graph", 
                         choices = list("Duration", "Distance", "Steps", "Calories"),
                         selected = c("Distance", "Steps", "Calories", "Duration")),
      
      dateRangeInput("daterange", 
                     label = "Date range:",
                     start = "2014-05-01",
                     end   = "2015-06-08"),
      
      helpText(h5(strong("Units:"))),
      helpText(h6("Duration - minutes")),
      helpText(h6("Distance - miles")),
      helpText(h6("Calories - kcal")),
      
      br(),
      
      img(src="moves-logo-206x206.png", height = 50, width = 50)

    ),
    
    mainPanel(plotOutput("plot1"))
  )
))