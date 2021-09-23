#load ggplot 2
library(ggplot2)

#load gapminder
 library(gapminder)

#load dplyr
 library(dplyr) 

#view gapminder data
gapminder

#remove Kuwait from gapminder dataset 
filter(gapminder, country!="Kuwait")

#save it!
No_Kuwait <- filter(gapminder, country!="Kuwait")

#plot it!
p1 <- ggplot(No_Kuwait, aes(x = lifeExp, y =gdpPercap, color = continent, size = pop/100000))  + 
    geom_point() +
    scale_y_continuous(trans= "sqrt")+ 
     labs(x = "Life Expectancy", y ="GDP Per Capita", size = .5, color = "#00008") + 
     facet_wrap(~year, nrow=1) +
     theme_bw()

p1   

#get ready for the second plot

#group continent and year and save as grouping
grouping <-gapminder %>% group_by(continent, year)

#run it 
grouping     

#summarize it ans save it as gapminder_continent
gapminder_continent <- summarise(gdpPercapweighted= weighted.mean(x=gdpPercap, w=pop)) +
  pop = sum(as.numeric(pop))

#plot it
ggplot(gapminder_continent)
