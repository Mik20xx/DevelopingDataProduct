#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

library(datasets)

data1 <- mtcars
data1$am <- factor(data1$am, labels = c("Automatic", "Manual"))

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("scatterplot of Motor Car Tests"),
        
        # Sidebar with a slider input for number of bins 
        sidebarLayout(
                sidebarPanel(
                        h2("Select the variable"),
                        selectInput("var","variable:", 
                                    c("Transmission"="am",
                                      "Cylinder"="cyl"
                                    ))
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        h2(textOutput("cars")),
                        plotOutput("carsFinal")
                )
        )
))