#' Create blog card
#'
#' @param ... Any element
#' @param src Post author image url or path.
#' @param author_name Post author.
#' @param post_title Post title.
#' @param date Date of publication.
#' @param media Media content. Can be an image and/or video.
#' @param extra Extra content, if any. Displayed below the media.
#' @param icon Post icon, if any.
#' 
#' @note Be careful: all video should have the embed attribut such as https://www.youtube.com/embed/10r9ozshGVE.
#' Otherwise they will no render.
#' 
#' @examples
#' material_blog_card(
#'  src = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-7.png",
#'  author_name = "Jean Eude",
#'  post_title = "My Post",
#'  date = "14 May 2018",
#'  media = material_media(
#'   src = "https://pixinvent.com/materialize-material-design-admin-template/images/gallary/3.png"
#'  )
#' ),
#'  "Le Lorem Ipsum est simplement du faux texte employé dans la 
#'  composition et la mise en page avant impression. Le Lorem 
#'  Ipsum est le faux texte standard de l'imprimerie depuis les 
#'  années 1500, quand un peintre anonyme assembla ensemble des 
#'  morceaux de texte pour réaliser un livre spécimen de polices 
#'  de texte. Il n'a pas fait que survivre cinq siècles, mais s'est 
#'  aussi adapté à la bureautique informatique, sans que son contenu 
#'  n'en soit modifié. Il a été popularisé dans les années 1960 grâce 
#'  à la vente de feuilles Letraset contenant des passages du Lorem 
#'  Ipsum, et, plus récemment, par son inclusion dans des applications 
#'  de mise en page de texte, comme Aldus PageMaker"
#' )
#' @export
material_blog_card <- function(..., src = NULL, author_name = NULL, 
                               post_title = NULL, date = NULL, media = NULL, 
                               extra = NULL, icon = "info") {
  shiny::tags$div(
    id = "profile-page-wall-post",
    class = "card",
    
    shiny::tags$div(
      class = "card-profile-title",
      shiny::tags$div(
        class = "row",
        
        # author image
        shiny::tags$div(
          class = "col s1",
          shiny::tags$img(
            src = src,
            class = "circle z-depth-2 responsive-img activator gradient-45deg-light-blue-cyan"
          )
        ),
        
        # author name and date of publication
        shiny::tags$div(
          class = "col s10",
          shiny::tags$p(class = "grey-text text-darken-4 margin", author_name),
          shiny::tags$span(class = "grey-text text-darken-1 ultra-small", date)
        ),
        
        # icon
        shiny::tags$div(
          class = "col s1 right-align",
          material_icon(name = icon)
        )
        
      ),
      
      material_divider(),
      
      shiny::tags$div(
        class = "row",
        shiny::tags$div(
          class = "col s12",
          shiny::tags$p(...)
        )
      )
    ),
    
    # post image or media
    shiny::tags$div(
      class = "card-image profile-medium",
      media,
      shiny::tags$span(class = "card-title text-shadow", post_title)
    ),
    
    # extra content
    shiny::tags$div(
      class = "card-content",
      shiny::tags$p(extra)
    )
    
  )
}