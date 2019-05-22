---
  title: "Practical 3"
author: "Richard J. Telford"
date: "May 27, 2016"
output: html_document
---
  
#  ```{r setup, include=FALSE}
#knitr::opts_chunk$set(echo = TRUE)
```
## GLS

#With the built-in `iris` data.

#Make a plot to show how `Petal.Length` varies between species.

#Find the variance of `Petal.Length` for each species.

#Fit an anova using `lm` between `Petal.Length` and species and examine the diagnostic plots.

#Fit a `gls` for the same model. Have the coefficients changed?
  
#  Fit a `gls` for the same model but allow the variance to be different for each species. 

#Use `AIC` to test if this is a better model.


library(tidyverse)
```

#plot petal length variation between species
iris %>%select(Species, Petal.Length) %>%  ggplot(aes(x=Species, y=Petal.Length))+geom_boxplot()

#find variance in petal length
iris %>% group_by(Species) %>% 
  summarise(var_petal.length=var(Petal.Length))
  

            
#fit an anova using lm between petal length and species and examine the diagnostic plots

#fit lm

mod<-lm(Petal.Length~Species, data=iris)
anova(mod)



# NLS

- Import data amount.csv
- Do a non-linear regression
- Interpret the results
- What is the expected value if calcium = 10?