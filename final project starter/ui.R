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

viz_2_df_colnames <- colnames(df)

viz_2_df_colnames <- c(
  "Danceability" = "danceability",
  "Energy" = "energy", 
  "Liveness" = "liveness",
  "Valence" = "valence",
  "Tempo" = "tempo"
)

viz_3_df_colnames <- colnames(df)

viz_3_df_colnames <- c(
  "Genres" = "Genres",
  "Artist" = "artist_name",
  "Song" = "track_name",
  "Rank" = "Rank"
)

overview_tab <- tabPanel("Overview",
   h1("Introduction "),
   p("Music is an art heavily integrated with advancing technology, and TikTok’s growing popularity on 
     mainstream media has given rise to the popularity of various artists, songs, and genres. TikTok’s 
     algorithm and marketability have caused many artists to quickly gain recognition, and smaller, underground
     artists are given the opportunity to gain more listeners. This project analyzes the attributes that popular
     songs tend to have in common in order to gain a better understanding of why certain songs have a meteoric
     rise on TikTok and to be able to visualize the correlation between viral songs and artist popularity."),
   h1("Questions"),
   p("1. What properties do popular songs on TikTok and top charting songs have? How do they differ?"),
   p("2. What is the song attribute that tends to be the most effective in captivating its listeners?"),
   p("3. Could there be a way to predict if a song would become popular?"),
   p("4. To what extent does genre influence what songs might become popular overall?"),
   p("5. Does an artist’s popularity influence what songs might become popular on TikTok?"),
   p("6. Can niche genres find their way to emerge to create their own space in the music industry or do they melt into a larger genre?"),
   h1("Data Collection"),
   p("This project's data is collected through Spotify's API and Billboard Top 100 Charts from 2022-2023.")
   
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  selectInput(
    inputId = "artist_selection",
    label = "X Axis Choices",
    choices = df$artist_name,
    multiple = TRUE
  )
  
)

viz_1_main_panel <- mainPanel(
  h2("Artist Popularity"),
  plotlyOutput(outputId = "viz_1_plot")
)

viz_1_tab <- tabPanel("Artist Popularity",
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
#Bar plot, 
#x = song title, 
#y = rank in the top 100 (inverse, 1 has the top value), 
#interactive = interactive is checking which genres are in the top 100, 

viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
  select_widget <-
    selectInput(
    inputId = "viz_3_x_axis",
    label = "X Axis Choices",
    choices = df$Genres,
    multiple = TRUE,
    #selected = "Rock"
  )
)

viz_3_main_panel <- mainPanel(
  h2("Vizualization 3 Title"),
  plotlyOutput(outputId = "viz_3_plot")
)

viz_3_tab <- tabPanel("Viz 3 tab title",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion",
  h1("1. What properties do popular songs on TikTok and top charting songs have? How do they differ?"),
  h1("2. What is the song attribute that tends to be the most effective in captivating its listeners?"),
  h1("3. Could there be a way to predict if a song would become popular?"),
  h1("4. To what extent does genre influence what songs might become popular overall?"),
  h1("5. Does an artist’s popularity influence what songs might become popular on TikTok?"),
  h1("6. Can niche genres find their way to emerge to create their own space in the music industry or do they melt into a larger genre?"),
          
)



ui <- navbarPage("Properties of a Popular Song",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)