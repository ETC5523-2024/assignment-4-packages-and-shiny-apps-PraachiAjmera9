# R/table_top_countries.R

#' Generate a Data Frame of Top 10 Countries with the Most World Heritage Sites
#'
#' This function generates a data frame showing the top 10 countries with the highest number of World Heritage Sites.
#'
#' @param data The cleaned heritage dataset.
#' @return A data frame of top countries.
#' @export
table_top_countries <- function(data) {
  top_countries <- data %>%
    st_drop_geometry() %>%  # Dropping the geometry column
    group_by(COUNTRY) %>%
    summarise(Total_Sites = n(), .groups = 'drop') %>%
    arrange(desc(Total_Sites)) %>%
    slice_head(n = 10)

  return(top_countries)  # Return the data frame
}
