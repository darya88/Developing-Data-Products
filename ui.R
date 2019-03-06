
# This is the user-interface definition of a Shiny web application.

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Car Compare"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText(" Directions - 
               1. Specify the features and ranges of the cars to be compared using slidebars and checkboxes below.
               2. The table on right side will show the list of cars that fit the given specifications"),
        
       sliderInput('avg', 'Milage(in Km/L)', min=10, max=40, value=c(10,40), step=1),
      checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
      sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
      checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
      checkboxGroupInput('gear','Gears:',c("Three"=3, "Four"=4, "Five"=5),selected = c(3,4,5)),
      submitButton("Compare!")
    ),
                   
    mainPanel(
      dataTableOutput('table'))
    )
  )
)
