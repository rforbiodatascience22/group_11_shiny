#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom magrittr %>%
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_freqPlot_server("freqPlot_1")
  mod_DNAtoPeptide_server("DNAtoPeptide_1")
}
