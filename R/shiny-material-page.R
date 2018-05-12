#' Create a shinymaterial page
#'
#' Build a shinymaterial page.
#' @param ... The UI elements to place in the page.
#' @param title String. The title of the page.
#' @param nav_bar_fixed Boolean. Should the nav bar remain fixed on the screen?
#' @param nav_bar_color Color of the nav bar. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param enable_footer Whether to display the footer or not. TRUE by default.
#' @param footer_content Footer content.
#' @param copyright Copyright text in footer.
#' @param footer_extra Display additional text on the right of copyrights.
#' @param background_color Page background color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param font_color String. The title font color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{Title color requires using word forms of colors (e.g. "deep-purple"). Also, lighten or darken effects do not work on title colors.}
#' @param include_fonts Boolean. Should the material font files be included? (This will place the font sources in a directory 'www', at the same location as the app code.)
#' @examples
#' material_page(
#'   title = "Example Title",
#'   nav_bar_fixed = TRUE,
#'   nav_bar_color = "red lighten-2",
#'   background_color = "blue lighten-4",
#'   shiny::tags$h1("Page Content")
#' )
#' @export
material_page <- function(..., title = "", nav_bar_fixed = FALSE, nav_bar_color = NULL, 
                          enable_footer = TRUE, footer_content = NULL, footer_color = NULL,
                          copyright = NULL, footer_extra = NULL, background_color = "grey lighten-4", 
                          font_color = NULL, include_fonts = FALSE){
  
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
  
  material_nav_bar <- shiny::tags$nav(
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
      )
    )
  )
  
  if (nav_bar_fixed) {
    material_nav_bar <- shiny::tags$div(
      class = "navbar-fixed",
      material_nav_bar
    )
  }
  
  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      # Fonts
       shiny::includeCSS(
         "https://fonts.googleapis.com/icon?family=Material+Icons"
       ),
      # Source Materialize CSS
      shiny::includeCSS(
        system.file(paste0("materialize/", materialize_version, "/css/materialize.min.css"),
                    package = "shinymaterial"),
        media = "screen,projection"
      ),
      shiny::includeCSS(
        system.file("css/style.css",
                    package = "shinymaterialPlus")
      ),
      shiny::includeCSS(
        system.file("css/shiny-material-page.css",
                    package = "shinymaterial")
      ),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1.0"
      )
    ),
    # Body --------------------------------------------------------------------
    shiny::tags$body(
      class = background_color,
      material_nav_bar,
      ...
    ),
    
    # footer ------------------------------------------------------------------
    if (enable_footer) {
      footerCl <- "page-footer"
      footerCl <- if (!is.null(footer_color)) {
        footerCl <- paste(footerCl, color)
      } else {
        footerCl <- paste(footerCl, "blue")
      }
      material_footer <- shiny::tags$footer(
        class = footerCl,
        
        shiny::tags$div(
          class = "container",
          shiny::tags$div(
            class = "row",
            shiny::tags$div(
              class = "white-text",
              footer_content
            )
          )
        ),
        
        shiny::tags$div(
          class = "footer-copyright",
          shiny::tags$div(
            class = "container",
            copyright,
            shiny::tags$a(class = "grey-text text-lighten-4 right", href = "#!", footer_extra)
          )
        )
        
      )
    },
    
    # Source Materialize Javascript
    shiny::includeScript(
      system.file(paste0("materialize/", materialize_version, "/js/materialize.min.js"),
                  package = "shinymaterial")
    ),
    shiny::includeScript(
      system.file("js/shiny-material-page.js",
                  package = "shinymaterial")
    ),
    shiny::includeScript(
      system.file("js/task.js",
                  package = "shinymaterialPlus")
    ),
    shiny::tags$script("
                       Shiny.addCustomMessageHandler('shinymaterialJS',
                       function(code) {
                       //console.log(code.split('\\\\').join('').trim());
                       eval(code.split('\\\\').join('').trim());
                       });
                       ")
  )
}
