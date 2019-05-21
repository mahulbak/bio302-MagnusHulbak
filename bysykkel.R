#setwd("C:/Users/MAGNUS/OneDrive/R/BIO302/bio302-MagnusHulbak")
library(tidyverse)
#laste inn dataset
bysykkel.df<-read.table('bysykkel.csv', header = T,sep=",")
summary(bysykkel.df)

#exploring the data

#Use tidyverse and make plots when useful
#You will probably need to use `group_by`, `count`, `summarise`, `mutate`, `slice` and `ggplot`.

#- Which is the most popular starting station?
 # - Plot the number of hires and returns from each station
#- Which is the most popular pair of start and end stations?
 # - What was the longest/shortest duration of hire? 
  #- Plot the distribution of hire duration.
#- What is the median duration of hire from each station?
 # - Map this information
#- Are there any significant differences in duration between stations.
#- How far does a typical cyclist travel?
 # - What is the relationship between distance travelled and time taken?
  #- How fast was the fastest cyclist (for simplicity assume a straight line of travel)

#one table functions#
#select, filter, mutate, group_by, summarise, slice, count, arrange, nest ##
bysykkel<-as_tibble(bysykkel.df)

#- Which is the most popular starting station?
bysykkel %>% count(start_station_name)%>% 
  arrange(desc(n)) #plot the number of hires and returns from each station
#----------------------------------------------------------------------------------------------  
# # - Plot the number of hires and returns from each station
#samler end station name og start station name til en ny kolonne kalt key med key=key.
bysykkel %>% gather(key=key, value=station_name, start_station_name, end_station_name) %>% 
  count(key, station_name) %>% 
  ggplot(aes(x=station_name,y=n,fill=key))+geom_col(position=position_dodge())#position dodge gjør at kolonnene end- og start station name kommer ved siden av hverandre istedenfor oppå hverandre.
  #----------------------------------------------------------------------------------------------------------------

#- Which is the most popular pair of start and end stations?
  
bysykkel %>% count(end_station_name) %>% 
  arrange(desc(n))

bysykkel %>% count(start_station_name)%>% 
  arrange(desc(n)) 

# De to mest populære startstasjonene er 1.møllendalsplass og 2.cornerteateret. De to mest populære endestasjonene 1.cornerteateret og 2.møllendalsplass
#--------------------------------------------------------------------------------------------------------------------

# - What was the longest/shortest duration of hire? 
bysykkel %>% summarise(duration)
