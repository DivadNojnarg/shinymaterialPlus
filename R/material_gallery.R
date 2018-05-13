#' Create a material gallery
#'
#' @param ... Slot for material_gallery_item.
#' 
#' @examples
#' material_gallery(
#'  material_gallery_item(
#'   src = "https://pixinvent.com/materialize-material-design-admin-template/images/gallary/22.png",
#'   "A beautiful image"
#'  ),
#'  material_gallery_item(
#'   src = "https://cdn.dribbble.com/users/329207/screenshots/3761869/bemocs_rei_labor_day_dribbble.jpg",
#'   "Another beautiful image"
#'  ),
#'  material_gallery_item(
#'   src = "https://img00.deviantart.net/2cb5/i/2017/048/a/4/blue_mountain_by_jordangrimmer-dazetlq.jpg",
#'   "Yet another beautiful image"
#'  )
#' )
#' @export
material_gallery <- function(...) {
  shiny::tags$div(
    class = "slider",
    shiny::tags$ul(
      class = "slides",
      ...
    )
  )
}


#' Create a material gallery item
#'
#' @param ... Slot for any UI element.
#' @param src Image path or url, if any.
#' 
#' @export
material_gallery_item <- function(..., src = NULL) {
  shiny::tags$li(
    shiny::tags$img(src = src),
    shiny::tags$div(class = "caption center-align", ...)
  )
}