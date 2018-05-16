#' Create a material scrollspy
#'
#' @param ... Slot for material_scrollspy_item.
#' 
#' @examples
#' material_scrollspy(
#'  material_scrollspy_item(target = "part1"),
#'  material_scrollspy_item(target = "part2"),
#'  material_scrollspy_item(target = "part3")
#' )
#' @export
material_scrollspy <- function(...) {
  shiny::tags$div(
    class = "col hide-on-small-only m3 l2",
    shiny::tags$div(
      class = "toc-wrapper pinned",
      style = "top: 400px;",
      shiny::tags$ul(
        style = "top: 200px;",
        class = "section table-of-contents",
        ...
      )
    )
  )
}


#' Create a material scrollspy item
#'
#' @param target id element to target. The target should be wrap in a div(id = ..., ).
#' 
#' @export
material_scrollspy_item <- function(target = NULL) {
  shiny::tags$li(
    shiny::tags$a(href = paste0("#", target), target)
  )
}