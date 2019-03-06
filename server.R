
# This is the server logic of a Shiny web application.

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    avg_sq <- seq(from = input$avg[1], to = input$avg[2], by = .1)
    
    data <- transmute(mtcars, Car = rownames(mtcars), Milage = mpg, 
                      Cylinders = cyl, Horsepower = hp, 
                      Transmission = am, Gears=gear, Quater_Mile_Time= qsec)
    data <- filter(data, Milage %in% avg_sq, Cylinders %in% input$cyl,Horsepower %in% hp_seq, Transmission %in% input$am, Gears %in% input$gear)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    
    data
    
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
  
})
