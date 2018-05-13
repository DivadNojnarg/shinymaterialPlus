#' Create an horizontal divider
#'
#' @note Perfect to insert in a card.
#' 
#' @examples
#' material_divider()
#' 
#' @export
material_divider <- function() {
  shiny::tags$div(class = "divider mt-5")
}