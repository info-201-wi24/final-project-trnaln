## change raizel
library(dplyr)
library(ggplot2)
library(plotly)

df <- read.csv("https://raw.githubusercontent.com/info-201-wi24/final-project-trnaln/main/JoinedDataset.csv")

server <- function(input, output){
  
  # TODO Make outputs based on the UI inputs here
  output$viz_1_plot <- renderPlotly({
    viz_1_filtered_df <- df%%
      #filter for user's artist
      filter(artist_name %in% input$artist_selection)
    
    viz_2_plot <- ggplot(data = df) +
      geom_point(mapping =
                   aes(x = artist_name,
                       y = !!as.name(input$viz_1_y_axis),
                       color = overall_pop$artist_pop + track_pop/2,
                       ))
    return(ggplotly(viz_1_plot))
  })
  
}