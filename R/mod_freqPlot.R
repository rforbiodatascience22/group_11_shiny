#' freqPlot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_freqPlot_ui <- function(id){
  ns <- NS(id)
  tagList(
    textAreaInput(
      inputId = ns("peptide"),
      label = "Peptide sequence",
      width = 300,
      height = 100,
      placeholder = "Insert peptide sequence"
    ),
    plotOutput(
      outputId = ns("abundance")
    )
  )
}

#' freqPlot Server Functions
#'
#' @noRd
mod_freqPlot_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance = renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide %>%
          stringr::str_replace_all("\\*", "") %>%
          CentralDogma::plotFrequencies() +
          ggplot2::theme(legend.position = "none")
      }
    })
  })
}

## To be copied in the UI
# mod_freqPlot_ui("freqPlot_1")

## To be copied in the server
# mod_freqPlot_server("freqPlot_1")
