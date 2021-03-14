#' Exports all charts
#'
#' @param path Path to the storage directory
#'
#' @export
publish_all_charts <- function(path = "out/") {
  export(plot = create_disease_chronology_chart(), name = "DiseaseChronologyChart", path = path)
  export(plot = create_active_cases_chart(), name = "ActiveCasesChart", path = path)
  export(plot = create_cases_piechart(), name = "CasesPieChart", path = path)
  export(plot = create_positive_tests_chart(), name = "PositiveTestsChart", path = path)

  export(plot = create_week_places_cases_chart(per100k = FALSE, facet = FALSE), name = "WeeklyPlacesCasesChart", path = path)
  export(plot = create_week_places_cases_chart(per100k = FALSE, facet = TRUE), name = "WeeklyPlacesCasesFacetedChart", path = path)
  export(plot = create_week_places_cases_chart(per100k = TRUE, facet = FALSE), name = "WeeklyPlacesCasesPer100kChart", path = path)
  export(plot = create_week_places_cases_chart(per100k = TRUE, facet = TRUE), name = "WeeklyPlacesCasesPer100kFacetedChart", path = path)
}
