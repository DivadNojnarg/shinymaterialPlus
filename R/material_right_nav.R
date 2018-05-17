#' Create a shinymaterial right sidebar
#' 
#' @param ... Slot for material_right_nav_TabContent.
#' @param tabList Slot for material_right_nav_TabList.
#' 
#' @examples
#' material_right_nav(
#'   tabList = material_right_nav_TabList(
#'    material_right_nav_TabItem(
#'     id = "activity",
#'     tabIcon = "graphic_eq"
#'    ), 
#'    material_right_nav_TabItem(
#'     id = "chatapp",
#'     tabIcon = "face"
#'    ),
#'    material_right_nav_TabItem(
#'     id = "settings",
#'     tabIcon = "settings"
#'    )
#'   ),
#'   material_right_nav_TabContent(
#'    id = "activity",
#'    tabName = "Tab 1"
#'   ),
#'   material_right_nav_TabContent(
#'    id = "chatapp",
#'    tabName = "Tab 2"
#'   ),
#'   material_right_nav_TabContent(
#'    id = "settings",
#'    tabName = "Tab 3"
#'   )
#' )
#' @export
material_right_nav <- function(..., tabList = NULL) {
  
  # set the first tab to active if there
  # are more than one tab.
  # children <- tabList$children
  # if (length(children) > 1) {
  #   first_grandchild <- children[[1]]$children
  #   first_grandchild$attribs$class <- "active"
  #   
  # }
  
  shiny::tags$aside(
    id = "right-sidebar-nav",
    shiny::tags$ul(
      id = "chat-out",
      class = "side-nav rightside-navigation right-aligned ps-container ps-active-y",
      style = "width: 300px; height: 819px;",
      
      shiny::tags$li(
        class = "li-hover",
        shiny::tags$div(
          class = "row",
          # tabs bar
          shiny::tags$div(
            class = "col s12 border-bottom-1 mt-5",
            tabList
          ),
          # tab content
          ...
        )
      ),
      
      shiny::tags$div(
        class = "ps-scrollbar-x-rail",
        style = "left: 0px; bottom: -705px;",
        shiny::tags$div(class = "ps-scrollbar-x", style = "left: 0px; width: 0px;")
      ),
      
      shiny::tags$div(
        class = "ps-scrollbar-y-rail",
        style = "top: 708px; height: 251px; right: 3px;",
        shiny::tags$div(class = "ps-scrollbar-y", style = "top: 186px; height: 65px;")
      )
      
    )
  )
}



#' Create a shinymaterial right sidebar tab list
#' 
#' @param ... Slot for material_right_nav_TabItem.
#' 
#' @export
material_right_nav_TabList <- function(...) {
    shiny::tags$ul(
      class = "tabs",
      ...
    )
}



#' Create a shinymaterial right sidebar tab list item
#' 
#' @param id Unique item id. String.
#' @param tabIcon Tab icon.
#' 
#' @export
material_right_nav_TabItem <- function(id, tabIcon = NULL) {
  shiny::tags$li(
    class = "tab col s4",
    shiny::tags$a(
      href = paste0("#", id),
      shiny::tags$span(class = "material-icons", tabIcon)
    )
  )
}




#' Create a shinymaterial right sidebar tab content
#' 
#' @param ... Any UI element, such as sliders, checkboxes, text, ...
#' @param id Unique item id. Should correspond to the id given in material_right_nav_TabItem.
#' @param tabName Tab name.
#' 
#' @export
material_right_nav_TabContent <- function(..., id, tabName = NULL) {
  shiny::tags$div(
    id = id,
    class = "col s12 active",
    shiny::tags$h6(class = "mt-5 mb-3 ml-3", tabName),
    ...
  )
}
