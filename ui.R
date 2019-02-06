#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Predict Orange Tree Circumference"),
  
  br(),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
      
       p("The Orange dataset in datasets package contains 35 observations with 
          age (in days) and circumference (in mm) of orange trees. In this application, 
          we have fitted a linear regression model to predict the circumference for given 
          values of age."),
       br(),
       p("The black circles indicate the observations and the plus signs indicate the 
          fitted values. The blue circle indicates the predicted circumference for an age 
          selected in the slider below. Move the slider to select different values of age
          and see the predictions change"),
       br(),
       sliderInput("SelectAge",
                   "Age in Number of Days:",
                   min = 120,
                   max = 1500,
                   value = 100)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       br(),  
       plotOutput("distPlot"),
       textOutput("result")
    )
  )
))
