library(shiny)

ui <- fluidPage(
  titlePanel("UNESCO World Heritage Sites Explorer"),

  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Select Category:",
                  choices = c("Cultural", "Natural", "Cultural/Natural", "Not Designated")),

      sliderInput("yearRange",
                  "Select Year Range:",
                  min = 1970,
                  max = 2023,
                  value = c(2000, 2023)),

      actionButton("update", "Update Visuals")
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Trends",
                 plotOutput("trendsPlot")),

        tabPanel("Region & Category",
                 plotOutput("regionCategoryPlot")),

        tabPanel("Top Countries",
                 tableOutput("topCountriesTable"))
      )
    )
  )
)
