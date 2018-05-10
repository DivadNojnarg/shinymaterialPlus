#' Create a card that will contain UI content
#'
#' UI content can be placed in cards to organize items on a page.
#' @param title String. The title of the card.
#' @param ... The UI elements to place in the card.
#' @param size Card size: "small", "medium", "large". "medium" by default.
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param image Whether to enable image in the card. FALSE by default.
#' @param src Image path, if any.
#' @param activator Whether to allow the card reveal. FALSE by default.
#' @param tabs Whether to display tabs in the card. FALSE by default.
#' @param tabscontent Tabs content, if any.
#' @param extra Card reveal content if any.
#' @param color String. The card color. Leave empty for the default color. Visit http://materializecss.com/color.html for a list of available colors.
#' @param hoverable Whether to hover the card. TRUE by default.
#' @examples
#' material_card(
#'   title = "Example Card",
#'   depth = 5,
#'   shiny::tags$h5("Card Content")
#' )
#' @export
material_card <- function(title, ..., size = "medium", depth = NULL, 
                          image = FALSE, src = NULL, activator = FALSE, 
                          tabs = FALSE, tabscontent = NULL, extra = NULL, 
                          color = NULL, hoverable = TRUE){
  
  
  cl <- "card"
  if (isTRUE(hoverable)) cl <- paste(cl, "hoverable")
  if (!is.null(size)) cl <- paste(cl, size)
  if (!is.null(depth)) cl <- paste(cl, " z-depth-", depth)
  if (!is.null(color)) cl <- paste(cl, color)

  shiny::tags$div(
    class = cl,
    
    # card image
    if (isTRUE(image)) {
      shiny::tags$div(
        class = "card-image",
        shiny::tags$img(src = src)
      )
    },
    
    # card tabs 
    if (isTRUE(tabs)) {
      shiny::tags$div(
        class = "card-tabs",
        tabscontent
      )
    },
    
    # card content
    shiny::tags$div(
      class = "card-content",
      shiny::tags$span(
        class = if (isTRUE(activator)) "card-title activator" else "card-title",
        title,
        if (isTRUE(activator)) shiny::tags$i(class = "mdi-navigation-more-vert right", "...")
      ),
      ...
    ),
    
    # activator section if any ...
    if (isTRUE(activator)) {
      shiny::tags$div(
        class = "card-reveal",
        style = "display: none; transform: translateY(0px);",
        shiny::tags$span(
          class = "card-title",
          title,
          shiny::tags$i(class = "material-icons right", "close")
        ),
        shiny::tags$p(extra)
      )
    }
  )
}