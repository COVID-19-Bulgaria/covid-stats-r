#' Exports all charts
#'
#' @export
publish_all_charts <- function() {
  export(plot = create_disease_chronology_chart(), name = "DiseaseChronologyChart")
  export(plot = create_active_cases_chart(), name = "ActiveCasesChart")
  export(plot = create_cases_piechart(), name = "CasesPieChart")
  export(plot = create_positive_tests_chart(), name = "PositiveTestsChart")

  export(plot = create_week_places_cases_chart(per100k = FALSE, facet = FALSE), name = "WeeklyPlacesCasesChart")
  export(plot = create_week_places_cases_chart(per100k = FALSE, facet = TRUE), name = "WeeklyPlacesCasesFacetedChart")
  export(plot = create_week_places_cases_chart(per100k = TRUE, facet = FALSE), name = "WeeklyPlacesCasesPer100kChart")
  export(plot = create_week_places_cases_chart(per100k = TRUE, facet = TRUE), name = "WeeklyPlacesCasesPer100kFacetedChart")
}
