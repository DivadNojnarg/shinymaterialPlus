#' Create a material discovery
#'
#' @param id Discovery id. Should be unique.
#' @param title Discovery title.
#' @param description DIscovery description.
#'
#' @examples
#' 
#' material_discovery_trigger(
#'  label = "Open Discovery"
#' ),
#' material_discovery(
#'  id = "discovery_button",
#'  title = "My discovery",
#'  description = "A bunch of text"
#' )
#' @export
material_discovery <- function(id, title = NULL, description = NULL) {
  
  stopifnot(!is.null(id))
  
  discoveryTag <- tagList(
    
    shiny::tags$a(
      id = id, 
      class = "waves-effect waves-light btn btn-floating",
      shiny::tags$i(class = "material-icons", "menu")
    ),
    shiny::tags$div(
      class = "tap-target",
      `data-target` = id,
      shiny::tags$div(
        class = "tap-target-content",
        shiny::tags$h5(title),
        shiny::tags$p(description)
      )
    )
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(
          system.file(file.path("js", "discovery.js"), package = "shinymaterialPlus")
        )
      )
    ),
    discoveryTag
  )
} 



#' Create a material discovery trigger
#'
#' @param label Discovery trigger label. 
#'
#' @export
material_discovery_trigger <- function(label = NULL) {
  shiny::tags$a(
    class = "waves-effect waves-light btn",
    `onclick` = "$('.tap-target').tapTarget('open')",
    label
  )
} 

