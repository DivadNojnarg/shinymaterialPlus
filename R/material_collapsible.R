#' Create a collapsible element
#' 
#' @param ... slot for material_collapsible_item.
#' @param type Collapse behavior. NULL by default (accordion). Can also be "expandable" or "popout".
#' 
#' @note expandable does not work at the moment.
#'
#' @examples
#' material_collapsible(
#'  material_collapsible_item(
#'   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
#'   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
#'   Ut enim ad minim veniam, quis nostrud exercitation ullamco 
#'   laboris nisi ut aliquip ex ea commodo consequat",
#'   header = "First",
#'   active = TRUE
#'  ),
#'  material_collapsible_item(
#'   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
#'   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
#'   Ut enim ad minim veniam, quis nostrud exercitation ullamco 
#'   laboris nisi ut aliquip ex ea commodo consequat",
#'   header = "Second"
#'  ),
#'  material_collapsible_item(
#'   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
#'   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
#'   Ut enim ad minim veniam, quis nostrud exercitation ullamco 
#'   laboris nisi ut aliquip ex ea commodo consequat",
#'   header = "Third"
#'  )
#' )
#' @export
material_collapsible <- function(..., type = NULL) {
  
  collapsibleCl <- "collapsible"
  if (!is.null(type)) collapsibleCl <- paste(collapsibleCl, type)
  
  collapsibleTag <- shiny::tags$ul(
    class = collapsibleCl,
    ...
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        if (is.null(type)) {
          shiny::tags$script(
            system.file(file.path("js", "collapsible.js"), package = "shinymaterialPlus")
          )
        }
        else {
          shiny::tags$script(
            system.file(file.path("js", "collapsible-expandable.js"), package = "shinymaterialPlus")
          )
        }
      )
    ),
    collapsibleTag
  )
  
}


#' Create a collapsible item
#'
#' @param ... Body content.
#' @param header Item title.
#' @param icon Item icon, if any.
#' @param active Whether the item is active or not. FALSE by default.
#' 
#' @export
material_collapsible_item <- function(..., header = NULL, icon = NULL, active = FALSE) {
  collapsibleItemCl <- NULL
  if (isTRUE(active)) collapsibleItemCl <- "active"
    
  shiny::tags$li(
    class = collapsibleItemCl,
    shiny::tags$div(
      class = "collapsible-header", 
      shiny::tags$i(class = "material-icons", icon), 
      header
    ),
    shiny::tags$div(class = "collapsible-body", shiny::tags$span(...))
  )
}