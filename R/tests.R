#' @importFrom magrittr %>%
NULL

#' Export positive tests chart
#'
#' @export
create_positive_tests_chart <- function() {
  positive_tests <- create_date_percentage_dataframe(positive_tests_dataset)

  options(repr.plot.width = 16, repr.plot.height = 9)

  positive_tests %>%
    ggplot2::ggplot(ggplot2::aes(x = Date, y = Percentage)) +
    ggplot2::geom_bar(stat = "identity", fill = "#4e73df") +
    common_chart_theme() +
    ggplot2::scale_x_date(
      breaks = seq(min(positive_tests$Date), max(positive_tests$Date), by = "month"),
      date_labels = "%m.%Y"
    ) +
    ggplot2::ggtitle("Положителни тестове") +
    ggplot2::xlab("Дата") +
    ggplot2::ylab("Процент")
}
