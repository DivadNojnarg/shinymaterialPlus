#' Create a material gradient card
#'
#' @param src Gradient card image url or path.
#' @param title Gradient card title.
#' @param subtitle Gradient card subtitle.
#' @param color Card color. Use the function material_gradient_color() to have the full list.
#' @param shadow Card gradient shadow. TRUE by default.
#' 
#' @examples
#' material_gradient_card(
#'  src = "https://pixinvent.com/materialize-material-design-admin-template/images/icon/apple-watch.png",
#'  title = "50% Off",
#'  subtitle = "On apple watch",
#'  color = material_gradient_color()[[15]]
#' )
#' @export
material_gradient_card <- function(title = NULL, subtitle = NULL, src = NULL, 
                                   color = NULL, shadow = TRUE) {
  
  cl <- "card border-radius-3"
  if (!is.null(color)) cl <- paste(cl, color)
  if (isTRUE(shadow)) cl <- paste(cl, "gradient-shadow")
  
  shiny::tags$div(
    class = cl,
    shiny::tags$div(
      class = "card-content center",
      shiny::tags$img(
        class = "width-40 border-round z-depth-5",
        src = src
      ),
      shiny::tags$h5(class = "white-text lighten-4", title),
      shiny::tags$p(class = "white-text lighten-4", subtitle)
    )
  )
}