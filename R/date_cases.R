#' @importFrom magrittr %>%
NULL

#' Creates a disease chronology chart
#'
#' @export
create_disease_chronology_chart <- function() {
  infected <- create_date_cases_dataframe(date_cases_dataset$infected)
  cured <- create_date_cases_dataframe(date_cases_dataset$cured)
  fatal <- create_date_cases_dataframe(date_cases_dataset$fatal)

  combined <- infected %>% dplyr::mutate(Type = "Infected") %>%
    dplyr::bind_rows(cured %>% dplyr::mutate(Type = "Cured")) %>%
    dplyr::bind_rows(fatal %>% dplyr::mutate(Type = "Fatal"))

  combined %>%
    ggplot2::ggplot(ggplot2::aes(x=Date, y=Cases, color=Type)) +
    ggplot2::geom_line(size = 2) +
    common_chart_theme() +
    ggplot2::scale_color_manual(
      name = NULL,
      breaks = c("Infected", "Cured", "Fatal"),
      labels = c(Infected = "Заразени", Cured = "Излекувани", Fatal = "Жертви"),
      values = c(Infected = "#f6c23e", Cured = "#1cc88a", Fatal = "#e74a3b")
    ) +
    ggplot2::scale_x_date(
      breaks = seq(min(combined$Date), max(combined$Date), by = "month"),
      date_labels = "%m.%Y"
    ) +
    ggplot2::scale_y_continuous(labels = scales::label_number_si()) +
    ggplot2::ggtitle("Хронология на заразата") +
    ggplot2::xlab("Дата") +
    ggplot2::ylab("Брой случаи")
}

#' Creates active cases chart
#'
#' @export
create_active_cases_chart <- function() {
  active <- create_date_cases_dataframe(active_cases_dataset$active)

  active %>%
    ggplot2::ggplot(ggplot2::aes(x = Date, y = Cases)) +
    ggplot2::geom_area(color = "#f6c23e", fill = "#f6c23e", alpha = 0.4) +
    common_chart_theme() +
    ggplot2::scale_x_date(
      breaks = seq(min(active$Date), max(active$Date), by = "month"),
      date_labels = "%m.%Y"
    ) +
    ggplot2::ggtitle("Активни случаи") +
    ggplot2::xlab("Дата") +
    ggplot2::ylab("Брой случаи")
}

#' Create cases pie chart
#'
#' @export
create_cases_piechart <- function() {
  total <- latest_totals_dataset$infected
  cured <- latest_totals_dataset$cured
  fatal <- latest_totals_dataset$fatal
  active <- total - cured - fatal

  active_proportion <- active / total
  cured_proportion <- cured / total
  fatal_proportion <- fatal / total

  data <- data.frame(
    group = c("Активни случаи", "Излекувани", "Жертви"),
    value = c(active_proportion, cured_proportion, fatal_proportion),
    stringsAsFactors = FALSE
  )

  data <- data %>%
    dplyr::mutate(group = factor(x = group, levels = group),
           label = factor(x = value, levels = value))

  ggplot2::ggplot(data, ggplot2::aes(x="", y=value, fill=group)) +
    ggplot2::geom_bar(stat="identity", width=1, color="white") +
    ggplot2::coord_polar("y", start=0) +
    ggplot2::geom_text(
      ggplot2::aes(label = paste0(round(value*100), "%"), x = 1.3),
      color = "white",
      position = ggplot2::position_stack(vjust = 0.5)
    ) +
    ggplot2::scale_fill_manual(values=c("#f6c23e", "#1cc88a", "#e74a3b")) +
    ggplot2::theme_classic() +
    ggplot2::theme(
      text = ggplot2::element_text(family = "Verdana", size = 14),
      plot.title = ggplot2::element_text(hjust = 0.5, color = "#4e73df", face = "bold"),
      axis.line = ggplot2::element_blank(),
      axis.text = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank()
    ) +
    ggplot2::labs(
      x = NULL,
      y = NULL,
      fill = NULL,
      title = "Процентно съотношение на случаите"
    )
}
