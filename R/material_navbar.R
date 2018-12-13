#' Create a shinymaterial footer
#'
#' Build a shinymaterial footer
#' @param title String. The title of the page.
#' @param nav_bar_fixed Boolean. Should the nav bar remain fixed on the screen?
#' @param nav_bar_color Color of the nav bar. Leave blank for the default color. 
#' Visit \url{http://materializecss.com/color.html} for a list of available colors. 
#'  @param font_color String. The title font color. Leave blank for the default color. 
#' Visit \url{http://materializecss.com/color.html} for a list of available colors. 
#' \emph{Title color requires using word forms of colors (e.g. "deep-purple"). 
#' Also, lighten or darken effects do not work on title colors.}
#' 
#' @export
material_navbar <- function(title = "", nav_bar_fixed = FALSE, nav_bar_color = NULL,
                            font_color = NULL) {
  
  
  
  navbarTag <- shiny::tags$nav(
    class = 
      ifelse(
        is.null(nav_bar_color),
        "",
        nav_bar_color
      ),
    shiny::tags$div(
      class = "nav-wrapper",
      shiny::tags$div(
        href = "javascript:void(0)",
        class = paste0(
          "brand-logo ",
          ifelse(
            is.null(font_color),
            "",
            paste0(" ", font_color, "-text")
          )
        ),
        shiny::HTML(paste0("&nbsp;", title))
      )#,
      ## Slot for right sidebar 
      #shiny::tags$ul(
      #  class = "right hide-on-med-and-down",
      #  shiny::tags$li(
      #    shiny::tags$a(
      #      class = "waves-effect waves-block waves-light chat-collapse",
      #      `data-activates` = "chat-out",
      #      href = "#",
      #      material_icon(name = "format_indent_increase")
      #    )
      #  )
      #)
    )
  )
  
  if (nav_bar_fixed) {
    material_nav_bar <- shiny::tags$div(
      class = "navbar-fixed",
      navbarTag
    )
  }
  
  return(navbarTag)
}