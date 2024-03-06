## OVERVIEW TAB INFO
## does this work
## hahah yea
library(dplyr)
library(ggplot2)
library(plotly)

df <- read.csv("https://raw.githubusercontent.com/info-201-wi24/final-project-trnaln/main/JoinedDataset.csv")

viz_2_df_colnames <- colnames(df)

viz_2_df_colnames <- c(
  "Danceability" = "danceability",
  "Energy" = "energy", 
  "Liveness" = "liveness",
  "Valence" = "valence",
  "Tempo" = "tempo"
)

overview_tab <- tabPanel("Overview",
   h1("⋆ ˚｡⋆୨୧˚⋆ ˚｡⋆ "),
   p("some explanation")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_1_main_panel <- mainPanel(
  h2("Vizualization 1 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_1_tab <- tabPanel("Viz 1 tab title",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO

viz_2_sidebar <- sidebarPanel(
  h2("Graph Options"),
  #TODO: Put inputs for modifying graph here
  select_widget <- 
    selectInput(
      inputId = "viz_2_y_axis",
      label = "Y Axis Choices",
      choices = viz_2_df_colnames,
      selected = "tempo"
  )
  
)

viz_2_main_panel <- mainPanel(
  h2("Song Attributes"),
  plotlyOutput(outputId = "viz_2_plot")
)

viz_2_tab <- tabPanel("What Makes up a Song",
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