#' DNAtoPeptide UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_DNAtoPeptide_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, uiOutput(ns("DNA"))),
      column(4, shiny::numericInput(
        inputId = ns("dna_length"),
        value = 6000,
        min = 3,
        max = 100000,
        step = 3,
        label = "Random DNA length"
      ), shiny::actionButton(
        inputId = ns("generate_dna"),
        label = "Generate random DNA", style = "margin-top: 18px;"
      ))
    ),
    shiny::verbatimTextOutput(outputId = ns("peptide")) %>%
      shiny::tagAppendAttributes(style = "white-space: pre-wrap;")
  )
}

#' DNAtoPeptide Server Functions
#'
#' @noRd
mod_DNAtoPeptide_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    dna = reactiveVal()
    output$DNA = renderUI({
      textAreaInput(
        inputId = ns("DNA"),
        label = "DNA sequence",
        placeholder = "Insert DNA sequence",
        value = dna(),
        height = 100,
        width = 600
      )
    })
    observeEvent(input$generate_dna, {
      dna(
        CentralDogma::randomDNASequence(input$dna_length)
      )
    })
  })
}

## To be copied in the UI
# mod_DNAtoPeptide_ui("DNAtoPeptide_1")

## To be copied in the server
# mod_DNAtoPeptide_server("DNAtoPeptide_1")
