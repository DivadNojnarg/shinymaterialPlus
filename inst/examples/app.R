library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- shinymaterialPlus::material_page(
  title = "shinymaterialPlus V0.1",
  nav_bar_color = "grey darken-4",
  footer_content = "The footer content",
  copyright = "Copyrights, if any",
  footer_extra = "2018",
  footer_color = "grey darken-4",
  
  material_side_nav(
    fixed = FALSE,
    image_source = "https://i.pinimg.com/originals/ff/92/68/ff92685e660a2d347736f44cc7a11d38.jpg",
    background_color = "grey darken-4"
  ),
  
  # Define tabs
  material_tabs(
    color = "orange",
    tabs = c(
      "Card Extensions" = "first_tab",
      "Collections" = "second_tab",
      "Others" = "third_tab",
      "Collapsibles" = "fourth_tab",
      "Timeline" = "fifth_tab",
      "Media" = "sixth_tab"
    )
  ),
  
  material_tab_content(
    tab_id = "first_tab",
    tags$h3("Material Card Extensions"),
    
    
    material_row(
      material_scrollpsy(
        material_scrollpsy_item(target = "part1"),
        material_scrollpsy_item(target = "part2"),
        material_scrollpsy_item(target = "part3")
      ),
      material_column(
        width = 10,
        # Material Card Plus
        div(
          id = "part1", 
          class = "section scrollspy",
          material_row(
            material_column(
              width = 6,
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
            
            # Material Profile card
            material_column(
              width = 6,
              material_profile_card(
                depth = 5,
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
                depth = NULL,
                size = "large",
                activator = TRUE,
                extra = "More info here!",
                image = TRUE,
                src = "https://i.pinimg.com/originals/73/38/6e/73386e0513d4c02a4fbb814cadfba655.jpg",
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
          )
          
        ),

        div(
          id = "part2",
          class = "section scrollspy",
          material_row(
            # always set width to 12
            material_column(
              width = 12,
              # horizontal card
              material_card_horizontal(
                hoverable = TRUE,
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
          )
        ),
        
        # material blog card
        material_row(
          material_column(
            width = 6,
            material_blog_card(
              hoverable = TRUE,
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
        
        
        # material task card
        material_row(
          material_column(
            width = 6,
            material_task_card(
              depth = 5,
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
          
        ),
        
        # material plans
        material_row(
          material_column(
            width = 12,
            material_plans(
              material_plan_item(
                title = "Basic",
                value = "10$",
                subtitle = "Free 1 month",
                url = "http://www.google.com",
                depth = 5,
                color = material_gradient_color()[[15]],
                material_plan_collection(
                  material_plan_collection_item(
                    description = "500 emails"
                  ),
                  material_plan_collection_item(
                    description = "Unlimited data"
                  ),
                  material_plan_collection_item(
                    description = "1 user"
                  )
                )
              ),
              material_plan_item(
                title = "Pro",
                value = "29$",
                subtitle = "Most popular",
                url = "http://www.google.com",
                depth = NULL,
                color = material_gradient_color()[[1]],
                material_plan_collection(
                  material_plan_collection_item(
                    description = "2000 emails"
                  ),
                  material_plan_collection_item(
                    description = "Unlimited data"
                  ),
                  material_plan_collection_item(
                    description = "10 users"
                  )
                )
              ),
              material_plan_item(
                title = "Premium",
                value = "49$",
                subtitle = "Get 20% off",
                url = "http://www.google.com",
                depth = NULL,
                color = material_gradient_color()[[20]],
                material_plan_collection(
                  material_plan_collection_item(
                    description = "10000 emails"
                  ),
                  material_plan_collection_item(
                    description = "Unlimited data"
                  ),
                  material_plan_collection_item(
                    description = "Unlimited user"
                  )
                )
              )
            )
          )
        ),
        
        
        # material stat cards
        material_row(
          material_column(
            width = 4,
            material_stat_card(
              title = "New Clients",
              icon = "add_box",
              value = 566,
              trend = "more",
              subtitle = "15% from yesterday",
              color = "green"
            )
          ),
          material_column(
            width = 4,
            material_stat_card(
              title = "New invoice",
              icon = "assignment",
              value = 12,
              trend = "less",
              subtitle = "3% from yesterday",
              color = "purple"
            )
          ),
          material_column(
            width = 4,
            material_stat_card(
              title = "Costs",
              icon = "add_shopping_cart",
              value = 2345,
              trend = "equal",
              subtitle = "same as yesterday",
              color = "pink"
            )
          )
        ),
        
        
        # material gradient card
        material_row(
          material_column(
            width = 4,
            material_gradient_card(
              src = "https://pixinvent.com/materialize-material-design-admin-template/images/icon/apple-watch.png",
              title = "50% Off",
              subtitle = "On apple watch",
              color = material_gradient_color()[[11]]
            )
          ),
          material_column(
            width = 4,
            material_gradient_card(
              src = "https://pixinvent.com/materialize-material-design-admin-template/images/icon/printer.png",
              title = "20% Off",
              subtitle = "On canon Printer",
              color = material_gradient_color()[[3]]
            )
          ),
          material_column(
            width = 4,
            material_gradient_card(
              src = "https://pixinvent.com/materialize-material-design-admin-template/images/icon/laptop.png",
              title = "40% Off",
              subtitle = "On apple macbook",
              color = material_gradient_color()[[18]]
            )
          )
        ),
        
        
        # material info card
        material_row(
          material_column(
            width = 4,
            material_info_card(
              icon = "timeline",
              title = "Orders",
              value = 690,
              subtitle = "New",
              extra = 6000,
              color = material_gradient_color()[[15]]
            )
          ),
          material_column(
            width = 4,
            material_info_card(
              icon = "timeline",
              title = "Orders",
              value = 690,
              subtitle = "New",
              extra = 6000,
              color = material_gradient_color()[[3]]
            )
          ),
          material_column(
            width = 4,
            material_info_card(
              icon = "timeline",
              title = "Orders",
              value = 690,
              subtitle = "New",
              extra = 6000,
              color = material_gradient_color()[[23]]
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
        width = 6,
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
    tags$h3("Material timeline"),
    
    # Material timeline
    material_row(
      material_column(
        width = 6,
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
    
    # material masonry: only works if elements are wrapped in <div class="col s12 m6 grid">...</div>
    material_row(
      material_masonry(
        effect = masonry_effect_list()[[1]],
        src = "https://pixinvent.com/materialize-material-design-admin-template/images/gallary/5.png",
        caption_1 = "Nice",
        caption_2 = "Lily",
        subcaption = "Lily likes to play with crayons and pencils"
       ),
      material_masonry(
        effect = masonry_effect_list()[[4]],
        src = "https://www.sammobile.com/wp-content/uploads/2017/05/Redscape.png", 
        caption_1 = "Crazy",
        caption_2 = "Layla",
        subcaption = " When Layla appears, she brings an eternal summer along"
      )
    )
    
  )
  
  
  
)

server <- function(input, output) {
  
}
shinyApp(ui = ui, server = server)