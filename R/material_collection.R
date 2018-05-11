#' Create a collection
#'
#' @param ... slot for material_collection_item or material_collection_header or material_collection_avatar.
#' @param header Whether to enable material_collection_header. FALSE by default.
#' @examples
#' material_collection(
#'   header = TRUE,
#'   material_collection_header(
#'    title = "item 1"
#'   ),
#'   material_collection_item(
#'    active = TRUE,
#'    "This is the item content",
#'    secondary_content = material_badge(
#'     content = "Secondary content", 
#'     color = "red"
#'    )
#'   ),
#'   material_collection_avatar(
#'    src = "https://materializecss.com/images/yuna.jpg",
#'    title = "Title",
#'    content = "This is the content"
#'   )
#' )
#' @export
material_collection <- function(..., header = FALSE) {
  
  collectionCl <- "collection"
  if (isTRUE(header)) collectionCl <- paste0(collectionCl, " with-header")
  
  shiny::tags$ul(
    class = collectionCl,
    ...
  )
}


#' Create a collection item
#'
#' @param ... item content.
#' @param active Whether the item is active or not. FALSE by default.
#' @param secondary_content Secondary content if any. Displayed on the right side.
#' 
#' @export
material_collection_item <- function(..., active = FALSE,
                                     secondary_content = NULL) {
  
  collectionItemCl <- "collection_item"
  if (isTRUE(active)) collectionItemCl <- paste0(collectionItemCl, " active")
  
  shiny::tags$li(
    class = collectionItemCl,
    shiny::tags$div(
      ...,
      shiny::tags$a(
       href = "#!",
       class = "secondary-content",
       secondary_content
      )
    )
  )
}

#' Create a collection header
#'
#' @param title Header content.
#' 
#' @export
material_collection_header <- function(title = NULL) {
  
  shiny::tags$li(
    class = "collection-header",
    shiny::tags$h4(title)
  )
}


#' Create a collection avatar
#'
#' @param src Avatar image path or url.
#' @param title Avatar title.
#' @param content Content, if any.
#' @param secondary_content Secondary content if any. Displayed on the right side.
#' 
#' @export
material_collection_avatar <- function(src = NULL, title = NULL, content = NULL,
                                       secondary_content = NULL) {
  shiny::tags$li(
    class = "collection-item avatar",
    shiny::tags$img(class = "circle", src = src),
    shiny::tags$span(class = "title", title),
    shiny::tags$br(),
    content,
    shiny::tags$a(
      href = "#!",
      class = "secondary-content",
      secondary_content
    )
  )
}
