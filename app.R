library(shiny)
library(victoryR)

ui <- fluidPage(
  titlePanel("Victory Bar chart Example"),
  sliderInput("n", label = "Number of samples", min = 2, max = 10, value = 5),
  victoryOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderVictory({
    n_samples <- input$n
    data <- data.frame(x = seq(n_samples), y = 100*seq(n_samples), stringsAsFactors = F)
    victory(data, "x", "y", type = "Bar")
  })
}

shinyApp(ui, server)
