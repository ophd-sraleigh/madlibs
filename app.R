library(shiny)

generate_story <- function(noun, verb, adjective, adverb) {
  glue::glue(
    "
    Once upon a time, there was a {adjective} {noun} who loved to
    {verb} {adverb}. It was the funniest thing ever!
  "
  )
}

ui <- fluidPage(
  titlePanel("Mad Libs Game"),
  sidebarLayout(
    sidebarPanel(
      textInput("noun1", "Enter a noun:", "[enter text]"),
      textInput("verb", "Enter a verb:", "[enter text]"),
      textInput("adjective", "Enter an adjective:", "[enter text]"),
      textInput("adverb", "Enter an adverb:", "[enter text]")
    ),
    mainPanel(
      h3("Your Mad Libs Story:"),
      textOutput("story")
    )
  )
)

server <- function(input, output) {
  output$story <- renderText({
    generate_story(input$noun1, input$verb, input$adjective, input$adverb)
  })
}

shinyApp(ui = ui, server = server)
