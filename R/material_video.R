#' Create a material video container
#'
#' @param src Video path or url, if any.
#' @param width Video width in px. Should be NULL if responsive is TRUE.
#' @param height Video height in px. Should be NULL if responsive is TRUE.
#' @param responsive Whether the video is responsive. TRUE by default.
#' @param fullscreen Whether to allow full screen. Useless if responsive is TRUE.
#' 
#' @examples
#' material_video(
#'  src = "//www.youtube.com/embed/Q8TXgCzxEnw?rel=0",
#'  responsive = TRUE
#' )
#' @export
material_video <- function(src = NULL, width = NULL, height = NULL,
                           responsive = TRUE, fullscreen = TRUE) {
  
  allowfullscreen <- if (isTRUE(fullscreen)) "true"
  
  if (isTRUE(responsive)) {
    shiny::tags$video(
      class = "responsive-video",
      `controls` = "true",
      shiny::tags$source(
        src = src,
        type = "video/mp4"
      )
    )
  } else {
    
    containerTag <- shiny::tags$div(class = "video-container")
    videoTag <- shiny::tags$iframe(
      width = width,
      height = height,
      src = src,
      frameborder = "0",
      `allowfullscreen` = if (isTRUE(fullscreen)) allowfullscreen
    )
    containerTag <- shiny::tagAppendChild(containerTag, videoTag)
  }
}