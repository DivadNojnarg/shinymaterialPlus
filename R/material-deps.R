# Add an html dependency, without overwriting existing ones
appendDependencies <- function(x, value) {
  if (inherits(value, "html_dependency"))
    value <- list(value)
  
  old <- attr(x, "html_dependencies", TRUE)
  
  htmltools::htmlDependencies(x) <- c(old, value)
  x
}

# Add dashboard dependencies to a tag object
addDeps <- function(x) {
  
  # put all necessary ressources here
  materialize_css <- "materialize.min.css"
  materialize_js <- "materialize.min.js"
  
  # specific ressources
  timeline_css <- "timeline.css"
  carousel_js <- "carousel.js"
  carousel_slider_js <- "carousel-slider.js"
  media_js <- "media.js"
  collapsible_js <- "collapsible.js"
  collapsible_expandable_js <- "collapsible-expandable.js"
  material_page_css <- "shiny-material-page.css"
  material_page_js <- "shiny-material-page.js"
  init_js <- "init.js"
  
  materializeDeps <- list(
    # jquery UI deps for sortable elements
    htmltools::htmlDependency(
      name = "materialize", 
      version = "1.0.0",
      src = c(file = system.file("materialize-1.0.0", package = "shinymaterialPlus")),
      script = materialize_js,
      stylesheet = materialize_css
    ),
    # shinymaterialPlus deps
    htmltools::htmlDependency(
      name = "shinymaterialPlus", 
      version = "0.1.0",
      src = c(file = system.file("shinymaterialPlus-0.1.0", package = "shinymaterialPlus")),
      script = c(
        carousel_js,
        carousel_slider_js,
        media_js,
        collapsible_js,
        collapsible_expandable_js,
        material_page_js,
        init_js
      ),
      stylesheet = c(timeline_css, material_page_css)
    )
  )
  appendDependencies(x, materializeDeps)
}