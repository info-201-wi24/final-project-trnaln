## OVERVIEW TAB INFO
## does this work
## hahah yea
library(dplyr)
library(ggplot2)
library(plotly)
library(bslib)
library(markdown)
my_theme <- bs_theme(bg = "#29293D", #background
                     fg = "ivory", #foreground color
                     primary = "white", # primary color
)
df <- read.csv("https://raw.githubusercontent.com/info-201-wi24/final-project-trnaln/main/JoinedDataset.csv")

viz_2_df_colnames <- colnames(df)

viz_2_df_colnames <- c(
  "Danceability" = "danceability",
  "Energy" = "energy", 
  "Valence" = "valence",
  "Tempo" = "tempo"
)

overview_tab <- tabPanel("Overview",
   img(src = "https://nebula.wsimg.com/01358800cfc7d5690ef6fed948780c80?AccessKeyId=90A1D62ACD57AE5D8697&disposition=0&alloworigin=1"),
   h1("Introduction"),
   #img(src = "https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/TikTok_logo.svg/1200px-TikTok_logo.svg.png"),
   #img(src = "https://organicmusicmarketing.com/cdn/shop/articles/billboard_hot_100.png?v=1675781632&width=2048"),
   p("Music is an art heavily integrated with advancing technology, and TikTok’s growing popularity on 
     mainstream media has given rise to the popularity of various artists, songs, and genres. TikTok’s 
     algorithm and marketability have caused many artists to quickly gain recognition, and smaller, underground
     artists are given the opportunity to gain more listeners. This project analyzes the attributes that popular
     songs tend to have in common in order to gain a better understanding of why certain songs have a meteoric
     rise on TikTok and to be able to visualize the correlation between viral songs and artist popularity."),
   h1("Questions"),
   p("1. Does an artist’s popularity influence what songs might become popular on TikTok?"),
   p("2. What is the song attribute that tends to be the most effective in captivating its listeners?"),
   p("3. To what extent does genre influence what songs might become popular overall?"),

   h1("Data Collection"),
   p("This project's data is collected through Spotify's API and Billboard Top 100 Charts from 2022-2023.
   TikTok Song DataSet: https://www.kaggle.com/code/antoniosabatini/tiktok-popularity-track-eda-ml-models/input.
   Billboard Top 100 Songs: https://www.kaggle.com/datasets/calebpool/billboard-top-100-artist-week-of-2182023 ."),
   p("There were no ethical review processes conducted in the collection of the dataset. This prject's data is limited
     to song on TikTok and Billboard Top 100 songs. It is not an accurate representation of user populations outside of TikTok and Spotify."),
   img(src = "https://i.pinimg.com/originals/1d/28/86/1d288661840f89f7ece0d1b72f2289ee.gif")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Does an artist’s popularity influence what songs might become popular on TikTok?"),
  p("This graph shows how popular an artist is and how many tracks they have trending on TikTok."),
  selectInput(
    inputId = "artist_selection",
    label = "Select an artist to view their overall popularity:",
    choices = df$artist_name,
    multiple = TRUE
  )
  
)

viz_1_main_panel <- mainPanel(
  h2("Trending Artists and Songs on TikTok"),
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
  h2("Attribute Options"),
  #TODO: Put inputs for modifying graph here
  select_widget <- 
    selectInput(
      inputId = "viz_2_y_axis",
      label = "Select Attribute:",
      choices = viz_2_df_colnames,
      selected = "tempo"
  ),
  p("This graph displays the certain attributes that make up a song, ranging from tempo to valence. Songs are seperated by their track name.")
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
#Bar Plot
#x = song title
#y = rank in the top 100
#interactive - interactive is checking which genres are in the top 100
viz_3_sidebar <- sidebarPanel(
  h2("Trends in Genres"),
  #TODO: Put inputs for modifying graph here
  select_widget <- 
    selectInput(
      inputId = "viz_3_x_axis",
      label = "Select a Genre:",
      choices = df$Genres,
      multiple = TRUE
    ),
  p("This graph displays the amount of songs under certain genres if selected. Only includes genres
    and songs that appear in the Billboard Top 100.")
)

viz_3_main_panel <- mainPanel(
  h2("Tracks in the Top 100 v. Rank"),
  plotlyOutput(outputId = "viz_3_plot"),
)

viz_3_tab <- tabPanel("Genres in the Top 100",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion",
  strong("Does an artist’s popularity influence what songs might become popular on TikTok?"),
  p("An artist's popularity correlates with the amount of songs they have trending on TikTok. Artists with a 
  high popularity tend to have more trending TikTok songs. Drake has the highest popularity score of ninety-five
  and Pia Baris has the lowest popularity score of eighteen. Drake has two trending TikTok songs, “Jimmy Cooks
  (ft. 21 Savage)” and “Toosie Slide”, while Pia Baris only has one song, “Red Flag”. However, artist popularity
  can only contribute so much, and there are other underlying characteristics that make up a popular song. For
  example, Doja Cat only has a popularity rating of 80, but she has eight trending songs: “Ain’t Shit”, “Boss 
  Bitch”, “Freak”, “Kiss Me More (ft. SZA)”, “Need to Know”, “Say So”,  “Woman”, and “You Right”. "),
  strong("What is the song attribute that tends to be the most effective in captivating its listeners?"),
  p("Danceability seems the most effective attribute in a song that captivates a listener, as most songs on our
    dataset had a danceability higher than 0.5 rating. High danceability understandably helped songs perform on
    TikTok as songs with catchy hooks and easily-remembered lyrics can stick in our heads and can be heard 
    multiple times over without much issue. Tempo, energy, and valence had little to no correlation on how
    a song performed, as many of the songs varied from high to low. Tempo was generally around 120 BPM, but
    many songs were above and below the average of 120 BPM. Valence and energy also had little to no
    correlation to captivating a listener as songs on our datasets varied wildly from low to high valence
    and energy."),
  strong("To what extent does genre influence what songs might become popular overall?"),
  p("Genre has a heavy influence on what songs can crack the top 100. Only 2 songs found in 
    our dataset fell under the ‘Rock’ genre, while the rest fell under either Rap/Hip-Hop or Pop. 
    No other genre was able to appear in the Top 100, so a popular song falling under a niche genre 
    on Spotify/TikTok doesn’t mean that it will necessarily translate to commercial success. Songs in 
    other languages are also not likely to appear in the top 100, but that doesn’t mean it’s impossible. 
    The same can be said of songs that belong to genres like reggae, R&B, . However, belonging to several 
    genres will help a song, as “Talking to the Moon” by Bruno Mars can be classified into both the R&B and
    Pop Genres, so belonging to bigger genres will definitely help its chances for national recognition."),
  img(src= "https://media.tenor.com/15YUsMWt4FEAAAAi/music.gif")
          
)



ui <- navbarPage("Properties of a Popular Song",
  theme = my_theme,
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)