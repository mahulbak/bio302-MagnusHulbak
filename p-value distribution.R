#setwd("C:/Users/MAGNUS/OneDrive/R/BIO302/bio302-MagnusHulbak")
library(tidyverse, quietly=TRUE)
library(broom)

#looking at distribution of p-values generated from random numbers
set.seed(42)
x<-1:20
y<-rnorm(20)
mod<-lm(y~x)
anova(mod)
summary(mod)
glance(mod)
tidy(mod)
#rerun model 10 000 times
rerun(.n = 2000, tibble(x = 1:20, y = rnorm(20, x*0.4))) %>% 
  map(~ lm(y ~ x, data = .)) %>% 
  map_df(glance) %>% 
  #plot distribution of p-values
  ggplot(aes(x=p.value))+geom_freqpoly() %>% 
 



