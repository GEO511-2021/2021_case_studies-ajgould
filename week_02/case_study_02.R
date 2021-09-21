library(tidyverse)

# define the link to the data - you can try this in your browser too.  Note that the URL ends in .txt.
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"

temp=read_table(dataurl,
                skip=3, #skip the first line which has column names
                na="999.90", # tell R that 999.90 means missing in this dataset
                col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                              "APR","MAY","JUN","JUL",  
                              "AUG","SEP","OCT","NOV",  
                              "DEC","DJF","MAM","JJA",  
                              "SON","metANN"))
# renaming is necessary becuase they used dashes ("-")
# in the column names and R doesn't like that.

#view temp
view(temp)

#summary temp
summary(temp)

#glimpse temp
glimpse(temp)

#add smoth line and line, add axis lables with xlab/ylab, title with ggtitle
#define as p1 below
p1 <- ggplot(temp,aes(x=YEAR, y=JJA)) +
  geom_line(colour = "#000080") + geom_smooth(fill="#FFFF66", colour="#8B8000") + 
  xlab("Year") +ylab("Mean Summer Temperature (C)") +
  ggtitle("Mean Summer Temperatures in Buffalo, NY")

#save as png
png("Mean_Summer_Temp.png",width = 1000,height = 600, res=200)
p1
dev.off()

