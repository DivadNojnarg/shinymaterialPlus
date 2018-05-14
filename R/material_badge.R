#' Create a badge
#'
#' UI content that can be placed everywhere
#' @param content Badge content.
#' @param type Badge type. NULL by default, can be set as "new".
#' @param color Badge color. NULL by default. Visit http://materializecss.com/color.html for a list of available colors.
#' @param custom_caption Whether to enable custom captions or not. FALSE by default.
#' @examples
#' material_badge(
#'  content = "1",
#'  type = "new"
#' )
#' @export
material_badge <- function(content = NULL, type = NULL, color = NULL,
                           custom_caption = FALSE) {
  cl <- "badge"
  if (!is.null(type)) cl <- paste(type, cl)
  if (!is.null(color)) cl <- paste(cl, color)
  
  shiny::tags$span(
    class = cl, 
    `data-badge-caption` = if (isTRUE(custom_caption)) "custom caption" else NULL,
    content
  )
}
