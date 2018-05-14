#' Create a material info card
#'
#' @param icon Info card icon.
#' @param title Info card title.
#' @param value Info card value.
#' @param subtitle Info card subtitle.
#' @param extra info card extra information.
#' @param color Card color. Use the function material_gradient_color() to have the full list.
#' @param shadow Card gradient shadow. TRUE by default.
#' 
#' @examples
#' material_info_card(
#'  icon = "timeline",
#'  title = "Orders",
#'  value = 690,
#'  subtitle = "New",
#'  extra = 6000,
#'  color = material_gradient_color()[[15]]
#' )
#' @export
material_info_card <- function(icon = NULL, title = NULL, value = NULL,
                               subtitle = NULL, extra = NULL, color = NULL,
                               shadow = TRUE) {
  
  cl <- "card min-height-100 white-text"
  if (!is.null(color)) cl <- paste(cl, color)
  if (isTRUE(shadow)) cl <- paste(cl, "gradient-shadow")
  
  shiny::tags$div(
    class = cl,
    shiny::tags$div(
      class = "padding-4",
      shiny::tags$div(
        class = "col s7 m7",
        shiny::tags$i(class = "material-icons background-round mt-5", icon),
        shiny::tags$p(title)
      ),
      shiny::tags$div(
        class = "col s5 m5 right-align",
        shiny::tags$h5(class = "mb-0", value),
        shiny::tags$p(class = "no-margin", subtitle),
        shiny::tags$p(extra)
      )
    )
  )
  
}



#' Return a material gradient list
#' 
#' @examples
#' material_gradient_color()
#' 
#' @export
material_gradient_color <- function() {
  list(
    "gradient-45deg-amber-amber",
    "gradient-45deg-blue-indigo",
    "gradient-45deg-indigo-light-blue",
    "gradient-45deg-red-pink",
    "gradient-45deg-light-blue-teal",
    "gradient-45deg-light-blue-indigo",
    "gradient-45deg-yellow-green",
    "gradient-45deg-orange-deep-orange",
    "gradient-45deg-deep-purple-purple",
    "gradient-45deg-light-green-amber",
    "gradient-45deg-purple-pink",
    "gradient-45deg-indigo-blue",
    "gradient-45deg-brown-brown",
    "gradient-45deg-blue-grey-blue",
    "gradient-45deg-purple-deep-orange",
    "gradient-45deg-green-teal",
    "gradient-45deg-indigo-light-blue",
    "gradient-45deg-teal-cyan",
    "gradient-45deg-blue-grey-blue-grey",
    "gradient-45deg-cyan-light-green",
    "gradient-45deg-orange-amber",
    "gradient-45deg-indigo-purple",
    "gradient-45deg-deep-purple-blue",
    "gradient-45deg-deep-orange-orange",
    "gradient-45deg-light-blue-cyan",
    "gradient-45deg-purple-amber",
    "gradient-45deg-purple-deep-purple",
    "gradient-45deg-purple-light-blue",
    "gradient-45deg-cyan-cyan",
    "gradient-45deg-yellow-teal",
    "gradient-45deg-cyan-light-green"
  )
}