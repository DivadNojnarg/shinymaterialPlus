#' Create a material Masonry media
#'
#' @param effect Masonry effect: choose among the list given in masonry_effect_list().
#' @param src Image url or path.
#' @param caption_1 First part of title.
#' @param caption_2 Second part of title.
#' @param subcaption Subtitle.
#' 
#' @examples
#' material_masonry(
#'  effect = masonry_effect_list()[[4]],
#'  src = "https://pixinvent.com/materialize-material-design-admin-template/images/gallary/5.png",
#'  caption_1 = "Nice",
#'  caption_2 = "Lily",
#'  subcaption = "Lily likes to play with crayons and pencils"
#' )
#' @export
material_masonry <- function(effect, src = NULL, caption_1 = NULL,
                             caption_2 = NULL, subcaption = NULL) {
  shiny::tags$div(
    class = "col s12 m6 grid",
    shiny::tags$figure(
      class = paste0("effect-", effect),
      shiny::tags$img(src = src),
      shiny::tags$figcaption(
        shiny::tags$h2(
          caption_1,
          shiny::tags$span(caption_2)
        ),
        shiny::tags$p(subcaption)
      )
    )
  )
}



        
#' Return a list of all  Masonry effects 
#' 
#' @examples
#' masonry_effect_list()
#' 
#' @export    
masonry_effect_list <- function() {
  list(
    "lily",
    "sadie",
    "honey",
    "layla",
    "zoe",
    "oscar",
    "marley",
    "ruby",
    "roxy",
    "bubba",
    "romeo",
    "dexter",
    "sarah",
    "chico",
    "milo"
  )
}