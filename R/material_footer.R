#' Create a shinymaterial footer
#'
#' Build a shinymaterial footer
#' @param ... Footer content.
#' @param footer_color Footer color. 
#' @param copyright Copyright text in footer.
#' @param footer_extra Display additional text on the right of copyrights.
#' 
#' @export
material_footer <- function(..., footer_color = NULL, copyright = NULL, footer_extra = NULL) {
  
  
  footerCl <- "page-footer"
  if (!is.null(footer_color)) {
    footerCl <- paste(footerCl, footer_color)
  } else {
    footerCl <- paste(footerCl, "blue")
  }
  
  shiny::tags$footer(
    class = footerCl,
    # Content
    shiny::tags$div(
      class = "container",
      shiny::tags$div(
        class = "row",
        shiny::tags$div(
          class = "white-text",
          ...
        )
      )
    ),
    # Copyrights
    shiny::tags$div(
      class = "footer-copyright",
      shiny::tags$div(
        class = "container",
        copyright,
        shiny::tags$a(class = "grey-text text-lighten-4 right", href = "#!", footer_extra)
      )
    )
  )  
}
