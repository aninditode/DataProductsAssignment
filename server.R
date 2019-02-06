#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  
  fit <- lm(circumference ~ age, data = Orange)
  
  predCirc <- reactive({
    fit$coefficients[1] + fit$coefficients[2]*input$SelectAge    
  })
  
  
  output$distPlot <- renderPlot({

    plot(data = Orange, circumference ~ age, cex = 2, col = "black", bty = "l")
    points(Orange$age, fit$fitted.values, pch = 3, cex = 2, col = "red")
    abline(fit, col = "red", lwd = 2)
    points(input$SelectAge, predCirc(), pch = 19, cex = 3, col = "blue")

  })
  
  output$result <- renderText( {

    paste("When is age is",input$SelectAge, "days, 
          the predicted circumference is ", round (predCirc(),2),"mm.")
  })
  
})
