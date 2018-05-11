#' Create an horizontal loader
#'
#' @examples
#' material_loader()
#' @export
material_loader <- function() {
  shiny::tags$div(
    class = "progress",
    shiny::tags$div(
      class = "indeterminate", 
      style = "width : 70%"
    )
  )
}