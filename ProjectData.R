library(dplyr)
library(stringr)


billboard_df <- read.csv('Billboard Artist 100 21623.csv')

tiktok_df <- read.csv('TikTok_songs_2022.csv')

joined <- left_join(tiktok_df, billboard_df, by=c('artist_name' = 'Artist'))

joined <- joined %>% mutate(overall_pop = summarize(joined, (artist_pop + track_pop) / 2))

joined <- joined %>% arrange(-overall_pop)

joined <- joined %>% mutate(Is_Top_100 = str_detect(as.character(Rank), "[0123456789]"))

summ_df <- joined%>% group_by(Is_Top_100, artist_name, track_name) %>% summarize(overall_energy = danceability + energy + valence + tempo / 4)
