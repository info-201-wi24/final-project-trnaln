# Properties of a Popular Song
## INFO 201 "Foundational Skills for Data Science"

Authors: Raizel Lagunero, Keyan Russell, Alan Tran


For the Final Project -- Data Wrangling, add the following to this code repository:

* An R script file containing the code you used to create your unified dataset 
* Your unified and cleaned CSV dataset file
* Data Nutrition Label (pdf) 


**Link: [Link to your Shiny App here](https://tranalan.shinyapps.io/FinalProject/)**

Please create the necessary files for your multi-page Shiny app in this GitHub repository. Consult the Canvas assignment for more details. Be sure to publish your app on Shinyapps.io.

When you are finished, please add the text from your introductory and concluding pages below. You might want to use this GitHub repository as part of your digital portfolio, so you want this README.md to offer a brief description of the project and key takeaways.

Feel free to delete these instructions for your final README.md file and to make your GitHub repository public if you would like others to be able to see it. 

# Introduction
Music is an art heavily integrated with advancing technology, and TikTok’s growing popularity on mainstream media has given rise to the popularity of various artists, songs, and genres. TikTok’s algorithm and marketability have caused many artists to quickly gain recognition, and smaller, underground artists are given the opportunity to gain more listeners. This project analyzes the attributes that popular songs tend to have in common in order to gain a better understanding of why certain songs have a meteoric rise on TikTok and to be able to visualize the correlation between viral songs and artist popularity.
Questions:
1. Does an artist’s popularity influence what songs might become popular on TikTok?
2. What is the song attribute that tends to be the most effective in captivating its listeners?
3. To what extent does genre influence what songs might become popular overall?

Data Collection:
This project's data is collected through Spotify's API and Billboard Top 100 Charts from 2022-2023. TikTok Song DataSet: https://www.kaggle.com/code/antoniosabatini/tiktok-popularity-track-eda-ml-models/input. Billboard Top 100 Songs: https://www.kaggle.com/datasets/calebpool/billboard-top-100-artist-week-of-2182023.
There were no ethical review processes conducted in the collection of the dataset. This project's data is limited to songs on TikTok and Billboard Top 100 songs. It is not an accurate representation of user populations outside of TikTok and Spotify.


# Conclusion / Summary Takeaways
Does an artist’s popularity influence what songs might become popular on TikTok?
An artist's popularity correlates with the amount of songs they have trending on TikTok. Artists with a  high popularity tend to have more trending TikTok songs. Drake has the highest popularity score of ninety-five and Pia Baris has the lowest popularity score of eighteen. Drake has two trending TikTok songs, “Jimmy Cooks
(ft. 21 Savage)” and “Toosie Slide”, while Pia Baris only has one song, “Red Flag”. However, artist popularity can only contribute so much, and there are other underlying characteristics that make up a popular song. For example, Doja Cat only has a popularity rating of 80, but she has eight trending songs: “Ain’t Shit”, “Boss Bitch”, “Freak”, “Kiss Me More (ft. SZA)”, “Need to Know”, “Say So”,  “Woman”, and “You Right”. 

What is the song attribute that tends to be the most effective in captivating its listeners?"
Danceability seems the most effective attribute in a song that captivates a listener, as most songs on our dataset had a danceability higher than 0.5 rating, scale out of 1. High danceability understandably helped songs perform better on TikTok as songs with catchy hooks and easily-remembered lyrics can stick in our heads and can be heard multiple times over without much issue. Tempo, energy, and valence had little to no correlation on how a song performed. Tempo was generally around 120 BPM, but many songs were above and below the average of 120 BPM. Valence and energy also had little to no correlation to captivating a listener as songs on our datasets varied wildly from low to high valence and energy.

To what extent does genre influence what songs might become popular overall?
Genre has a heavy influence on what songs can crack the top 100. Only 2 songs found in our dataset fell under the ‘Rock’ genre, while the rest fell under either Rap/Hip-Hop or Pop. No other genre was able to appear in the Top 100, so a popular song falling under a niche genre on Spotify/TikTok doesn’t mean that it will necessarily translate to commercial success. Songs in other languages are also not as likely to appear in the top 100, but that doesn’t mean it’s impossible. The same can be said of songs that belong to genres like reggae, R&B, classical, etc. However, belonging to several genres will help a song, an example being “Talking to the Moon” by Bruno Mars, which can be classified into both the R&B and Pop Genres, so belonging to the bigger genres will definitely help its chances for national recognition.
