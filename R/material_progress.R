#' Create a material progress bar
#'
#' @param main_color Progress color. NULL by default. Visit http://materializecss.com/color.html for a list of available colors.
#' @param value Progress value (between 0 and 100)
#' @param secondary_color Progress secondary color. Represents the 100-value part. NULL by default. Visit http://materializecss.com/color.html for a list of available colors.
#' 
#' @examples
#' material_progress(
#'  value = "70%"
#' )
#' @export
material_progress <- function(main_color = NULL, value = "50",
                              secondary_color = NULL) {
  
  progressCl <- paste("progress", secondary_color)
  
  shiny::tags$div(
    class = progressCl,
    shiny::tags$div(
      class = paste("determinate", main_color),
      style = paste0("width: ", value, "%")
    )
  )
}