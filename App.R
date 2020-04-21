library(shiny)

ui <- fluidPage(
  textInput("caption", "Insert DOI", "10.1080/19455224.2016.1267025"),
  verbatimTextOutput("value")
)
server <- function(input, output) {
  output$value <- renderText({ input$caption })
}
shinyApp(ui, server)