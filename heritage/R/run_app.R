# R/launch_app.R

#' Launch the Shiny App
#'
#' This function launches the Shiny app that lets users explore the World Heritage Sites dataset.
#'
#' @export
launch_app <- function() {
  app_dir <- system.file("shiny", package = "heritage")
  if (app_dir == "") {
    stop("Could not find Shiny app directory. Try re-installing `heritage`.", call. = FALSE)
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
