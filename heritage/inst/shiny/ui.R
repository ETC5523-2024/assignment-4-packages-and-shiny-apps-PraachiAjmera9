library(shiny)
library(heritage)  # Make sure your package is installed and loaded
library(dplyr)
library(shinythemes)


# UI Layout
ui <- fluidPage(
  theme = shinytheme("cerulean"),  # Add custom theme for styling

  titlePanel("UNESCO World Heritage Sites Explorer"),

  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Select Category:",
                  choices = c("Cultural", "Natural", "Cultural/Natural", "Not Designated")),
      helpText("Select a category of World Heritage Sites."),

      sliderInput("yearRange",
                  "Select Year Range:",
                  min = 1990,
                  max = 2023,
                  value = c(2000, 2023)),
      helpText("Select a range of years for site inscriptions."),

      actionButton("update", "Update Visuals"),
      helpText("Click 'Update Visuals' to refresh the plots and table based on your selections.")
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Trends",
                 plotOutput("trendsPlot"),
                 helpText("This plot shows the number of World Heritage Sites inscribed each year by region. The trends indicate changes in inscriptions over time.")),

        tabPanel("Region & Category",
                 plotOutput("regionCategoryPlot"),
                 helpText("This plot displays the number of heritage sites by region and category. Use the log scale to compare regions with significantly different numbers of sites.")),

        tabPanel("Top Countries",
                 tableOutput("topCountriesTable"),
                 helpText("This table shows the top 10 countries with the most World Heritage Sites, based on your selected category and year range."))
      )
    )
  )
)
