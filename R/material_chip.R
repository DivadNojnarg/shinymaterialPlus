#' Create a material badge (chip)
#'
#' @param Any element such as material_icon...
#' @param src Image path or url, if any.
#' @param chip_name Chip name.
#' 
#' @examples
#' material_chip(
#'  src = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-1.png",
#'  chip_name = "John Doe",
#'  material_icon("close")
#' )
#' @export
material_chip <- function(..., src = NULL, chip_name = NULL) {
  shiny::tags$div(
    class = "chip",
    shiny::tags$img(src = src),
    chip_name,
    ...
  )
}