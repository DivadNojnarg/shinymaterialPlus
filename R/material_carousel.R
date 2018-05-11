#' Create a material carousel
#'
#' @param ... slot for material_carousel_item.
#' @param slider Whether to display a slider or not. FALSE by default.
#' @param slider_position Slider position, only if slider is TRUE.
#'
#' @examples
#' material_carousel(
#'  material_carousel_item(
#'   src = "https://cdn4.buysellads.net/uu/1/3386/1525211184-62491.png"
#'  ),
#'  material_carousel_item(
#'   fixed = TRUE,
#'   src = "https://cdn4.buysellads.net/uu/1/3386/1525211184-62491.png"
#'  )
#' )
#' @export
material_carousel <- function(..., slider = FALSE, slider_position = NULL) {
  
  carouselCl <- "carousel"
  if (isTRUE(slider)) carouselCl <- paste0(carouselCl, " carousel-slider")
  if (!is.null(slider_position)) carouselCl <- paste0(carouselCl, " center")
  
  carouselTag <- shiny::tags$div(
    class = carouselCl,
    ...
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        if (isTRUE(slider)) {
          shiny::tags$script(
            system.file(file.path("js", "carousel-slider.js"), package = "shinymaterialPlus")
          )
        } else {
          shiny::tags$script(
            system.file(file.path("js", "carousel.js"), package = "shinymaterialPlus")
          )
        }
      )
    ),
    carouselTag
  )
  
}




#' Create a material carousel item
#'
#' @param ... any element. Only if enable_content is TRUE. 
#' @param src Image path or url.
#' @param enable_content Whether to enable content or not. FALSE by default.
#' @param title Item title. Only if enable_content is TRUE.
#' @param color Item color. Only available when enable_content is TRUE. Visit http://materializecss.com/color.html for a list of available colors.
#' @param fixed Whether to fix the content or not. FALSE by default.
#'
#' @export
material_carousel_item <- function(..., src = NULL, enable_content = FALSE, 
                                   title = NULL, color = NULL,
                                   fixed = FALSE) {
  
  if (!isTRUE(enable_content)) {
    shiny::tags$a(
      class = "carousel-item",
      href = "#!",
      shiny::tags$img(src = src)
    )
  } else {
    carouselItemCl <- "carousel-item white-text"
    if (!is.null(color)) carouselItemCl <- paste(carouselItemCl, color)
    if (isTRUE(fixed)) carouselItemCl <- "carousel-fixed-item"
    
    shiny::tags$div(
      class = carouselItemCl,
      title,
      ...
    )
  }
  
}