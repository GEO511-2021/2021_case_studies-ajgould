
#Pull Library
library(ggplot2)

#Load Data
data(iris)

#Pull petal length from table
iris$Petal.Length

#Save the mean as an object
petal_legnth_mean <- mean(iris$Petal.Length)

#Calculate the mean
petal_legnth_mean

#Create ggplot Histogram
qplot(iris$Petal.Length,geom="histogram")

#adjustments
qplot(iris$Petal.Length,
      geom="histogram",
      binwidth = .5,  
      main = "Histogram for Petal Length", 
      xlab = "Length in cm",
      ylab= "Count",
      fill= (iris$Species),
      col=I("yellow"))

#I treats the thing as a command eg. fill= I("pink"), would put everything as pink
