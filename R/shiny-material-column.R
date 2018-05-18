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