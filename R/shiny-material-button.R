#' Create a shinymaterial button
#'
#' Build a shinymaterial button. The initial value is zero, and increases by one on each press.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The button text.
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param depth Integer. The amount of depth of the button. The value should be between 0 and 5. Leave empty for the default depth. 
#' @param color String. The color of the button. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param pulse Whether to enable pulse effect on the button. FALSE by default.
#' @param floating Whether to display a round button or not. FALSE by default: Works well with pulse.
#' @param size Button size. "medium" by default: "small" and "large" available.
#' @param disabled Whether to disable the button. FALSE by default.
#' @examples
#' material_button(
#'   input_id = "example_button",
#'   label = "Button",
#'   icon = "cloud",
#'   depth = 5,
#'   color = "blue lighten-2"
#' )
#' @export
material_button <- function(input_id, label, icon = NULL, depth = NULL, color = NULL,
                            pulse = FALSE, floating = FALSE, size = NULL, disabled = FALSE) {
  
  if(!is.null(icon)){
    icon_tag <-
      shiny::HTML(
        paste0(
          '<i class="material-icons left">',
          icon,
          '</i>')
      )
  } else {
    icon_tag <- NULL
  }
  
  create_material_object(
    js_file =
      "shiny-material-button.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$button(
          class = 
            paste0(
              "waves-effect waves-light shiny-material-button",
              ifelse(
                !isTRUE(floating),
                " btn",
                paste0(" ", "btn-floating")
              ),
              ifelse(
                is.null(depth),
                "",
                paste0(" z-depth-", depth)
              ),
              ifelse(
                is.null(color),
                "",
                paste0(" ", color)
              ),
              ifelse(
                !isTRUE(pulse),
                "",
                paste0(" ", "pulse")
              ),
              ifelse(
                is.null(size),
                "",
                paste0(" btn-", size)
              ),
              ifelse(
                !isTRUE(disabled),
                "",
                paste0(" ", "disabled")
              )
            ),
          id = input_id,
          value = 0,
          icon_tag,
          label
        )
      )
  )
}