#' Create a badge
#'
#' UI content that can be placed everywhere
#' @param content Badge content.
#' @param type Badge type. NULL by default, can be set as "new".
#' @param color Badge color. NULL by default. Visit http://materializecss.com/color.html for a list of available colors.
#' @param custom_caption Whether to enable custom captions or not. FALSE by default.
#' @examples
#' material_badge(
#'  content = "1",
#'  type = "new"
#' )
#' @export
material_badge <- function(content = NULL, type = NULL, color = NULL,
                           custom_caption = FALSE) {
  cl <- "badge"
  if (!is.null(type)) cl <- paste(type, cl)
  if (!is.null(color)) cl <- paste(cl, color)
  
  shiny::tags$span(
    class = cl, 
    `data-badge-caption` = if (isTRUE(custom_caption)) "custom caption" else NULL,
    content
  )
}




#' Create a shinymaterial button
#'
#' Build a shinymaterial button. The initial value is zero, and increases by one on each press.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The button text.
#' @param icon String. The name of the icon. Leave empty for no icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param depth Integer. The amount of depth of the button. The value should be between 0 and 5. Leave empty for the default depth. 
#' @param color String. The color of the button. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param pulse Whether to enable pulse effect on the button. FALSE by default.
#' @param floating Whether to display a round button or not. FALSE by default: Works well with pulse.
#' @param size Button size. "medium" by default: "small" and "large" available.
#' @param disabled Whether to disable the button. FALSE by default.
#' @examples
#' material_button(
#'   input_id = "example_button",
#'   label = "Button",
#'   icon = "cloud",
#'   depth = 5,
#'   color = "blue lighten-2"
#' )
#' @export
material_button <- function(input_id, label, icon = NULL, depth = NULL, color = NULL,
                            pulse = FALSE, floating = FALSE, size = NULL, disabled = FALSE) {
  
  if(!is.null(icon)){
    icon_tag <-
      shiny::HTML(
        paste0(
          '<i class="material-icons left">',
          icon,
          '</i>')
      )
  } else {
    icon_tag <- NULL
  }
  
  create_material_object(
    js_file =
      "shiny-material-button.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$button(
          class = 
            paste0(
              "waves-effect waves-light shiny-material-button",
              ifelse(
                !isTRUE(floating),
                " btn",
                paste0(" ", "btn-floating")
              ),
              ifelse(
                is.null(depth),
                "",
                paste0(" z-depth-", depth)
              ),
              ifelse(
                is.null(color),
                "",
                paste0(" ", color)
              ),
              ifelse(
                !isTRUE(pulse),
                "",
                paste0(" ", "pulse")
              ),
              ifelse(
                is.null(size),
                "",
                paste0(" btn-", size)
              ),
              ifelse(
                !isTRUE(disabled),
                "",
                paste0(" ", "disabled")
              )
            ),
          id = input_id,
          value = 0,
          icon_tag,
          label
        )
      )
  )
}




#' Create a collapsible element
#' 
#' @param ... slot for material_collapsible_item.
#' @param type Collapse behavior. NULL by default (accordion). Can also be "expandable" or "popout".
#' 
#' @note expandable does not work at the moment.
#'
#' @examples
#' material_collapsible(
#'  material_collapsible_item(
#'   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
#'   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
#'   Ut enim ad minim veniam, quis nostrud exercitation ullamco 
#'   laboris nisi ut aliquip ex ea commodo consequat",
#'   header = "First",
#'   active = TRUE
#'  ),
#'  material_collapsible_item(
#'   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
#'   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
#'   Ut enim ad minim veniam, quis nostrud exercitation ullamco 
#'   laboris nisi ut aliquip ex ea commodo consequat",
#'   header = "Second"
#'  ),
#'  material_collapsible_item(
#'   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
#'   sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
#'   Ut enim ad minim veniam, quis nostrud exercitation ullamco 
#'   laboris nisi ut aliquip ex ea commodo consequat",
#'   header = "Third"
#'  )
#' )
#' @export
material_collapsible <- function(..., type = NULL) {
  
  collapsibleCl <- "collapsible"
  if (!is.null(type)) collapsibleCl <- paste(collapsibleCl, type)
  
  collapsibleTag <- shiny::tags$ul(
    class = collapsibleCl,
    ...
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        if (is.null(type)) {
          shiny::tags$script(
            system.file(file.path("js", "collapsible.js"), package = "shinymaterialPlus")
          )
        }
        else {
          shiny::tags$script(
            system.file(file.path("js", "collapsible-expandable.js"), package = "shinymaterialPlus")
          )
        }
      )
    ),
    collapsibleTag
  )
  
}


#' Create a collapsible item
#'
#' @param ... Body content.
#' @param header Item title.
#' @param icon Item icon, if any.
#' @param active Whether the item is active or not. FALSE by default.
#' 
#' @export
material_collapsible_item <- function(..., header = NULL, icon = NULL, active = FALSE) {
  shiny::tags$li(
    class = if (isTRUE(active)) "active" else NULL,
    shiny::tags$div(
      class = "collapsible-header", 
      shiny::tags$i(class = "material-icons", icon), 
      header
    ),
    shiny::tags$div(class = "collapsible-body", shiny::tags$span(...))
  )
}




