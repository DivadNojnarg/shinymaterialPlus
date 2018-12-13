#' Create a shinymaterial page
#'
#' Build a shinymaterial page.
#' @param ... The UI elements to place in the page.
#' @param enable_footer Whether to display the footer or not. TRUE by default.
#' @param navbar Slot for \link{material_navbar}.
#' @param footer Slot for \link{material_footer}.
#' @param background_color Page background color. Leave blank for the default color. 
#' Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param include_fonts Boolean. Should the material font files be included? (This will place the font sources in a directory 'www', at the same location as the app code.)
#' @examples
#' material_page(
#'   material_navbar(
#'    
#'   )
#'   background_color = "blue lighten-4",
#'   shiny::tags$h1("Page Content")
#' )
#' @export
material_page <- function(..., enable_footer = TRUE, navbar = NULL, 
                          footer = NULL, background_color = "grey lighten-4", 
                          include_fonts = FALSE){
  
  materialize_version <- "0.99.0"
  
  if (include_fonts) {
    
    dir_recursion <- c("www", "www/fonts", "www/fonts/roboto")
    
    for (dir.i in dir_recursion) {
      if (!dir.exists(dir.i)) {
        if (dir.i == "www/fonts/roboto") {
          message(
            paste0(
              "[shinymaterial] Creating directory: ",
              file.path(getwd(), dir.i)
            )
          )
        }
        dir.create(dir.i)
      }
    }
    
    font_files <- list.files(
      system.file(paste0("materialize/", materialize_version, "/fonts/roboto"),
                  package = "shinymaterial")
    )
    
    for (font_file.i in font_files) {
      file.copy(
        from = system.file(paste0("materialize/", materialize_version, "/fonts/roboto/", font_file.i),
                           package = "shinymaterial"),
        to = paste0("www/fonts/roboto/", font_file.i),
        overwrite = TRUE
      )
    }
  }
  
  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1.0"
      ),
      shiny::includeCSS(path = "https://fonts.googleapis.com/icon?family=Material+Icons")
    ),
    # Body --------------------------------------------------------------------
    addDeps(
      shiny::tags$body(
        class = background_color,
        navbar,
        ...
      )
    ),
    # footer ------------------------------------------------------------------
    if (enable_footer) footer
  )
}
