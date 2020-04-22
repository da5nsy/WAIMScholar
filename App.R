library(shiny)
library(jsonlite)

ui <- fluidPage(
  titlePanel("What Am I Missing? A tool that shows the collective references and citations for a group of articles."),
  textAreaInput("dois", "Insert DOIs", rows = 5, value = "10.1186/1756-8722-6-59"),
  actionButton(inputId = "go", label = "Update"),
  textOutput("shared_references"),
  textOutput("shared_citations")
)

server <- function(input, output) {
  dois <- eventReactive(input$go, input$dois)
  
  # Segment dois from long list (is there a better way to do input that respects line breaks?)
  
  # Look up references for each doi
  # e.g. hadley_orgs <- fromJSON("https://opencitations.net/index/api/v1/references/10.1002/adfm.201505328")
  refs <- reactive({
    fromJSON(paste("https://opencitations.net/index/api/v1/references/",dois(),sep = ""))
  })
  
  # Look up citations for each doi
  # e.g. hadley_orgs <- fromJSON("https://opencitations.net/index/api/v1/citations/10.1002/adfm.201505328")
  
  # Flag any dois where reference or citation data isn't available
  
  # Remove dois which were in the input
  
  # Compute output lists
  
  # Present outputs
  # multiple lines: https://stackoverflow.com/questions/23233497/outputting-multiple-lines-of-text-with-rendertext-in-r-shiny
  
  output$shared_references <- renderText(dois())
  output$shared_citations <- renderText(dois())
}

shinyApp(ui, server)