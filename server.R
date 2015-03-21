
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
Price <- c(2.95, 1.49, 3.5, 2.95, 1.99, 1.99)
Cost <- c(1.7, 1.1, 1.8, 1.1, 1.6, 1.5)
Day1 <- c(20, 18, 25, 19, 17, 20)
Day2 <- c(18, 25, 19, 17, 20, 24)
Day3 <- c(22, 31, 11, 23, 18, 20)
Sold <- data.frame(Day1=Day1, Day2 = Day2, Day3= Day3)
shinyServer(function(input, output) {
  output$newPlot <- renderPlot({
    SubTotals <- Sold[,as.numeric(input$select)]*Price
    par(mfrow=c(2,1))
    barplot(SubTotals, yaxt="n", xlab="Food Item", ylab="Sub-Total", main="Total Revenue Received from each Food Items")
    axis(2, at=axTicks(2), labels=sprintf("$%s", axTicks(2)))
    axis(1, c(0.7,1.9,3.1,4.3,5.5,6.7), c("WacFish", "WacNuggets", "Soft Drinks", "Fries", "Corn Cup", "Big Wac"))
    barplot(Sold[,as.numeric(input$select)], xlab="Food Item", ylab="Quantity Sold", main= " Quantity Sold for each Food Items")
    axis(1, c(0.7,1.9,3.1,4.3,5.5,6.7), c("WacFish", "WacNuggets", "Soft Drinks", "Fries", "Corn Cup", "Big Wac"))
  }, height=600, width=600)

})
