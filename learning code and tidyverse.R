library(tidyverse)
###pipes %>%  ctrl + shift + m ###

data(BCI, package="vegan")
plot(sort(colSums(BCI), decreasing = TRUE))

#alternativt kan man dele koden opp i flere steg for å gjøre det mer oversiktlig

x1 <- colSums(BCI)
x2 <- sort(x1, decreasing = TRUE)
plot (x2)

# %>% brukes for å dele opp kodene og kan begrense antall parenteser. Hver linje har en ny funksjon som sier "bruk dataset/subset fra koden like ovenfor".Trenger i teorien ikke subset lenger, istedenfor kan man lage én lang kode.
BCI %>%  
  colSums() %>% 
  sort(decreasing=TRUE) %>% 
  plot()


#one table functions#
#select, filter, mutate, group_by, summarise, slice, count, arrange, nest ##
iris<-as_tibble(iris)
iris
#select
iris %>% select(Sepal.Length, Species)

iris %>% select(Sepal.Width)
iris %>% select(Sepal.Length:Petal.Length) #velger fra kolonne sepal length til petal length og alle imellom

iris %>%rename(sepal.Length=Sepal.Length)

iris %>% filter(Sepal.Length > 5, Petal.Length < 2) #filtrerer iris med sepal.length over 5 og petal.length mindre enn 2.

#mutate
iris %>% mutate(petal.area=Petal.Length*Petal.Width)
iris %>% mutate(Species=toupper(Species))#endre kolonnen slik at innholdet blir i store bokstaver, to-upper


iris %>% group_by(Species) %>% 
  summarise(mean_petal_length=mean(Petal.Length), sd_petal_length=sd(Petal.Length))#lage nye navn og summerer snitt og standardavvik for Petal Length

iris %>% group_by(Species) %>% 
  mutate(max_petal_length=mean(Petal.Length)) %>% 
ungroup()

iris %>% arrange(Petal.Length)
iris %>% arrange(desc(Petal.Length))#arranger fra største til minste

iris %>% group_by(Species) %>% arrange(Petal.Length) %>% slice(1:3)#i gruppen species arrangerer vi for petal length og klipper ut rad 1-3. 

iris %>% group_by(Species) %>% nest() %>% 
  mutate(mod=map(data,~lm(Sepal.Length~Sepal.Width, data=.))) %>% 
  mutate(coef=map(mod, broom::tidy)) %>% 
unnest(coef)


iris %>% 
  rownames_to_column() %>% 
  gather(key=variable, value=measurement,-Species, -rowname) %>% 
  group_by(Species, variable) %>% 
  summarise(mean=mean(measurement)) %>% 
  ggplot(aes(x=variable, y=measurement, fill=Species))+geom_violin() 
  

iris %>% 
  rownames_to_column() %>% 
  gather(key=variable, value=measurement,-Species, -rowname) %>% 
  ggplot(aes(x=variable, y=measurement, fill=Species))+geom_violin() 
