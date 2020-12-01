#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
data1 <- mtcars
data1$am <- factor(data1$am, labels = c("Automatic", "Manual"))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        expr_var <- reactive({
                paste("mpg~", input$var)
        })
        
        output$cars <- renderText({
                expr_var()
        })
        output$carsFinal <- renderPlot({
                boxplot(as.formula(expr_var()),
                        data = data1
                )
        }) 
})
