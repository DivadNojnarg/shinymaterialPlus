#' Create a material task card
#'
#' @param ... Slot for material_task_item.
#' @param title Task card title.
#' @param date Task card date.
#' @param color Task header color.
#' 
#' @examples
#' material_task_card(
#'   title = "Task Card",
#'   date = "14 may 2018",
#'   color = "cyan",
#'   material_task_item(
#'    id = 1, 
#'    name = "task 1", 
#'    date = "today",
#'    tag_name = "tag", 
#'    tag_color = "red",
#'    checked = FALSE, 
#'    disabled = FALSE
#'   ),
#'   material_task_item(
#'    id = 2, 
#'    name = "task 2", 
#'    date = "today",
#'    tag_name = "tag", 
#'    tag_color = "orange",
#'    checked = TRUE, 
#'    disabled = FALSE
#'   )
#' )
#' @export
material_task_card <- function(..., title = NULL, date = NULL, color = NULL) {
  shiny::tags$ul(
    id = "task-card",
    class = "collection with-header",
    shiny::tags$li(
      class = paste("collection-header", color),
      shiny::tags$h4(class = "task-card-title", title),
      shiny::tags$p(class = "task-card-date", date)
    ),
    ...
  )
}



#' Create a material task item
#'
#' @param id Task id. Should be unique.
#' @param name Task name.
#' @param date Task date.
#' @param tag_name Task tag name.
#' @param tag_color Taks tag color.
#' @param checked Whether the task is checked or not at start.
#' @param disabled Whether the task is disabled. Useful for old tasks.
#' 
#' @export
material_task_item <- function(id, name = NULL, date = NULL,
                               tag_name = NULL, tag_color = NULL,
                               checked = FALSE, disabled = FALSE) {
  
  checkboxTag <- shiny::tags$input(
    type = "checkbox", 
    id = id
  )
  
  if (isTRUE(checked)) checkboxTag$attribs$checked <- "checked"
  if (isTRUE(disabled)) checkboxTag$attribs$disabled <- "disabled"
  
  stopifnot(!is.null(id))
  
  shiny::tags$li(
    class = "collection-item dismissable",
    style = "-webkit-user-drag: none;",
    checkboxTag,
    shiny::tags$label(
      `for` = id,
      style = if (isTRUE(checked)) "text-decoration: line-through;" else "text-decoration: none;",
      name,
      shiny::tags$a(
        href = "#",
        class = "secondary-content",
        shiny::tags$span(class = "ultra-small", date)
      )
      
    ),
    shiny::tags$span(class = paste("task-cat", tag_color,"accent-4"), tag_name)
  )
}
