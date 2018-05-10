library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- shinymaterialPlus::material_page(
  title = "Basic Page",
  tags$h1("Page Content"),
  nav_bar_color = "blue",
  
  material_row(
    material_column(
      width = 6,
      material_card(
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
        shiny::tags$span(class = "new badge", "1"),
        activator = TRUE,
        extra = "More info here!",
        color = "deep_orange",
        image = TRUE,
        src = "http://www.oxygenna.com/wp-content/uploads/2015/11/18.jpg"
      ) 
    )
  )
  
)

server <- function(input, output) {
  
}
shinyApp(ui = ui, server = server)