library(shiny)
shinyUI(fluidPage(
        titlePanel("Car Data Visualizer"),
        sidebarLayout(
                sidebarPanel(
                        #horsepower slider
                        sliderInput("horsepower",
                                    "Horsepower:",
                                    min = 55,
                                    max = 300,
                                    value = c(55, 300))
                        ),
                mainPanel(
                        tabsetPanel(
                                #tab for charts
                                tabPanel(p(icon("line-chart"), "Visualize Data"),
                                         h4("Car Weight and MPG in City", align = "center"),
                                         plotOutput("CityWeightMPG"),
                                         h4("Car Weight and MPG on Highway", align = "center"),
                                         plotOutput("HighwayWeightMPG")
                                         ),
                                #'AboutApp' tab
                                tabPanel("About App",
                                         mainPanel(
                                                 includeMarkdown("AboutApp.md")
                                                 )
                                         ),
                                #'AboutData' tab
                                tabPanel("About Data",
                                         mainPanel(
                                           includeMarkdown("AboutData.md")
                                         )
                                )
                                )
                        )
                )
        )
)