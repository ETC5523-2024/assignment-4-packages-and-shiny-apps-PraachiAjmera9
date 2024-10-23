library(shiny)
library(heritage)  # Make sure your package is installed and loaded
library(dplyr)
library(shinythemes)

# Server logic
server <- function(input, output) {

  # Reactive data filtering based on input
  filteredData <- reactive({
    heritage_clean %>%
      filter(CATFIN_FULL == input$category,
             DATEINSCRI >= input$yearRange[1],
             DATEINSCRI <= input$yearRange[2])
  })

  # Render the trends plot using your custom function
  output$trendsPlot <- renderPlot({
    plot_trends(data = filteredData())
  })

  # Render the region and category distribution plot using your custom function
  output$regionCategoryPlot <- renderPlot({
    plot_region_category(data = filteredData())
  })

  # Render the table of top countries based on filtered data
  output$topCountriesTable <- renderTable({
    heritage::table_top_countries(data = filteredData())  # Pass filtered data here
  }, sanitize.text.function = identity)

}
