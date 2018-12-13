library(shiny)
library(shinymaterial)
library(leaflet)
library(shinymaterialPlus)

# Wrap shinymaterial apps in material_page
ui <- shinymaterialPlus::material_page(
  title = "shinymaterialPlus 0.1.0",
  nav_bar_color = "grey darken-4",
  enable_footer = TRUE,
  
  # Navbar
  navbar = material_navbar(
    title = "shinymaterialPlus 0.1.0", 
    nav_bar_fixed = FALSE, 
    nav_bar_color = "blue",
    font_color = NULL
  ),
  # Footer
  footer = material_footer(
    material_row(
      material_column(
        leafletOutput("location")
      ),
      material_column(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
      sed do eiusmod tempor incididunt ut labore et dolore magna 
      aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
      ullamco laboris nisi ut aliquip ex ea commodo consequat. 
      Duis aute irure dolor in reprehenderit in voluptate velit 
      esse cillum dolore eu fugiat nulla pariatur. Excepteur sint 
      occaecat cupidatat non proident, sunt in culpa qui officia 
      deserunt mollit anim id est laborum.",
        br(),
        br(),
        material_row(
          shinymaterialPlus::material_button(
            input_id = "button1",
            icon = "cloud",
            label = "",
            depth = 3,
            color = "orange lighten-2",
            pulse = TRUE,
            floating = TRUE
          ),
          shinymaterialPlus::material_button(
            input_id = "button2",
            icon = "pin_drop",
            label = "",
            depth = 3,
            color = "orange lighten-2",
            pulse = TRUE,
            floating = TRUE
          ),
          shinymaterialPlus::material_button(
            input_id = "button2",
            icon = "computer",
            label = "",
            depth = 3,
            color = "orange lighten-2",
            pulse = TRUE,
            floating = TRUE
          )
        )
      )
    ),
    copyright = "Copyrights, if any",
    footer_extra = "2018",
    footer_color = "blue"
  ),
  
  # Define tabs
  material_tabs(
    color = "black",
    tabs = c(
      "Card Extensions" = "first_tab",
      "Collections" = "second_tab",
      "Others" = "third_tab",
      "Collapsibles" = "fourth_tab",
      "Timeline" = "fifth_tab",
      "Media" = "sixth_tab"
    )
  ),
  
  # banner
  tags$head(
    tags$style(
      HTML(
        '.parallax-container {
        height: 200px;
      }
      '
      )
    )
  ),
  material_parallax("https://i.pinimg.com/originals/df/0a/3e/df0a3e2ec30abb1c92d145ef165b714f.gif"),
  
  material_tab_content(
    tab_id = "first_tab",
    tags$h3("Material Card Extensions"),
    
    material_row(
      material_column(
        m_width = 10,
        l_width = 10,
        xl_width = 10,
        # Material Card Plus
        material_row(
          material_column(
            m_width = 6,
            l_width = 6,
            xl_width = 6,
            shinymaterialPlus::material_card(
              title = "Example Card",
              depth = NULL,
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
          
          # Card with Footer
          material_column(
            m_width = 6,
            l_width = 6,
            xl_width = 6,
            shinymaterialPlus::material_card(
              title = "Card with footer",
              depth = NULL,
              size = "large",
              activator = TRUE,
              extra = "More info here!",
              image = TRUE,
              src = "https://i.pinimg.com/originals/73/38/6e/73386e0513d4c02a4fbb814cadfba655.jpg",
              footer = tagList(
                material_row(
                  material_column(
                    s_width = 6,
                    shiny::a(href = "http://www.google.fr", "Link 1")
                  ),
                  material_column(
                    s_width = 6,
                    shiny::a(href = "http://www.google.fr", "Link 2")
                  )
                )
              )
            )
          )
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
              color = "red",
              type = "new"
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
      ),
      material_column(
        material_collection(
          header = TRUE,
          depth = 5,
          material_collection_header(
            title = "This is a collection with depth 5"
          ),
          material_collection_item(
            active = FALSE,
            "This item is active",
            secondary_content = material_badge(
              content = "Secondary content", 
              color = "red",
              type = "new"
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
        material_loader()
      ),
      
      # material buttons with pulse and floating
      material_column(
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
        material_blockquote(
          "This is an example quotation that uses the blockquote tag."
        )
      )
    ),
    
    material_row(
      
      # material chip
      material_column(
        material_chip(
          src = "https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-1.png",
          chip_name = "John Doe",
          material_icon("close", closable = TRUE)
        )
      ),
      
      # material icon
      material_column(
        material_icon("play_arrow", circle = TRUE, color = "red", position = NULL)
      )
    ),
    
    # material progress
    material_row(
      material_column(
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
        m_width = 6,
        l_width = 6,
        xl_width = 6,
        material_collapsible(
          type = "popout",
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "First",
            active = TRUE,
            icon = "filter_drama"
          ),
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "Second",
            icon = "place"
          ),
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "Third",
            icon = "whatshot"
          )
        )
      ),
      material_column(
        m_width = 6,
        l_width = 6,
        xl_width = 6,
        material_collapsible(
          material_collapsible_item(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco 
            laboris nisi ut aliquip ex ea commodo consequat",
            header = "First",
            active = TRUE
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
    tags$h3("Material timeline"),
    
    # Material timeline
    material_row(
      material_column(
        m_width = 12,
        l_width = 12,
        xl_width = 12,
        material_timeline(
          material_timeline_item(
            material_timeline_card(
              src = "https://i.pinimg.com/originals/df/0a/3e/df0a3e2ec30abb1c92d145ef165b714f.gif",
              title = "Item 1",
              extra = "Some text here!"
            ),
            marker_icon = "language",
            marker_color = "blue",
            marker_size = "large"
          ),
          material_timeline_item(
            material_timeline_card(
              src = "https://kulturologia.ru/files/u12645/Rhads-2.jpg",
              hoverable = TRUE,
              title = "Item 2",
              extra = "Some text here!"
            ),
            marker_icon = "work",
            marker_color = "green",
            marker_size = "small"
          )
        )
      )
    )
    
  ),
  
  material_tab_content(
    tab_id = "sixth_tab",
    tags$h3("Material media"),
    # material gallery
    material_row(
      material_column(
        material_gallery(
          id = "gallery1",
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
        material_video(
          src = "http://www.youtube.com/embed/Q8TXgCzxEnw?rel=0",
          responsive = FALSE,
          height = "480",
          width = "853",
          fullscreen = FALSE
        )
      ),
      material_column(
        material_video(
          src = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4",
          responsive = TRUE
        )
      )
    ),
    
    # material media
    material_row(
      material_column(
        material_media(
          src = "https://materializecss.com/images/sample-1.jpg",
          width = "650"
        )
      )
    )
  )
)

server <- function(input, output) {
  output$location <- renderLeaflet({
    leaflet() %>%
      setView(8.548672, 47.396847, 13) %>%
      addTiles() %>%
      addMarkers(8.548672, 47.396847)
  })
}
shinyApp(ui = ui, server = server)