#' Create a material blockquote
#'
#' @param ... Any element, such as text.
#' 
#' @examples
#' material_blockquote(
#'  "This is an example quotation that uses the blockquote tag."
#' )
#' @export
material_blockquote <- function(...) {
  shiny::tags$blockquote(...)
}



#' Create a column to organize UI content
#'
#' UI content can be placed in columns to organize items on a page.
#' @param ... The UI elements to place in the column.
#' @param s_width Integer. The width of the column on mobile devices (<= 600px). The value should be between 1 and 12.
#' @param m_width Integer. The width of the column on tablet devices (> 600px). The value should be between 1 and 12.
#' @param l_width Integer. The width of the column on desktop devices (> 992px). The value should be between 1 and 12.
#' @param xl_width Integer. The width of the column on large desktop devices (> 1200px). The value should be between 1 and 12.
#' @param offset Integer. The offset to the left of the column. The value should be between 0 and 11.
#' @examples
#' material_column(
#'   shiny::tags$h1("Column Content")
#' )
#' @export
material_column <- function(..., s_width = 12, m_width = 6, 
                            l_width = 6, xl_width = 6, offset = 0){
  
  cl <- "col"
  if (!is.null(s_width)) cl <- paste0(cl, " s", s_width)
  if (!is.null(m_width)) cl <- paste0(cl, " m", m_width)
  if (!is.null(l_width)) cl <- paste0(cl, " l", l_width)
  if (!is.null(xl_width)) cl <- paste0(cl, " s", xl_width)
  
  shiny::tags$div(
    class = paste0(cl, " offset-s0 offset-m", offset),
    ...
  )
}




#' Create a material container div
#'
#' To center elements inside
#' @param ... Any UI element.
#' @examples
#' material_container(
#'  material_card(
#'   title = "Example Card",
#'   depth = 5,
#'   shiny::tags$h5("Card Content")
#'  )
#' )
#' @export
material_container <- function(...) {
  shiny::tags$div(class = "container", ...)
} 




#' Create an horizontal divider
#'
#' @note Perfect to insert in a card.
#' 
#' @examples
#' material_divider()
#' 
#' @export
material_divider <- function() {
  shiny::tags$div(class = "divider mt-5")
}