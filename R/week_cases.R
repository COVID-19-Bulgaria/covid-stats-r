#' @importFrom magrittr %>%
NULL

#' Creates week places cases chart.
#'
#' @param per100k Whether to use per 100000 cases values
#' @param facet Whether to facet the chart
#'
#' @export
create_week_places_cases_chart <- function(per100k = FALSE, facet = FALSE) {
  data <- week_places_cases_dataset
  data$date <- ISOweek::ISOweek2date(paste0(data$year, "-W", formatC(data$week, width = 2, flag = "0"), "-7"))

  data_point <- ifelse(per100k, "infected_avg_100k", "infected_avg")

  last_week_ordered <- data %>%
    dplyr::group_by(place) %>%
    dplyr::filter(date == max(date)) %>%
    dplyr::arrange(!!rlang::sym(data_point))

  data$place <- factor(data$place, levels = last_week_ordered$place)

  line_colors <- c("#7f0000", "#006400", "#808000", "#483d8b", "#3cb371", "#bc8f8f", "#008b8b", "#cd853f", "#4682b4", "#9acd32", "#00008b", "#800080", "#b03060", "#ff0000", "#ffa500", "#ffff00", "#7fff00", "#8a2be2", "#00ff7f", "#00ffff", "#0000ff", "#ff00ff", "#1e90ff", "#cccccc", "#000000", "#ff1493", "#ee82ee")
  line_colors <- sample(line_colors, length(line_colors))

  plot <- data %>%
    ggplot2::ggplot(
      ggplot2::aes(
        x = date,
        y = !!rlang::sym(data_point),
        group = place,
        color = place,
        label = sprintf("%s (%d)", place, !!rlang::sym(data_point))
      )
    ) +
    ggplot2::geom_line(
      mapping = ggplot2::aes(size = ifelse(!(place %in% c("София", "Пловдив", "Варна", "Бургас")),
                                           ifelse(facet, "B", "A"),
                                           "B"))
    ) +
    ggplot2::guides(color = FALSE) +
    common_chart_theme() +
    ggplot2::scale_color_manual(values = line_colors) +
    ggplot2::scale_size_manual(values = c(0.8, 1.1), guide = FALSE)

  if (per100k) {
    plot <- plot +
      ggplot2::ggtitle("Седмична заболеваемост по области (нови случай на 100 хил.)") +
      ggplot2::ylab("Нови случаи на 100 хил.")
  } else {
    plot <- plot +
      ggplot2::ggtitle("Нови случаи по области") +
      ggplot2::ylab("Нови случаи (средно)")
  }

  if (facet) {
    plot <- plot +
      geofacet::facet_geo(~ place, grid = bulgaria_grid, scales = "free_y") +
      ggplot2::scale_x_date(date_labels = "%m", date_breaks = "1 month") +
      ggplot2::xlab("Месец") +
      ggplot2::theme(
        axis.text.x = ggplot2::element_text(vjust = 0.5, hjust = 0.5, size = ggplot2::rel(0.8))
      )
  } else {
    plot <- plot +
      ggplot2::xlab("Седмица") +
      ggplot2::theme(
        axis.text.x = ggplot2::element_text(angle = 60, vjust = 1, hjust = 1)
      ) +
      ggplot2::scale_x_date(
        breaks = seq(min(data$date), max(data$date), by = "week"),
        date_labels = "%d.%m (%V)",
        expand = ggplot2::expansion(mult = c(0, 0.20))
      ) +
      ggplot2::scale_y_continuous(labels = scales::label_number_si()) +
      ggrepel::geom_text_repel(
        data = data %>%
          dplyr::filter(date == utils::tail(data$date, n = 1)),
        seed = 42,
        size = 4,
        family = "Verdana",
        nudge_x = 10,
        hjust = 0,
        direction = "y",
        point.padding = NA,
        box.padding = ggplot2::unit(0.17, units = "line"),
        max.overlaps = Inf,
        min.segment.length = ifelse(per100k, 0, Inf),
        max.time = 1,
        max.iter = 100000,
        show.legend = FALSE
      )
  }

  return(plot)
}
