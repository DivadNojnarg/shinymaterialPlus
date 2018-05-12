library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- shinymaterialPlus::material_page(
  title = "Basic Page",
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
    
    # HTML(
    #   paste0(
    #     '<!-- profile-page-wall -->
    #           <div id="profile-page-wall" class="col s12 m8">
    #     <!-- profile-page-wall-share -->
    #     <div id="profile-page-wall-share" class="row">
    #     <div class="col s12">
    #     <ul class="tabs tab-profile z-depth-1 light-blue">
    #     <li class="tab col s3"><a class="white-text waves-effect waves-light active" href="#UpdateStatus"><i class="mdi-editor-border-color"></i> Update Status</a>
    #     </li>
    #     <li class="tab col s3"><a class="white-text waves-effect waves-light" href="#AddPhotos"><i class="mdi-image-camera-alt"></i> Add Photos</a>
    #     </li>
    #     <li class="tab col s3"><a class="white-text waves-effect waves-light" href="#CreateAlbum"><i class="mdi-image-photo-album"></i> Create Album</a>
    #     </li>                      
    #     </ul>
    #     <!-- UpdateStatus-->
    #     <div id="UpdateStatus" class="tab-content col s12  grey lighten-4">
    #     <div class="row">
    #     <div class="col s2">
    #     <img src="https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-7.png" alt="" class="circle responsive-img valign profile-image-post">
    #     </div>
    #     <div class="input-field col s10">
    #     <textarea id="textarea" row="2" class="materialize-textarea"></textarea>
    #     <label for="textarea" class="">What is on your mind?</label>
    #       </div>
    #       </div>
    #       <div class="row">
    #       <div class="col s12 m6 share-icons">
    #       <a href="#"><i class="mdi-image-camera-alt"></i></a>
    #       <a href="#"><i class="mdi-action-account-circle"></i></a>
    #       <a href="#"><i class="mdi-hardware-keyboard-alt"></i></a>
    #       <a href="#"><i class="mdi-communication-location-on"></i></a>
    #       </div>
    #       <div class="col s12 m6 right-align">
    #       <!-- Dropdown Trigger -->
    #       <a class="dropdown-button btn" href="#" data-activates="profliePost"><i class="mdi-action-language"></i> Public</a>
    #       
    #       <!-- Dropdown Structure -->
    #       <ul id="profliePost" class="dropdown-content">
    #       <li><a href="#!"><i class="mdi-action-language"></i> Public</a></li>
    #       <li><a href="#!"><i class="mdi-action-face-unlock"></i> Friends</a></li>                              
    #       <li><a href="#!"><i class="mdi-action-lock-outline"></i> Only Me</a></li>
    #       </ul>
    #       
    #       <a class="waves-effect waves-light btn"><i class="mdi-maps-rate-review left"></i>Post</a>
    #       </div>
    #       </div>
    #       </div>
    #       <!-- AddPhotos -->
    #       <div id="AddPhotos" class="tab-content col s12  grey lighten-4">
    #       <div class="row">
    #       <div class="col s2">
    #       <img src="images/avatar.jpg" alt="" class="circle responsive-img valign profile-image-post">
    #       </div>
    #       <div class="input-field col s10">
    #       <textarea id="textarea" row="2" class="materialize-textarea"></textarea>
    #       <label for="textarea" class="">Share your favorites photos!</label>
    #       </div>
    #       </div>
    #       <div class="row">
    #       <div class="col s12 m6 share-icons">
    #       <a href="#"><i class="mdi-image-camera-alt"></i></a>
    #       <a href="#"><i class="mdi-action-account-circle"></i></a>
    #       <a href="#"><i class="mdi-hardware-keyboard-alt"></i></a>
    #       <a href="#"><i class="mdi-communication-location-on"></i></a>
    #       </div>
    #       <div class="col s12 m6 right-align">
    #       <!-- Dropdown Trigger -->
    #       <a class="dropdown-button btn" href="#" data-activates="profliePost2"><i class="mdi-action-language"></i> Public</a>
    #       
    #       <!-- Dropdown Structure -->
    #       <ul id="profliePost2" class="dropdown-content">
    #       <li><a href="#!"><i class="mdi-action-language"></i> Public</a></li>
    #       <li><a href="#!"><i class="mdi-action-face-unlock"></i> Friends</a></li>                              
    #       <li><a href="#!"><i class="mdi-action-lock-outline"></i> Only Me</a></li>
    #       </ul>
    #       
    #       <a class="waves-effect waves-light btn"><i class="mdi-maps-rate-review left"></i>Post</a>
    #       </div>
    #       </div>
    #       </div>
    #       <!-- CreateAlbum -->
    #       <div id="CreateAlbum" class="tab-content col s12  grey lighten-4">
    #       <div class="row">
    #       <div class="col s2">
    #       <img src="images/avatar.jpg" alt="" class="circle responsive-img valign profile-image-post">
    #       </div>
    #       <div class="input-field col s10">
    #       <textarea id="textarea" row="2" class="materialize-textarea"></textarea>
    #       <label for="textarea" class="">Create awesome album.</label>
    #       </div>
    #       </div>
    #       <div class="row">
    #       <div class="col s12 m6 share-icons">
    #       <a href="#"><i class="mdi-image-camera-alt"></i></a>
    #       <a href="#"><i class="mdi-action-account-circle"></i></a>
    #       <a href="#"><i class="mdi-hardware-keyboard-alt"></i></a>
    #       <a href="#"><i class="mdi-communication-location-on"></i></a>
    #       </div>
    #       <div class="col s12 m6 right-align">
    #       <!-- Dropdown Trigger -->
    #       <a class="dropdown-button btn" href="#" data-activates="profliePost3"><i class="mdi-action-language"></i> Public</a>
    #       
    #       <!-- Dropdown Structure -->
    #       <ul id="profliePost3" class="dropdown-content">
    #       <li><a href="#!"><i class="mdi-action-language"></i> Public</a></li>
    #       <li><a href="#!"><i class="mdi-action-face-unlock"></i> Friends</a></li>                              
    #       <li><a href="#!"><i class="mdi-action-lock-outline"></i> Only Me</a></li>
    #       </ul>
    #       
    #       <a class="waves-effect waves-light btn"><i class="mdi-maps-rate-review left"></i>Post</a>
    #       </div>
    #       </div>
    #       </div>
    #       </div>
    #       </div>
    #       <!--/ profile-page-wall-share -->
    #     '
    #   )
    # ),
    # 
    # HTML(
    #   paste0(
    #     '<div id="profile-page-wall-post" class="card">
    #                     <div class="card-profile-title">
    #     <div class="row">
    #     <div class="col s1">
    #     <img src="https://pixinvent.com/materialize-material-design-admin-template/images/avatar/avatar-7.png" alt="" class="circle responsive-img valign profile-post-uer-image">                        
    #     </div>
    #     <div class="col s10">
    #     <p class="grey-text text-darken-4 margin">John Doe</p>
    #     <span class="grey-text text-darken-1 ultra-small">Shared publicly  -  26 Jun 2015</span>
    #     </div>
    #     <div class="col s1 right-align">
    #     <i class="mdi-navigation-expand-more"></i>
    #     </div>
    #     </div>
    #     <div class="row">
    #     <div class="col s12">
    #     <p>I am a very simple wall post. I am good at containing <a href="#">#small</a> bits of <a href="#">#information</a>.  I require little more information to use effectively.</p>
    #     </div>
    #     </div>
    #     </div>
    #     <div class="card-image profile-medium">                          
    #     <img src="https://pixinvent.com/materialize-material-design-admin-template/images/gallary/26.png" alt="sample" class="responsive-img profile-post-image profile-medium">                        
    #     <span class="card-title">Card Title</span>
    #     </div>
    #     <div class="card-content">
    #     <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
    #     </div>
    #     <div class="card-action row">
    #     <div class="col s4 card-action-share">
    #     <a href="#">Like</a>                          
    #     <a href="#">Share</a>
    #     </div>
    #     
    #     <div class="input-field col s8 margin">
    #     <input id="profile-comments" type="text" class="validate margin">
    #     <label for="profile-comments" class="">Comments</label>
    #     </div>                        
    #     </div>                        
    #     </div>
    #     '
    #   )
    # ),
    # 
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
    # ),
    # 
    # HTML(
    #   paste0(
    #     '<!-- task-card -->
    #             <ul id="task-card" class="collection with-header">
    #     <li class="collection-header cyan">
    #     <h4 class="task-card-title">My Task</h4>
    #     <p class="task-card-date">March 26, 2015</p>
    #     </li>
    #     <li class="collection-item dismissable">
    #     <input type="checkbox" id="task1" />
    #     <label for="task1">Create Mobile App UI. <a href="#" class="secondary-content"><span class="ultra-small">Today</span></a>
    #     </label>
    #     <span class="task-cat teal">Mobile App</span>
    #     </li>
    #     <li class="collection-item dismissable">
    #     <input type="checkbox" id="task2" />
    #     <label for="task2">Check the new API standerds. <a href="#" class="secondary-content"><span class="ultra-small">Monday</span></a>
    #     </label>
    #     <span class="task-cat purple">Web API</span>
    #     </li>
    #     <li class="collection-item dismissable">
    #     <input type="checkbox" id="task3" checked="checked" />
    #     <label for="task3">Check the new Mockup of ABC. <a href="#" class="secondary-content"><span class="ultra-small">Wednesday</span></a>
    #     </label>
    #     <span class="task-cat pink">Mockup</span>
    #     </li>
    #     <li class="collection-item dismissable">
    #     <input type="checkbox" id="task4" checked="checked" disabled="disabled" />
    #     <label for="task4">I did it !</label>
    #     <span class="task-cat cyan">Mobile App</span>
    #     </li>
    #     </ul>
    #     <!-- task-card -->
    #     '
    #   )
    # )
    
  )
  
  
  
  
  
  
  
)

server <- function(input, output) {
  
}
shinyApp(ui = ui, server = server)