library(shiny)

ui <- fluidPage(
  titlePanel("What Am I Missing? A tool that shows the collective references and citations for a group of articles."),
  textAreaInput("dois", "Insert DOIs", rows = 5, value = "10.1080/19455224.2016.1267025"),
  actionButton(inputId = "go", label = "Update"),
  textOutput("shared_references"),
  textOutput("shared_citations")
)

server <- function(input, output) {
  dois <- eventReactive(input$go, input$dois)
  
  # Segment dois from long list (is there a better way to do input that respects line breaks?)
  
  # Look up references for each doi
  
  # Look up citations for each doi
  
  # Flag any dois where reference or citation data isn't available
  
  # Remove dois which were in the input
  
  # Compute output lists
  
  # Present outputs
  # multiple lines: https://stackoverflow.com/questions/23233497/outputting-multiple-lines-of-text-with-rendertext-in-r-shiny
  
  output$shared_references <- renderText(dois())
  output$shared_citations <- renderText(dois())
}

shinyApp(ui, server)