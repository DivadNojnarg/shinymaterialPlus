#' Create profile card
#'
#' UI content can be placed in cards.
#' @param ... Slot for any UI element.
#' @param id Tag id. Should be unique and correspond to the id provided in material_tabs.
#' @examples
#' material_card_tabs(
#'  id = "tab_1"
#'  "Content"
#' )
#' @export
material_profile_card <- function(header_background = "https://images3.alphacoders.com/601/601818.jpg", 
                                  user_img = NULL, user_name = NULL, user_position = NULL,
                                  user_phone = NULL, user_mail = NULL,
                                  date_of_birth = NULL) {
  shiny::tags$div(
    class = "card",
    id = "profile_card",
    
    # header
    shiny::tags$div(
      class = "card-image waves-effect waves-block waves-light",
      shiny::img(class = "activator", src = header_background)
    ),
    
    # card-content
    shiny::tags$div(
      class = "card-content",
      shiny::img(class = "circle responsive-img activator card-profile-image", src = user_img),
      shiny::tags$a(
        class = "btn-floating activator btn-move-up waves-effect waves-light darken-2 right",
        shiny::tags$i(class = "mdi-action-account-circle")
      ),
      
      # user infos
      shiny::tags$span(class = "card-title activator grey-text text-darken-4", user_name),
      shiny::tags$p(
        shiny::tags$i(class = "mdi-action-perm-identity cyan-text text-darken-2"),
        user_position
      ),
      shiny::tags$p(
        shiny::tags$i(
          class = "mdi-action-perm-phone-msg cyan-text text-darken-2"),
        user_phone
      ),
      shiny::tags$p(
        shiny::tags$i(
          class = "mdi-communication-email cyan-text text-darken-2"),
        user_mail
      )
    ),
    
    # card-reveal
    shiny::tags$div(
      class = "card-reveal",
      shiny::tags$span(
        class = "card-title grey-text text-darken-4", 
        user_name,
        shiny::tags$i(class = "mdi-navigation-close right")
      ),
      shiny::tags$p(
        shiny::tags$i(class = "mdi-action-perm-identity cyan-text text-darken-2"),
        user_position
      ),
      shiny::tags$p(
        shiny::tags$i(class = "mdi-action-perm-phone-msg cyan-text text-darken-2"),
        user_phone
      ),
      shiny::tags$p(
        shiny::tags$i(class = "mdi-communication-email cyan-text text-darken-2"),
        user_mail
      ),
      shiny::tags$p(
        shiny::tags$i(class = "mdi-social-cake cyan-text text-darken-2"),
        date_of_birth
      )
    )
    
  )
}