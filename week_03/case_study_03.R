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
     labs(x = "Life Expectancy", y ="GDP Per Capita", size = "Population in 100k", color = "Continent") + 
     facet_wrap(~year, nrow=1) +
     theme_bw()

p1   

#save it
ggsave("Plot1.png", width = 15, height = 5)


#get ready for the second plot

#group and summarize continent and year and save as grouping
gapminder_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted= weighted.mean(x=gdpPercap, w=pop), pop=sum(as.numeric(pop))) 
 

#plot it
data(gapminder)
p2 <- ggplot(gapminder, aes(x = year, y =gdpPercap, color=continent, size=pop/100000)) +
  geom_line(aes(group=country, size = .1)) + 
  geom_point() +
  geom_line(data=gapminder_continent, mapping=aes(x=year, y=gdpPercapweighted, color= "black", size=.5))+
  geom_point(data=gapminder_continent,mapping=aes(x=year, y=gdpPercapweighted, color="black"))+
  facet_wrap(~continent,nrow=1) + 
  theme_bw() + 
  labs( x="Year", y = "GDP per Capita", size =" Population (100k)")

p2

#save it
ggsave("Plot2.png", width = 15, height = 5)
 


