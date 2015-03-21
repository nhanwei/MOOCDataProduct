
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(navbarPage("My Shiny App",
        tabPanel("README",
            headerPanel("Introduction to my Shiny App"),
                mainPanel(p("In this app, pretend that you are the operational manager of WacDonald's Restaurant."),
                        p("One of your job is to keep track of the sales of food item everyday. 
                          You decided to come up with this Shiny app to display the data in a neat way."),
                        p("The input for this Shiny app is the ", strong("Operational Date"), " while the output are some graphs.")
                        )),
        tabPanel("Application",
            sidebarLayout(
                 sidebarPanel(
                     selectInput("select", label = h3("Select Date"), 
                                     choices = list("23-01-2015" = 1, "24-01-2015" = 2, "25-01-2015" = 3), 
                                     selected = 1),submitButton('Submit')
                            ),
                 mainPanel(
                     plotOutput("newPlot")
                )
            )
        )
)

)
