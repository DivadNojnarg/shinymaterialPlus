library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- shinymaterialPlus::material_page(
  title = "Basic Page",
  nav_bar_color = "blue",
  footer_content = "The footer content",
  copyright = "Copyrights, if any",
  footer_extra = "2018",
  
  # Define tabs
  material_tabs(
    tabs = c(
      "Card Extensions" = "first_tab",
      "Collections" = "second_tab",
      "Others" = "third_tab",
      "Collapsibles" = "fourth_tab",
      "Carousel" = "fifth_tab"
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
          date_of_birth = "18th June 1990"
        )
      )
    ),
    
    
    material_row(
      material_column(
        width = 6,
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
    
    material_chip(
      src = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-1.png",
      chip_name = "John Doe",
      material_icon("close", closable = TRUE)
    ),
    
    material_icon("play_arrow", circle = TRUE, color = "red",
                  position = NULL),
    
    HTML(
      paste0(
        '<div class="divider mt-5"></div>
        '
      )
    ),
    
    shiny::tags$figure(
      class = "effect-lily",
      shiny::tags$img(src = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-1.png")
    ),
    
    material_row(
      material_column(
        width = 6,
        HTML(
          paste0(
            '<div class="slider">
            <ul class="slides">
            <li>
            <img src="https://lorempixel.com/580/250/nature/1"> <!-- random image -->
            <div class="caption center-align">
            <h3>This is our big Tagline!</h3>
            <h5 class="light grey-text text-lighten-3">Here iss our small slogan.</h5>
            </div>
            </li>
            <li>
            <img src="https://lorempixel.com/580/250/nature/2"> <!-- random image -->
            <div class="caption left-align">
            <h3>Left Aligned Caption</h3>
            <h5 class="light grey-text text-lighten-3">Here is our small slogan.</h5>
            </div>
            </li>
            <li>
            <img src="https://lorempixel.com/580/250/nature/3"> <!-- random image -->
            <div class="caption right-align">
            <h3>Right Aligned Caption</h3>
            <h5 class="light grey-text text-lighten-3">Here is our small slogan.</h5>
            </div>
            </li>
            <li>
            <img src="https://lorempixel.com/580/250/nature/4"> <!-- random image -->
            <div class="caption center-align">
            <h3>This is our big Tagline!</h3>
            <h5 class="light grey-text text-lighten-3">Here is our small slogan.</h5>
            </div>
            </li>
            </ul>
            </div>'
          )
          )
      )
    ),
    
    HTML(
      paste0(
        '<div class="row">
        <div class="col s12 m6">
        <div class="card blue-grey darken-2">
        <div class="card-content white-text">
        <span class="card-title">Card Title</span>
        <p>I am a very simple card. I am good at containing small bits of information.
        I am convenient because I require little markup to use effectively.</p>
        </div>
        <div class="card-action">
        <a href="#">This is a link</a>
        <a href="#">This is a link</a>
        </div>
        </div>
        </div>
        </div>
        '
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
    )
    
    
    
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
    )
  )
  
  
  
  
  
  
  
)

server <- function(input, output) {
  
}
shinyApp(ui = ui, server = server)