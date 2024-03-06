## OVERVIEW TAB INFO
## does this work
## hahah yea
library(dplyr)
library(ggplot2)
library(plotly)
library(bslib)
my_theme <- bs_theme(bg = "#0b3d91", #background
                     fg = "white", #foreground color
                     primary = "#FCC780", # primary color
)
df <- read.csv("https://raw.githubusercontent.com/info-201-wi24/final-project-trnaln/main/JoinedDataset.csv")

overview_tab <- tabPanel("Overview",
   h1("⋆ ˚｡⋆୨୧˚⋆ ˚｡⋆ "),
   p("some explanation")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  selectInput(
    inputId = "viz_1_y_axis",
    label = "Y Axis Choices"
    
  )
  
)

viz_1_main_panel <- mainPanel(
  h2("Artist Popularity"),
  plotlyOutput(outputId = "viz_2_plot")
)

viz_1_tab <- tabPanel("Artist Popularity",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO

viz_2_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_2_main_panel <- mainPanel(
  h2("Vizualization 2 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_2_tab <- tabPanel("Viz 2 tab title",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("Vizualization 3 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_3_tab <- tabPanel("Viz 3 tab title",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion Tab Title",
 h1("Some title"),
 p("some conclusions")
)



ui <- navbarPage("Properties of a Popular Song",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)