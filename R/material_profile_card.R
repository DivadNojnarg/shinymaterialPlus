#' Create profile card
#'
#' @param header_background Header background, if any.
#' @param user_img User image, if any.
#' @param user_name User name.
#' @param user_position User job.
#' @param user_phone User phone number, if any.
#' @param user_mail User mail adress.
#' @param date_of_birth User date of birth.
#' @param extra User extra infos, if any.
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param hoverable Whether to hover the card. FALSE by default.
#' 
#' @examples
#' material_profile_card(
#'  header_background = "https://images3.alphacoders.com/601/601818.jpg",
#'  user_img = "file:///Users/macdavidgranjon/Desktop/materialize-admin-dashboard-master/images/avatar.jpg",
#'  user_name = "ROger Waters",
#'  user_position = "Project Manager",
#'  user_phone = "+1 (612) 222 8989",
#'  user_mail = "mail@@domain.com"
#' )
#' @export
material_profile_card <- function(header_background = "https://images3.alphacoders.com/601/601818.jpg", 
                                  user_img = NULL, user_name = NULL, user_position = NULL,
                                  user_phone = NULL, user_mail = NULL, date_of_birth = NULL, 
                                  extra = NULL, depth = NULL, hoverable = FALSE) {
  
  cl <- "card"
  if (!is.null(depth)) cl <- paste0(cl, " z-depth-", depth)
  if (isTRUE(hoverable)) cl <- paste(cl, "hoverable")
  
  shiny::tags$div(
    class = cl,
    id = "profile-card",
    style = "overflow: hidden;",
    
    # header
    shiny::tags$div(
      class = "card-image waves-effect waves-block waves-light",
      shiny::img(class = "activator", src = header_background)
    ),
    
    # card-content
    shiny::tags$div(
      class = "card-content",
      shiny::img(
        class = "circle responsive-img activator card-profile-image cyan lighten-1 padding-2", 
        src = user_img
      ),
      shiny::tags$a(
        class = "btn-floating pulse activator waves-effect waves-light rec accent-2 right",
        material_icon(name = "perm_identity")
      ),
      
      # user infos
      userinfoTag <- shiny::tagList(
        shiny::tags$span(class = "card-title activator grey-text text-darken-4", user_name),
        shiny::tags$p(
          shiny::tags$i(class = "material-icons cyan-text text-darken-2", "perm_identity"),
          user_position
        ),
        shiny::tags$p(
          shiny::tags$i(
            class = "material-icons cyan-text text-darken-2", "perm_phone_msg"),
          user_phone
        ),
        shiny::tags$p(
          shiny::tags$i(
            class = "material-icons cyan-text text-darken-2", "email"),
          user_mail
        ),
        shiny::tags$p(
          shiny::tags$i(class = "material-icons cyan-text text-darken-2", "cake"),
          date_of_birth
        )
      )
    ),
    
    # card-reveal
    shiny::tags$div(
      class = "card-reveal",
      shiny::tags$span(
        class = "card-title grey-text text-darken-4", 
        extra,
        shiny::tags$i(class = "material-icons right", "close")
      )
    )
    
  )
}