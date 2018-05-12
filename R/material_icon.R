#' Create a material icon
#'
#' @param name Icon to display. Choose here: https://materializecss.com/icons.html.
#' @param circle Whether to circle the icon. FALSE by default.
#' @param color Icon color. Use when circle is TRUE. Visit http://materializecss.com/color.html for a list of available colors.
#' @param position Icon position. NULL, "right" or "left".
#' @param closable Whether the icon is closable or not. Perfect to be insert in material_chip.
#' @param size Icon size: "tiny", "small", "medium" or "large".
#' 
#' @examples
#' material_icon(
#'  name = "add"
#' )
#' @export
material_icon <- function(name, circle = FALSE, color = NULL,
                          position = NULL, closable = FALSE,
                          size = NULL) {
  
  iconCl <- "material-icons"
  if (isTRUE(circle)) iconCl <- paste0(iconCl, " circle")
  if (!is.null(color)) iconCl <- paste(iconCl, color)
  if (!is.null(position)) iconCl <- paste(iconCl, position)
  if (isTRUE(closable)) iconCl <- paste(iconCl, " close")
  if (!is.null(size)) iconCl <- paste(iconCl, size)
  
  shiny::tags$i(
    class = iconCl,
    name
  )
}