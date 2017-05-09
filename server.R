library(shiny)

#source the DataProcessing.R file
source("DataProcessing.R")

# Shiny server
shinyServer(
        function(input, output){
                
                #reactive function to get the 'horsepower' slider input
                data <- reactive({
                        hpfunc(cardata, input$horsepower[1], input$horsepower[2]) 
                })
                
                #render plot (Weight-MPG City)
                output$CityWeightMPG <- renderPlot({
                        ggplotfuncCity(data())
                })
                
                #render plot (Weight-MPG Highway)
                output$HighwayWeightMPG <- renderPlot({
                        ggplotfuncHighway(data())
                })
        })
