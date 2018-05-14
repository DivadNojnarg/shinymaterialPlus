library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- shinymaterialPlus::material_page(
  title = "shinymaterialPlus V0.1",
  nav_bar_color = "blue",
  footer_content = "The footer content",
  copyright = "Copyrights, if any",
  footer_extra = "2018",
  
  tags$head(
    shiny::includeScript(
      "https://code.jquery.com/jquery-2.1.1.min.js"
    )
  ),
  
  # Define tabs
  material_tabs(
    color = "orange",
    tabs = c(
      "Card Extensions" = "first_tab",
      "Collections" = "second_tab",
      "Others" = "third_tab",
      "Collapsibles" = "fourth_tab",
      "Carousel" = "fifth_tab",
      "Media" = "sixth_tab"
    )
  ),
  
  material_tab_content(
    tab_id = "first_tab",
    tags$h3("Material Card Extensions"),
    
    # Material Card Plus
    material_row(
      material_column(
        width = 6,
        shinymaterialPlus::material_card(
          title = "Example Card",
          depth = 5,
          size = "large",
          tabs = TRUE,
          tabscontent = material_tabs(
            tabs = c(
              "Example Tab 1" = "example_tab_1",
              "Example Tab 2" = "example_tab_2"
            ),
            color = "deep-purple"
          ),
          material_card_tabs(id = "example_tab_1", "tab 1"),
          material_card_tabs(id = "example_tab_2", "tab 2"),
          material_badge(1, custom_caption = TRUE),
          material_badge(content = "Test", color = "red", type = "new"),
          activator = TRUE,
          extra = "More info here!",
          #color = "deep-orange",
          image = TRUE,
          src = "http://www.oxygenna.com/wp-content/uploads/2015/11/18.jpg"
        ) 
      ),
      
      # Material Profile card
      material_column(
        width = 6,
        material_profile_card(
          header_background = "https://images3.alphacoders.com/601/601818.jpg",
          user_img = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-7.png",
          user_name = "Roger Waters",
          user_position = "Project Manager",
          user_phone = "+1 (612) 222 8989",
          user_mail = "mail@domain.com",
          date_of_birth = "18th June 1990",
          extra = "Test"
        )
      )
    ),
    
    material_row(
      material_column(
        width = 6,
        shinymaterialPlus::material_card(
          title = "Card with footer",
          depth = 4,
          size = "large",
          activator = TRUE,
          extra = "More info here!",
          image = TRUE,
          src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq7RZOVorlXjMqaZNwzQmSs9t8Jaa-5tx-tR6fPhE-3O5Q5omB",
          footer = tagList(
            material_row(
              material_column(
                width = 6,
                shiny::a(href = "http://www.google.fr", "Link 1")
              ),
              material_column(
                width = 6,
                shiny::a(href = "http://www.google.fr", "Link 2")
              )
            )
          )
        )
      )
    ),
  
    
    material_row(
      # always set width to 12
      material_column(
        width = 12,
        # horizontal card
        material_card_horizontal(
          src = "https://pixinvent.com/materialize-material-design-admin-template/images/gallary/21.png",
          title = "Card Title",
          "It is a long established fact that a reader will be distracted 
           by the readable content of a page when looking at its layout. 
           The point of using Lorem Ipsum is that it has a more-or-less 
           normal distribution of letters, as opposed to using 'Content here, 
           Packages and web page editors now use Lorem Ipsum as their default 
           model text, and a search for 'lorem ipsum' will uncover. 
           Web page editors now use Lorem Ipsum as their default"
        )
      )
    ),
    
    material_row(
      material_column(
        width = 6,
        material_blog_card(
          src = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-7.png",
          author_name = "Jean Eude",
          post_title = "My Post",
          date = "14 May 2018",
          media = material_media(
            src = "https://pixinvent.com/materialize-material-design-admin-template/images/gallary/3.png"
          ),
          "Le Lorem Ipsum est simplement du faux texte employé dans la 
        composition et la mise en page avant impression. Le Lorem 
        Ipsum est le faux texte standard de l'imprimerie depuis les 
        années 1500, quand un peintre anonyme assembla ensemble des 
        morceaux de texte pour réaliser un livre spécimen de polices 
        de texte. Il n'a pas fait que survivre cinq siècles, mais s'est 
        aussi adapté à la bureautique informatique, sans que son contenu 
        n'en soit modifié. Il a été popularisé dans les années 1960 grâce 
        à la vente de feuilles Letraset contenant des passages du Lorem 
        Ipsum, et, plus récemment, par son inclusion dans des applications 
        de mise en page de texte, comme Aldus PageMaker"
        )
      ),
      material_column(
        width = 6,
        material_blog_card(
          src = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-7.png",
          author_name = "Jean Eude",
          post_title = "My Post",
          date = "14 May 2018",
          media = tagList(
            material_video(
              src = "https://www.youtube.com/embed/10r9ozshGVE", 
              responsive = FALSE,
              height = "480",
              width = "853",
              fullscreen = TRUE
            ),
            material_media(
              src = "https://pixinvent.com/materialize-material-design-admin-template/images/gallary/3.png"
            )
          ),
          "Le Lorem Ipsum est simplement du faux texte employé dans la 
          composition et la mise en page avant impression. Le Lorem 
          Ipsum est le faux texte standard de l'imprimerie depuis les 
          années 1500, quand un peintre anonyme assembla ensemble des 
          morceaux de texte pour réaliser un livre spécimen de polices 
          de texte. Il n'a pas fait que survivre cinq siècles, mais s'est 
          aussi adapté à la bureautique informatique, sans que son contenu 
          n'en soit modifié. Il a été popularisé dans les années 1960 grâce 
          à la vente de feuilles Letraset contenant des passages du Lorem 
          Ipsum, et, plus récemment, par son inclusion dans des applications 
          de mise en page de texte, comme Aldus PageMaker"
        )
      )
    ),
    
    material_row(
      material_column(
        width = 6,
        material_task_card(
          title = "Task Card",
          date = "14 may 2018",
          color = "cyan",
          material_task_item(
            id = 1, 
            name = "task 1", 
            date = "today",
            tag_name = "tag", 
            tag_color = "red",
            checked = FALSE, 
            disabled = FALSE
          ),
          material_task_item(
            id = 2, 
            name = "task 2", 
            date = "today",
            tag_name = "tag", 
            tag_color = "orange",
            checked = TRUE, 
            disabled = FALSE
          ),
          material_task_item(
            id = 3, 
            name = "task 3", 
            date = "today",
            tag_name = "tag", 
            tag_color = "yellow",
            checked = TRUE, 
            disabled = TRUE
          )
        )
      )
      
    )

    # HTML(
    #   paste0(
    #     '<!-- profile-page-header -->
    #         <div id="profile-page-header" class="card">
    #     <div class="card-image waves-effect waves-block waves-light">
    #     <img class="activator" src="https://pixinvent.com/materialize-material-design-admin-template/images/gallary/23.png" alt="user background">                    
    #     </div>
    #     <figure class="card-profile-image">
    #     <img src="https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-7.png" alt="profile image" class="circle z-depth-2 responsive-img activator">
    #     </figure>
    #     <div class="card-content">
    #     <div class="row">                    
    #     <div class="col s3 offset-s2">                        
    #     <h4 class="card-title grey-text text-darken-4">Roger Waters</h4>
    #     <p class="medium-small grey-text">Project Manager</p>                        
    #     </div>
    #     <div class="col s2 center-align">
    #     <h4 class="card-title grey-text text-darken-4">10+</h4>
    #     <p class="medium-small grey-text">Work Experience</p>                        
    #     </div>
    #     <div class="col s2 center-align">
    #     <h4 class="card-title grey-text text-darken-4">6</h4>
    #     <p class="medium-small grey-text">Completed Projects</p>                        
    #     </div>                    
    #     <div class="col s2 center-align">
    #     <h4 class="card-title grey-text text-darken-4">$ 1,253,000</h4>
    #     <p class="medium-small grey-text">Busness Profit</p>                        
    #     </div>                    
    #     <div class="col s1 right-align">
    #     <a class="btn-floating activator waves-effect waves-light darken-2 right">
    #     <i class="mdi-action-perm-identity"></i>
    #     </a>
    #     </div>
    #     </div>
    #     </div>
    #     <div class="card-reveal">
    #     <p>
    #     <span class="card-title grey-text text-darken-4">Roger Waters <i class="mdi-navigation-close right"></i></span>
    #     <span><i class="mdi-action-perm-identity cyan-text text-darken-2"></i> Project Manager</span>
    #     </p>
    #     
    #     <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
    #     
    #     <p><i class="mdi-action-perm-phone-msg cyan-text text-darken-2"></i> +1 (612) 222 8989</p>
    #     <p><i class="mdi-communication-email cyan-text text-darken-2"></i> mail@domain.com</p>
    #     <p><i class="mdi-social-cake cyan-text text-darken-2"></i> 18th June 1990</p>
    #     <p><i class="mdi-device-airplanemode-on cyan-text text-darken-2"></i> BAR - AUS</p>
    #     </div>
    #     </div>
    #     <!--/ profile-page-header -->
    #     '
    #   )
    # )
    
  ),
  
  material_tab_content(
    tab_id = "second_tab",
    tags$h3("Material Collections"),
    
    # Material Collection
    material_row(
      material_column(
        width = 6,
        material_collection(
          header = TRUE,
          material_collection_header(
            title = "This is a collection"
          ),
          material_collection_item(
            active = TRUE,
            "This item is active",
            secondary_content = material_badge(
              content = "Secondary content", 
              color = "red"
            )
          ),
          material_collection_item(
            active = FALSE,
            "This item is not active",
            secondary_content = HTML(paste0('<i class="material-icons">send</i>'))
          ),
          material_collection_avatar(
            src = "https://materializecss.com/images/yuna.jpg",
            title = "Avatar Item",
            content = "This is an avatar item"
          )
        )
      )
    )
  ),
  
  material_tab_content(
    tab_id = "third_tab",
    tags$h3("Material Loader"),
    
    # Material loader
    material_row(
      material_column(
        width = 6,
        material_loader()
      ),
      
      # material buttons with pulse and floating
      material_column(
        with = 6,
        shinymaterialPlus::material_button(
          input_id = "example_button",
          label = "Button",
          icon = "cloud",
          depth = 5,
          color = "blue lighten-2",
          pulse = TRUE
        ),
        shinymaterialPlus::material_button(
          input_id = "example_button2",
          icon = "cloud",
          label = "",
          depth = 3,
          color = "green lighten-2",
          pulse = TRUE,
          floating = TRUE
        ),
        shinymaterialPlus::material_button(
          input_id = "example_button3",
          icon = "cloud",
          label = "large button",
          depth = 3,
          color = "orange lighten-2",
          size = "large"
        ),
        shinymaterialPlus::material_button(
          input_id = "example_button3",
          icon = "cloud",
          label = "Small disabled button",
          depth = 3,
          color = "orange lighten-2",
          size = "small",
          disabled = TRUE
        )
      )
    ),
    
    # material blockquote
    material_row(
      material_column(
        width = 6,
        material_blockquote(
          "This is an example quotation that uses the blockquote tag."
        )
      )
    ),
    
    material_row(
      
      # material chip
      material_column(
        width = 6,
        material_chip(
          src = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-1.png",
          chip_name = "John Doe",
          material_icon("close", closable = TRUE)
        )
      ),
      
      # material icon
      material_column(
        width = 6,
        material_icon("play_arrow", circle = TRUE, color = "red", position = NULL)
      )
    ),
    
    # material progress
    material_row(
      material_column(
        width = 6,
        material_progress(
          value = "80"
        ),
        material_progress(
          main_color = "red", 
          value = "40"
        ),
        material_progress(
          main_color = "orange", 
          secondary_color = "blue",
          value = "10"
        )
      )
    )

  ),
  
  material_tab_content(
    tab_id = "fourth_tab",
    tags$h3("Material Collapsible"),
    
    # Material collapsible
    material_row(
      material_column(
        width = 6,
        material_collapsible(
          type = "popout",
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "First",
            active = "TRUE"
          ),
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "Second"
          ),
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "Third"
          )
        )
      ),
      material_column(
        width = 6,
        material_collapsible(
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "First",
            active = "TRUE"
          ),
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "Second"
          ),
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "Third"
          )
        )
      )
    )
  ),
  
  material_tab_content(
    tab_id = "fifth_tab",
    tags$h3("Material Carousel"),
    
    # Material carousel
    material_row(
      material_column(
        width = 6,
        material_carousel(
          material_carousel_item(
            src = "https://cdn4.buysellads.net/uu/1/3386/1525211184-62491.png"
          ),
          material_carousel_item(
            fixed = TRUE,
            src = "https://cdn4.buysellads.net/uu/1/3386/1525211184-62491.png"
          )
        )
        
        # material_discovery_trigger(
        #  label = "Open Discovery"
        # ),
        # material_discovery(
        #   id = "discovery_1",
        #   title = "My discovery",
        #   description = "A bunch of text"
        # )
        
      )
    ),
    
    HTML(
      paste0(
        '<div class="container">
    <div class="timeline">
        <div class="timeline-event">
        <div class="card timeline-content">
        <div class="card-image waves-effect waves-block waves-light">
        <img class="activator" src="http://img11.hostingpics.net/pics/681702481.jpg">
        </div>
        <div class="card-content">
        <span class="card-title activator grey-text text-darken-4">Tile<i class="material-icons right">more_vert</i></span>
        <p>Content <a href="#">This is a link</a></p>
        </div>
        <div class="card-reveal">
        <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
        <p>Here is some more information about this product that is only revealed once clicked on.</p>
        </div>
        </div>
        <div class="timeline-badge blue white-text"><i class="material-icons">language</i></div>
        </div>
        <div class="timeline-event">
        <div class="card timeline-content">
        <div class="card-image waves-effect waves-block waves-light">
        <img class="activator" src="http://img11.hostingpics.net/pics/949190532.jpg">
        </div>
        <div class="card-content">
        <span class="card-title activator grey-text text-darken-4">Tile<i class="material-icons right">more_vert</i></span>
        <p>Content <a href="#">This is a link</a></p>
        </div>
        <div class="card-reveal">
        <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
        <p>Here is some more information about this product that is only revealed once clicked on.</p>
        </div>
        </div>
        <div class="timeline-badge red white-text"><i class="material-icons">work</i></div>
        </div>
        <div class="timeline-event">
        <div class="card timeline-content">
        <div class="card-image waves-effect waves-block waves-light">
        <img class="activator" src="http://img11.hostingpics.net/pics/512562623.jpg">
        </div>
        <div class="card-content">
        <span class="card-title activator grey-text text-darken-4">Tile<i class="material-icons right">more_vert</i></span>
        <p>Content <a href="#">This is a link</a></p>
        </div>
        <div class="card-reveal">
        <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
        <p>Here is some more information about this product that is only revealed once clicked on.</p>
        </div>
        </div>
        <div class="timeline-badge green white-text"><i class="material-icons">person</i></div>
        </div>
        </div>
        </div>'
      )
    )
    
  ),
  
  material_tab_content(
    tab_id = "sixth_tab",
    # material gallery
    material_row(
      material_column(
        width = 6,
        material_gallery(
          fullscreen = FALSE,
          material_gallery_item(
            src = "https://pixinvent.com/materialize-material-design-admin-template/images/gallary/22.png",
            "A beautiful image"
          ),
          material_gallery_item(
            src = "https://cdn.dribbble.com/users/329207/screenshots/3761869/bemocs_rei_labor_day_dribbble.jpg",
            "Another beautiful image"
          ),
          material_gallery_item(
            src = "https://img00.deviantart.net/2cb5/i/2017/048/a/4/blue_mountain_by_jordangrimmer-dazetlq.jpg",
            "Yet another beautiful image"
          )
        )
      )
    ),
    
    
    # material videos
    material_row(
      material_column(
        width = 6,
        material_video(
          src = "http://www.youtube.com/embed/Q8TXgCzxEnw?rel=0",
          responsive = FALSE,
          height = "480",
          width = "853",
          fullscreen = FALSE
        )
      ),
      material_column(
        width = 6,
        material_video(
          src = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4",
          responsive = TRUE
        )
      )
    ),
    
    # material media
    material_row(
      material_column(
        width = 6,
        material_media(
          src = "https://materializecss.com/images/sample-1.jpg",
          width = "650"
        )
      )
    ),
    
    # only works if elements are wrapped in <div class="col s12 m6 grid">...</div>
    material_row(
      HTML(
        paste0(
          '<div class="col s12 m6 grid">
          <figure class="effect-lily">
          <img src="https://pixinvent.com/materialize-material-design-admin-template/images/gallary/5.png">
          <figcaption>
          <h2> "Nice "
          <span>Lily</span>
          </h2>
          <p> Lily likes to play with crayons and pencils</p>
          <a href="#">View more</a>
          </figcaption>
          </figure>
          </div>
          '
        )
        ),
      
      HTML(
        paste0(
          '<div class="col s12 m6 grid">
          <figure class="effect-layla">
          <img src="https://www.sammobile.com/wp-content/uploads/2017/05/Redscape.png">
          <figcaption>
          <h2> "Crazy "
          <span>Layla</span>
          </h2>
          <p> When Layla appears, she brings an eternal summer along.</p>
          <a href="#">View more</a>
          </figcaption>
          </figure>
          </div>
          '
        )
        )
      
        )
    
  )
  
  
  
  
  
  
  
)

server <- function(input, output) {
  
}
shinyApp(ui = ui, server = server)