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





#' Create a material gallery
#'
#' @param ... Slot for material_gallery_item.
#' @param id Unique gallery id.
#' @param fullscreen Whether to display in a fullscreen mode.
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
material_gallery <- function(..., id, fullscreen = FALSE) {
  galleryTag <- shiny::tags$div(
    class = if (isTRUE(fullscreen)) "slider fullscreen" else "slider",
    id = paste0(id, "-slider"),
    shiny::tags$ul(
      class = "slides",
      ...
    )
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(
          shiny::HTML(
            paste0(
              "$(document).ready(function(){
                $('#", id, "-slider').slider();
               });
              "
            )
          )
        )
      )
    ),
    galleryTag
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




#' Create a material timeline
#'
#' @param ... Slot for material_timeline_item
#' 
#' @examples
#' material_timeline(
#'  material_timeline_item(
#'   material_timeline_card(
#'    src = "https://i.pinimg.com/originals/df/0a/3e/df0a3e2ec30abb1c92d145ef165b714f.gif",
#'    depth = 5,
#'    title = "Item 1",
#'    extra = "Some text here!"
#'   ),
#'   marker_icon = "language",
#'   marker_color = "blue",
#'   marker_size = "large"
#'  ),
#'  material_timeline_item(
#'   material_timeline_card(
#'    src = "https://kulturologia.ru/files/u12645/Rhads-2.jpg",
#'    hoverable = TRUE,
#'    title = "Item 2",
#'    extra = "Some text here!"
#'   ),
#'   marker_icon = "work",
#'   marker_color = "green",
#'   marker_size = "small"
#'  )
#' )
#' @export
material_timeline <- function(...) {
  shiny::tags$div(
    class = "timeline",
    ...
  )
}



#' Create a material timeline item
#'
#' @param ... Any element such as material_timeline_card.
#' @param marker_icon Marker icon.
#' @param marker_color Marker color.
#' @param marker_size Marker size.
#' 
#' @export
material_timeline_item <- function(..., marker_icon = NULL, marker_color = NULL, 
                                   marker_size = NULL) {
  
  shiny::tags$div(
    class = "timeline-event",
    
    # item content such as card
    ...,
    
    # timeline marker
    shiny::tags$div(
      class = paste("timeline-badge", marker_color, "white-text"),
      material_icon(
        name = marker_icon,
        size = marker_size
      )
    )
  )
}



#' Create a material timeline card
#'
#' @param ... Card content
#' @param src Card image path or url.
#' @param title Card title.
#' @param extra Card reveal extra.
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param hoverable Whether to hover the card. TRUE by default.
#' 
#' @export
material_timeline_card <- function(..., src = NULL, title = NULL, extra = NULL,
                                   depth = NULL, hoverable = TRUE) {
  
  cl <- "card timeline-content"
  if (!is.null(depth)) cl <- paste0(cl, " z-depth-", depth)
  if (isTRUE(hoverable)) cl <- paste(cl, "hoverable")
  
  shiny::tags$div(
    class = cl,
    
    # image
    shiny::tags$div(
      class = "card-image waves-effect waves-block waves-light",
      shiny::tags$img(
        class = "activator",
        src = src
      )
    ),
    
    # content
    shiny::tags$div(
      class = "card-content",
      shiny::tags$span(
        class = "card-title activator grey-text text-darken-4",
        title,
        material_icon(name = "more_vert", position = "right")
      ),
      shiny::tags$p(...)
    ),
    
    # card reveal
    shiny::tags$div(
      class = "card-reveal",
      shiny::tags$span(
        class = "card-title grey-text text-darken-4",
        title,
        material_icon(name = "close", position = "right")
      ),
      shiny::tags$p(extra)
    )
    
  )
}




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