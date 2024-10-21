# R/plot_trends.R

#' Plot Trends in World Heritage Site Inscriptions by Region
#'
#' This function creates a time series plot showing the number of World Heritage Sites inscribed each year by region.
#'
#' @param heritage_clean The cleaned heritage dataset.
#' @return A ggplot object showing the trends.
#' @export
plot_trends <- function(data = heritage_clean) {
  heritage_count <- data %>%
    filter(!is.na(DATEINSCRI)) %>%
    group_by(DATEINSCRI, REGION) %>%
    summarise(count = n(), .groups = 'drop')

  heritage_count <- heritage_count %>%
    mutate(REGION = recode(REGION,
                           "Latin America and the Caribbean" = "Latin America and Caribbean"))

  p2 <- ggplot(heritage_count, aes(x = as.numeric(DATEINSCRI), y = count)) +
    geom_line(color = "black", size = 0.8) +
    geom_smooth(method = "loess", color = "darkred") +
    facet_wrap(~ REGION, ncol = 3) +
    scale_y_log10() +
    labs(title = "Number of Heritage Sites Inscribed Each Year by Region",
         x = "Year",
         y = "Number of Sites") +
    theme_minimal()

  print(p2)
}
