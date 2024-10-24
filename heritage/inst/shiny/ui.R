library(shiny)
library(heritage)  # Make sure your package is installed and loaded
library(dplyr)
library(shinydashboard)


ui <- dashboardPage(

  # Dashboard Header
  dashboardHeader(title = "UNESCO Heritage Explorer"),

  # Sidebar
  dashboardSidebar(
    sidebarMenu(
      menuItem("Trends", tabName = "trends", icon = icon("chart-line")),
      menuItem("Region & Category", tabName = "region_category", icon = icon("globe")),
      menuItem("Top Countries", tabName = "top_countries", icon = icon("flag")),
      hr(),
      selectInput("category", "Select Category:",
                  choices = c("Cultural", "Natural", "Cultural/Natural", "Not Designated")),
      sliderInput("yearRange",
                  "Select Year Range:",
                  min = 1990,
                  max = 2023,
                  value = c(2000, 2023)),
      actionButton("update", "Update Visuals", icon = icon("sync"))
    )
  ),

  # Body content for each tab
  dashboardBody(
    tabItems(
      # First tab content for Trends
      tabItem(tabName = "trends",
              fluidRow(
                box(title = "Trends in Heritage Sites", width = 12, solidHeader = TRUE,
                    status = "primary", plotOutput("trendsPlot")),
                helpText("This plot shows the number of World Heritage Sites inscribed each year by region.")
              )
      ),

      # Second tab content for Region & Category
      tabItem(tabName = "region_category",
              fluidRow(
                box(title = "Heritage Sites by Region and Category", width = 12, solidHeader = TRUE,
                    status = "success", plotOutput("regionCategoryPlot")),
                helpText("This plot displays the number of heritage sites by region and category.")
              )
      ),

      # Third tab content for Top Countries
      tabItem(tabName = "top_countries",
              fluidRow(
                box(title = "Top 10 Countries with Most Heritage Sites", width = 12, solidHeader = TRUE,
                    status = "info", tableOutput("topCountriesTable")),
                helpText("This table shows the top 10 countries with the most World Heritage Sites based on the selected category and year range.")
              )
      )
    )
  )
)
