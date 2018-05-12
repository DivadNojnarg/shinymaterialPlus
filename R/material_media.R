#' Create a material media container
#'
#' @param src Media path or url, if any.
#' @param width media width in px. Should be NULL if responsive is TRUE.
#' 
#' @examples
#' material_media(
#'  src = "https://materializecss.com/images/sample-1.jpg",
#'  width = "650"
#' )
#' @export
material_media <- function(src = NULL, width = NULL) {
  
  mediaTag <- shiny::tags$img(
    class = "materialboxed",
    width = width,
    src = src
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(
          system.file(file.path("js", "media.js"), package = "shinymaterialPlus")
        )
      )
    ),
    mediaTag
  )
  
}