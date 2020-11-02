library(shiny)
library(victoryR)

ui <- fluidPage(
  titlePanel("Victory Example"),
  sliderInput("n", label = "Number of samples", min = 2, max = 1000, value = 100),
  victoryOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderVictory(
    victory(rnorm(input$n))
  )
}
shinyApp(ui, server)
