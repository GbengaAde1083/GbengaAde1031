install.packages("ggiraph")
install.packages("ggplot2")
install.packages("ggvis")
install.packages("plotly")

library(ggplot2)
library(plotly)
library(ggvis)
library(ggiraph)

# Loading the cars data set
intCars = na.omit(read.csv("c:/Users/user/desktop/cars.txt"))

# Create a scatter plot showing the horse power by miles per 
# gallon of Japanese, European, and US brand cars 
p <- ggplot(intCars, aes(x=hp, 
                     y=mpg, 
                     color=brand,
                     tooltip = cylinders)) +
  geom_point_interactive()
girafe(ggobj = p)

# Create a bar graph/chart showing the numbers of cars produced by Europeans, 
# Japanese, and US by the number of cylinder
p2 <- ggplot(intCars, aes(cylinders)) + geom_bar(aes(fill = brand))+
  ggtitle("Brands of Cars based on Number of Cylinders")

ggplotly(p2)


