#' Create a material scrollpsy
#'
#' @param ... Slot for material_scrollpsy_item.
#' 
#' @examples
#' material_scrollpsy(
#'  material_scrollpsy_item(target = "part1"),
#'  material_scrollpsy_item(target = "part2"),
#'  material_scrollpsy_item(target = "part3")
#' )
#' @export
material_scrollpsy <- function(...) {
  shiny::tags$div(
    class = "col hide-on-small-only m3 l2",
    shiny::tags$ul(
      class = "section table-of-contents",
      ...
    )
  )
}


#' Create a material table of content item
#'
#' @param target id element to target. The target should be wrap in a div(id = ..., ).
#' 
#' @export
material_scrollpsy_item <- function(target = NULL) {
  shiny::tags$li(
    #class = if (isTRUE(active)) "active" else NULL,
    shiny::tags$a(href = paste0("#", target), target)
  )
}