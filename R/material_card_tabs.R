#' Create a slot for a card tab content
#'
#' UI content can be placed in cards.
#' @param ... Slot for any UI element.
#' @param id Tag id. Should be unique and correspond to the id provided in material_tabs.
#' @examples
#' material_card_tabs(
#'  id = "tab_1"
#'  "Content"
#' )
#' @export
material_card_tabs <- function(..., id) {
  stopifnot(!is.null(id))
  shiny::tags$div(
    id = id,
    ...
  )
}