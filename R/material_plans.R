#' Create a material plan
#'
#' @param ... Slot for material_plan_item.
#' 
#' @examples
#' material_plans(
#'  nb_plan = 3,
#'  material_plan_item(
#'   title = "Basic",
#'   value = "10$",
#'   subtitle = "Free 1 month",
#'   url = "http://www.google.com",
#'   depth = 5,
#'   color = material_gradient_color()[[15]],
#'   material_plan_collection(
#'    material_plan_collection_item(
#'    description = "500 emails"
#'    ),
#'    material_plan_collection_item(
#'    description = "Unlimited data"
#'    ),
#'    material_plan_collection_item(
#'    description = "1 user"
#'    )
#'   )
#'  ),
#'  material_plan_item(
#'   title = "Pro",
#'   value = "29$",
#'   subtitle = "Most popular",
#'   url = "http://www.google.com",
#'   depth = NULL,
#'   color = material_gradient_color()[[4]],
#'   material_plan_collection(
#'    material_plan_collection_item(
#'    description = "2000 emails"
#'    ),
#'    material_plan_collection_item(
#'    description = "Unlimited data"
#'    ),
#'    material_plan_collection_item(
#'    description = "10 users"
#'    )
#'   )
#'  ),
#'  material_plan_item(
#'   title = "Premium",
#'   value = "49$",
#'   subtitle = "Get 20% off",
#'   url = "http://www.google.com",
#'   depth = NULL,
#'   color = material_gradient_color()[[20]],
#'   material_plan_collection(
#'    material_plan_collection_item(
#'    description = "10000 emails"
#'    ),
#'    material_plan_collection_item(
#'    description = "Unlimited data"
#'    ),
#'    material_plan_collection_item(
#'    description = "Unlimited user"
#'    )
#'   )
#'  )
#' )
#' @export
material_plans <- function(...) {
  
  shiny::tags$section(
    class = "plans-container",
    id = "plans",
    ...
  )
}



#' Create a material plan item
#'
#' @param ... Slot for material_plan_collection
#' @param nb_plan Number of material_plan_item.
#' @param title Item title.
#' @param value Item subtitle.
#' @param subtitle Item subtitle.
#' @param url Item external link.
#' @param depth Item depth. Between 0 and 5. NULL by default.
#' @param color Item color. Use the function material_gradient_color() to have the full list.
#' 
#' @export
material_plan_item <- function(..., nb_plan = 3, title = NULL, value = NULL, subtitle = NULL, 
                               url = NULL, depth = NULL, color = NULL) {
  
  stopifnot(!nb_plan == 12)
  
  width_col <- 12/nb_plan
  
  cl <- "card hoverable"
  if (!is.null(depth)) cl <- paste0(cl, " z-depth-", depth)
  
  headerCl <- "card-image waves-effect"
  if (!is.null(color)) headerCl <- paste(headerCl, color)
  
  shiny::tags$article(
    class = paste0("col s12 m6 l", width_col),
    shiny::tags$div(
      class = cl,
      
      # header
      shiny::tags$div(
        class = headerCl,
        shiny::tags$div(class = "card-title", title),
        shiny::tags$div(class = "price", value),
        shiny::tags$div(class = "price-desc", subtitle)
      ),
      
      # content
      shiny::tags$div(
        class = "card-content",
        ...
      ),
      
      # footer
      shiny::tags$div(
        class = "card-action center-align",
        shiny::tags$a(href = url, "More")
      )
      
    )
  )
  
}




#' Create a material plan collection
#'
#' @param ... Slot for material_plan_collection_item
#' 
#' @export
material_plan_collection <- function(...) {
  shiny::tags$ul(
    class = "collection",
    ...
  )
}



#' Create a material plan collection item
#'
#' @param description Item description.
#' 
#' @export
material_plan_collection_item <- function(description = NULL) {
  shiny::tags$li(
    class = "collection-item",
    description
  )
}