#' Create a material blockquote
#'
#' @param ... Any element, such as text.
#' 
#' @examples
#' material_blockquote(
#'  "This is an example quotation that uses the blockquote tag."
#' )
#' @export
material_blockquote <- function(...) {
  shiny::tags$blockquote(...)
}