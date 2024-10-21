# R/plot_region_category.R

#' Plot Number of Heritage Sites by Region and Category
#'
#' This function creates a horizontal bar plot showing the number of World Heritage Sites by region and category.
#'
#' @param heritage_clean The cleaned heritage dataset.
#' @return A ggplot object showing the distribution of sites by region and category.
#' @export
plot_region_category <- function(data = heritage_clean) {
  region_catfin_summary <- data %>%
    group_by(REGION, CATFIN_FULL) %>%
    summarise(count = n(), .groups = 'drop')

  p <- ggplot(region_catfin_summary, aes(x = count, y = REGION, fill = CATFIN_FULL)) +
    geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
    scale_x_log10() +
    labs(title = "Number of Heritage Sites by Region and Category",
         x = "Number of Sites",
         y = "Region",
         fill = "Category") +
    theme_minimal()

  print(p)  # Explicitly print the plot to ensure it renders
}