#' Create a collection
#'
#' @param ... slot for material_collection_item or material_collection_header or material_collection_avatar.
#' @param header Whether to enable material_collection_header. FALSE by default.
#' @param depth Collection depth. Value between 0 and 5.
#' 
#' @examples
#' material_collection(
#'   header = TRUE,
#'   material_collection_header(
#'    title = "item 1"
#'   ),
#'   material_collection_item(
#'    active = TRUE,
#'    "This is the item content",
#'    secondary_content = material_badge(
#'     content = "Secondary content", 
#'     color = "red"
#'    )
#'   ),
#'   material_collection_avatar(
#'    src = "https://materializecss.com/images/yuna.jpg",
#'    title = "Title",
#'    content = "This is the content"
#'   )
#' )
#' @export
material_collection <- function(..., header = FALSE, depth = NULL) {
  
  collectionCl <- "collection"
  if (isTRUE(header)) collectionCl <- paste0(collectionCl, " with-header")
  if (!is.null(depth)) collectionCl <- paste0(collectionCl, " z-depth-", depth)
  
  shiny::tags$ul(
    class = collectionCl,
    ...
  )
}


#' Create a collection item
#'
#' @param ... item content.
#' @param active Whether the item is active or not. FALSE by default.
#' @param secondary_content Secondary content if any. Displayed on the right side.
#' 
#' @export
material_collection_item <- function(..., active = FALSE,
                                     secondary_content = NULL) {
  
  collectionItemCl <- "collection-item"
  if (isTRUE(active)) collectionItemCl <- paste0(collectionItemCl, " active")
  
  shiny::tags$li(
    class = collectionItemCl,
    shiny::tags$div(
      ...,
      shiny::tags$a(
        href = "#!",
        class = "secondary-content",
        secondary_content
      )
    )
  )
}

#' Create a collection header
#'
#' @param title Header content.
#' 
#' @export
material_collection_header <- function(title = NULL) {
  
  shiny::tags$li(
    class = "collection-header",
    shiny::tags$h4(title)
  )
}


#' Create a collection avatar
#'
#' @param src Avatar image path or url.
#' @param title Avatar title.
#' @param content Content, if any.
#' @param secondary_content Secondary content if any. Displayed on the right side.
#' 
#' @export
material_collection_avatar <- function(src = NULL, title = NULL, content = NULL,
                                       secondary_content = NULL) {
  shiny::tags$li(
    class = "collection-item avatar",
    shiny::tags$img(class = "circle", src = src),
    shiny::tags$span(class = "title", title),
    shiny::tags$br(),
    content,
    shiny::tags$a(
      href = "#!",
      class = "secondary-content",
      secondary_content
    )
  )
}





#' Create a material icon
#'
#' @param name Icon to display. Choose here: https://materializecss.com/icons.html.
#' @param circle Whether to circle the icon. FALSE by default.
#' @param color Icon color. Use when circle is TRUE. Visit http://materializecss.com/color.html for a list of available colors.
#' @param position Icon position. NULL, "right" or "left".
#' @param closable Whether the icon is closable or not. Perfect to be insert in material_chip.
#' @param size Icon size: "tiny", "small", "medium" or "large".
#' 
#' @examples
#' material_icon(
#'  name = "add"
#' )
#' @export
material_icon <- function(name, circle = FALSE, color = NULL,
                          position = NULL, closable = FALSE,
                          size = NULL) {
  
  iconCl <- "material-icons"
  if (isTRUE(circle)) iconCl <- paste0(iconCl, " circle")
  if (!is.null(color)) iconCl <- paste(iconCl, color)
  if (!is.null(position)) iconCl <- paste(iconCl, position)
  if (isTRUE(closable)) iconCl <- paste(iconCl, " close")
  if (!is.null(size)) iconCl <- paste(iconCl, size)
  
  shiny::tags$i(
    class = iconCl,
    name
  )
}




#' Create an horizontal loader
#'
#' @examples
#' material_loader()
#' @export
material_loader <- function() {
  shiny::tags$div(
    class = "progress",
    shiny::tags$div(
      class = "indeterminate", 
      style = "width : 70%"
    )
  )
}




#' Create a material progress bar
#'
#' @param main_color Progress color. NULL by default. Visit http://materializecss.com/color.html for a list of available colors.
#' @param value Progress value (between 0 and 100)
#' @param secondary_color Progress secondary color. Represents the 100-value part. NULL by default. Visit http://materializecss.com/color.html for a list of available colors.
#' 
#' @examples
#' material_progress(
#'  value = "70%"
#' )
#' @export
material_progress <- function(main_color = NULL, value = "50",
                              secondary_color = NULL) {
  
  progressCl <- paste("progress", secondary_color)
  
  shiny::tags$div(
    class = progressCl,
    shiny::tags$div(
      class = paste("determinate", main_color),
      style = paste0("width: ", value, "%")
    )
  )
}




#' Create a material scrollspy
#'
#' @param ... Slot for material_scrollspy_item.
#' 
#' @examples
#' material_scrollspy(
#'  material_scrollspy_item(target = "part1"),
#'  material_scrollspy_item(target = "part2"),
#'  material_scrollspy_item(target = "part3")
#' )
#' @export
material_scrollspy <- function(...) {
  shiny::tags$div(
    class = "col hide-on-small-only m3 l2",
    shiny::tags$div(
      class = "toc-wrapper pinned",
      style = "top: 400px;",
      shiny::tags$ul(
        style = "top: 200px;",
        class = "section table-of-contents",
        ...
      )
    )
  )
}


#' Create a material scrollspy item
#'
#' @param target id element to target. The target should be wrap in a div(id = ..., ).
#' 
#' @export
material_scrollspy_item <- function(target = NULL) {
  shiny::tags$li(
    shiny::tags$a(href = paste0("#", target), target)
  )
}