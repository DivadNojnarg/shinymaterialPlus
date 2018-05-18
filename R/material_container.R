#' Create a material container div
#'
#' To center elements inside
#' @param ... Any UI element.
#' @examples
#' material_container(
#'  material_card(
#'   title = "Example Card",
#'   depth = 5,
#'   shiny::tags$h5("Card Content")
#'  )
#' )
#' @export
material_container <- function(...) {
  shiny::tags$div(class = "container", ...)
} 