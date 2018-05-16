#' Create a material stat card
#'
#' @param title Card title.
#' @param value Card subtitle.
#' @param trend Card trend. "more", "less" or "equal".
#' @param subtitle Card subtitle.
#' @param footer Card footer, if any.
#' @param icon Card icon, if any.
#' @param color Card color. Use the function material_gradient_color() to have the full list.
#' 
#' @examples
#' material_stat_card(
#'  title = "New Clients",
#'  value = 566,
#'  trend = "up",
#'  subtitle = "15% from yesterday",
#'  color = "green"
#' )
#' @export
material_stat_card <- function(title = NULL, value = NULL, trend = NULL,
                               subtitle = NULL, footer = NULL, icon = NULL, 
                               color = NULL) {
  
  cl <- "card-content white-text"
  if (!is.null(color)) cl <- paste(cl, color)
  
  shiny::tags$div(
    class = "card",
    
    # stats
    shiny::tags$div(
      class = cl,
      shiny::tags$p(
        class = "card-stats-title center-align",
        material_icon(name = icon),
        title
      ),
      shiny::tags$h4(class = "card-stats-number center-align", value),
      shiny::tags$p(
        class = "card-stats-compare center-align",
        material_icon(name = if (trend != "equal") paste0("expand_", trend) else "drag_handle"),
        shiny::tags$span(class = "text-lighten", subtitle)
      )
    ),
    
    # footer
    shiny::tags$div(
      class = paste("card-action", color, "darken-2"),
      footer
    )
    
  )
}