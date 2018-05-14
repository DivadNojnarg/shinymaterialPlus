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
        material_icon(name = "more_vert")
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


