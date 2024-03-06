## change raizel
library(dplyr)
library(ggplot2)
library(plotly)

df <- read.csv("https://raw.githubusercontent.com/info-201-wi24/final-project-trnaln/main/JoinedDataset.csv")

server <- function(input, output){
  
  # TODO Make outputs based on the UI inputs here
  output$viz_1_plot <- renderPlotly({
    viz_1_filtered_df <- df %>%
      #filter for user's artist
      filter(artist_name %in% input$artist_selection)
      
    
    viz_1_plot <- ggplot(data = viz_1_filtered_df) +
      geom_col(mapping =
                   aes(x = artist_name,
                       y = artist_pop,
                       color = track_name
                       ))
                 
    return(ggplotly(viz_1_plot))
  })
  # viz 2 plot code
  output$viz_2_plot <- renderPlotly({
    viz_2_filtered_df <- df %>%
      # filter for user's track name
      filter(track_name %in% input$track_selection)

  
      viz_2_plot <- ggplot(data = df) +
        geom_point(mapping = 
                     aes(x = track_name,
                         y = !!as.name(input$viz_2_y_axis),
                         color = artist_name,
                         ))
      return(ggplotly(viz_2_plot))
  })
  
  #viz 3 plot code
  output$viz_3_plot <- renderPlotly({
    viz_3_filtered_df <- df %>%
      #group_by(Rank) %>% 
      #filter for the genres of top 100 on the billboard
      filter(Is_Top_100 == TRUE) %>% 
      filter(Genres %in% input$viz_3_x_axis)
    
    viz_3_plot <- ggplot(data = viz_3_filtered_df) +
      geom_col(mapping =
                 aes(x = track_name, #was track_name
                     y = Rank, #was Rank
                     color = Genres)) #was Genres
    
    return(ggplotly(viz_3_plot))
  })
}