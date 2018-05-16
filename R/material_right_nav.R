#' Create a shinymaterial right sidebar
#' 
#' @examples
#' material_rigth_nav(
#'   
#' )
#' @export
material_right_nav <- function() {
  shiny::tags$aside(
    id = "right-sidebar-nav",
    shiny::tags$ul(
      id = "chat-out",
      class = "side-nav rightside-navigation right-aligned ps-container ps-active-y",
      style = "width: 300px; height: 819px;",
      
      shiny::tags$li(
        class = "li-hover",
        # tabs bar
        shiny::tags$div(
          class = "row",
          
          shiny::tags$div(
            class = "col s12 border-bottom-1 mt-5",
            
            # tabs
            shiny::tags$ul(
              class = "tabs",
              
              # tab 1
              shiny::tags$li(
                class = "tab col s4",
                shiny::tags$a(
                  href = "#activity",
                  class = "active",
                  shiny::tags$span(class = "material-icons", "graphic_eq")
                )
              ),
              
              # tab 2
              shiny::tags$li(
                class = "tab col s4",
                shiny::tags$a(
                  href = "#chatapp",
                  shiny::tags$span(class = "material-icons", "face")
                )
              ),
              
              # tab 3
              shiny::tags$li(
                class = "tab col s4",
                shiny::tags$a(
                  href = "#settings",
                  shiny::tags$span(class = "material-icons", "settings")
                )
              )
            )
          ),
          
          # tab content
          
          # tab 1
          shiny::tags$div(
            id = "activity",
            class = "col s12 active",
            shiny::tags$h6(class = "mt-5 mb-3 ml-3", "Tab 1")
          ),
          
          # tab 2
          shiny::tags$div(
            id = "chatapp",
            class = "col s12 active",
            shiny::tags$h6(class = "mt-5 mb-3 ml-3", "Tab 2")
          ),
          
          # tab 3
          shiny::tags$div(
            id = "settings",
            class = "col s12 active",
            shiny::tags$h6(class = "mt-5 mb-3 ml-3", "Tab 3")
          )
          
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