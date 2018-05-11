#' Create a material icon
#'
#' @param name Icon to display. Choose here: https://materializecss.com/icons.html.
#' @param circle Whether to circle the icon. FALSE by default.
#' @param color Icon color. Use when circle is TRUE. Visit http://materializecss.com/color.html for a list of available colors.
#' @param position Icon position. NULL or "right".
#' @param closable Whether the icon is closable or not. Perfect to be insert in material_chip.
#' 
#' @examples
#' material_icon(
#'  name = "add"
#' )
#' @export
material_icon <- function(name, circle = FALSE, color = NULL,
                          position = NULL, closable = FALSE) {
  
  iconCl <- "material-icons"
  if (isTRUE(circle)) iconCl <- paste0(iconCl, " circle")
  if (!is.null(color)) iconCl <- paste(iconCl, color)
  if (!is.null(position)) iconCl <- paste(iconCl, position)
  if (isTRUE(closable)) iconCl <- paste(iconCl, " close")
  
  shiny::tags$i(
    class = iconCl,
    name
  )
}