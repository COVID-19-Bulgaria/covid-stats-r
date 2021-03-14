#' Bulgaria latest cases
#'
#' @export
latest_totals_dataset <- rjson::fromJSON(file = "https://raw.githubusercontent.com/COVID-19-Bulgaria/covid-database/master/Bulgaria/TotalsDataset.json")

#' Bulgaria date cases dataset
#'
#' @export
date_cases_dataset <- rjson::fromJSON(file = "https://raw.githubusercontent.com/COVID-19-Bulgaria/covid-database/master/Bulgaria/DateCasesDataset.json")

#' Bulgaria active cases dataset
#'
#' @export
active_cases_dataset <- rjson::fromJSON(file = "https://raw.githubusercontent.com/COVID-19-Bulgaria/covid-database/master/Bulgaria/DateActiveCasesDataset.json")

#' Bulgaria positive tests dataset
#'
#' @export
positive_tests_dataset <- rjson::fromJSON(file = "https://raw.githubusercontent.com/COVID-19-Bulgaria/covid-database/master/Bulgaria/DatePositiveTestsDataset.json")

#' Bulgaria week places cases dataset
#'
#' @export
week_places_cases_dataset <- read.csv(file = "https://raw.githubusercontent.com/COVID-19-Bulgaria/covid-database/master/Bulgaria/WeekPlacesCasesDataset.csv")

#' Custom Bulgaria grid used by geofacet
bulgaria_grid <- read.csv(file = "./assets/BulgariaGrid.csv", na = "", stringsAsFactors = FALSE)

#' Constucts a date cases dataframe
#'
#' @return data frame
create_date_cases_dataframe <- function(dataset) {
  date_cases_dataframe <- as.matrix(dataset)

  date_cases_dataframe <- cbind(
    rownames(date_cases_dataframe),
    data.frame(date_cases_dataframe, row.names = NULL)
  )
  colnames(date_cases_dataframe) <- c("Date", "Cases")

  date_cases_dataframe$Date <- as.Date(date_cases_dataframe$Date)
  date_cases_dataframe$Cases <- sapply(date_cases_dataframe$Cases, as.numeric)

  return(date_cases_dataframe)
}

#' Constructs a date percentage data frame
#'
#' @return data frame
create_date_percentage_dataframe <- function(dataset) {
  date_percentage_dataframe <- as.matrix(dataset)

  date_percentage_dataframe <- cbind(
    rownames(date_percentage_dataframe),
    data.frame(date_percentage_dataframe, row.names = NULL)
  )
  colnames(date_percentage_dataframe) <- c("Date", "Percentage")

  date_percentage_dataframe$Date <- as.Date(date_percentage_dataframe$Date)
  date_percentage_dataframe$Percentage <- sapply(date_percentage_dataframe$Percentage, as.numeric)

  return(date_percentage_dataframe)
}

#' Constructs a theme with common configurations used for the project charts.
#'
#' @return ggplot2 theme
common_chart_theme <- function() {
  theme <- ggplot2::theme_light() +
    ggplot2::theme(
      text = ggplot2::element_text(family = "Verdana", size = 14),
      plot.title = ggplot2::element_text(hjust = 0.5, color = "#4e73df", face = "bold"),
      axis.title = ggplot2::element_text(color = "#4e73df"),
      strip.background = ggplot2::element_rect(fill = "#4e73df", color = "#4e73df"),
      legend.position = "top",
      panel.grid.minor = ggplot2::element_blank()
    )

  return(theme)
}

#' Exports a plot as an image.
#'
#' @param plot The plot to be exported
#' @param name Name of the exported image file
#' @param ext Image file extension
#' @param width Width of the exported image
#' @param height Height of the exported image
#'
#' @export
export <- function(plot, name, ext = ".svg", width = 16, height = 9) {
  message(paste0("Start exporting plot ", name, ext, "..."))
  ggplot2::ggsave(
    file = paste0("out/", name, ext),
    plot = plot,
    width = width,
    height = height
  )
}
