# finding help
?log

#fuzzy search
??read.ta
?"<-"

vignette("dplyr")
# information abouta particular package
vignette("tidyverse")

# Data structures

#makin' a dataframe

cats <- data.frame(coat = c("calico","black","tabby"),
                   weight = c(2.1,5.0,3.2),
                   likes_string = c(1,0,1))
# c() = combine
# I am just imagining these cats and I love them
# I want to meet these cats
# they are good cats

View(cats)
# you can use the View function instead of manually clicking

write.csv(cats, "data/feline_data.csv")
# you can write it into a subfolder of thine project by naming it
# and it there!

cats <- read.csv("data/feline_data.csv")

# There are 4 variables because R added a column X, which is just the row #'s.

cats$weight
# This pulls out one column.

cats$coat

# Now let's say the weight is in kg Let's convert it to poundingtons.

cats$weight <- cats$weight*2.2
cats$weight

# Hey what if we try to add weight + coat?

cats$weight + cats$coat

# WOOP WOOP it doesn't work because you're trying to add THINGS THAT AREN'T NUMBERS.

class(cats$weight)
class(cats$coat)

class(cats)
str(cats)
# str = structure, use it to look at the structure

#creating some vectors, just for kicks
num_vector <- c(1,3,5)
chr_vector <- c("a","b","c") # forget not the quote marks
chr_vector2 <- c("d","e",'f')

comb_vector <- c(chr_vector, chr_vector2)
# so yeah you can combine dataframes

comb_vector

num_vector2 <- c(100,10,20)

num_vector + num_vector2

my_series <- 1:10
# there are ten things you need to know

seq(10)

seq(from = 1, to = 10, by = 0.1)
# specifies the increments to count in

alpha_vector <- seq(26)
alpha_vector
alpha_vector * 2
LETTERS

# assigning names to vectors: the names function

names(alpha_vector <- c(LETTERS))
names(alpha_vector) <- c(LETTERS)

# Enough with these cats and characters. It's time for a REAL dataframe.

read.csv("gapminder.csv")
read.csv("data/gapminder.csv")
read.csv("/data/gapminder_data.csv")
# it helps to have the correct filename

getwd()

read.csv("data/gapminder_data.csv")
# Don't put the slash (eg "/data") or it will jump out of the directory into
# a higher order of folders.
data("gapminder_data")  #This adds the df to the global environment.
attach(gapminder_data)
# Not sure what 'attach' does yet.

str(gapminder_data)

library(gapminder)
gapminder <- read.csv("data/gapminder_data.csv")

str(gapminder) # structure
nrow(gapminder) # number of rows
ncol(gapminder) # number of columns
dim(gapminder) # number of rows + number of cols

colnames(gapminder) # call up the column names

# Subsetting data HEYOOOOO I NEED THIS ONE

x <- c(5.4,6.2,7.1,4.8,7.5)
names(x) <- c("a","b","c","d","e")
x[1]
x[3]
# this is just looking at elements in the vector
x[c(1,3)]
# that pulls out multiple ones: needs the c() fnction.
x[1:4]

x[-2] # this removes an element from the vector

head(gapminder)
head(gapminder["pop"]) # pulls out ie subsets the head of 1 column

head(gapminder[,5]) # this subsets based on column number - pop is the 5th column
# It's [blank,5] because the second number is a column. The first (left) one would be
# a row.

head(gapminder[3,])
# See, that pulls out a particular roooOWwwwww DAMMIT THIS HAS BEEN EXACTLY
# THE FUNCITON I HAVE BEEN SEEKING FOR MONTHS!!!

gapminder[1:10,5]

# life expectency of line 138: 50.023
gapminder[138,5]
gapminder[1:6,c(3,5,6)]
# Again, use the c() function. Left of the comma is rows, right is columns,
# do not introduce more commas except within c().

# Now if you wanted to, say, subset & share only part of this dataset.
# Let's make an Albania dataset.

albania <- gapminder[13:24,1:6]
albania
# Cera's gonna talk about subsetting by character rows when she talks dplyr.

afghanistan <- gapminder[1:12,]

afghanistan$gdp <- afghanistan$pop*afghanistan$gdpPercap
write.csv("newresults/afghanistan.csv")

## Day 2: Plotting ##

install.packages("tidyverse")

install.packages("ggplot2")

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

library(tidyverse)
library(tidyr)
library(ggplot2)
install.packages("tidyr")

getwd()

install.packages("tidyr")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("knitr")

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp)) +
  geom_point()

# Now for layers. Did not know that was a thing you could do?
# Anyway adding points to the lineplot.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,
                             by = country, color = continent)) +
  geom_line() +
  geom_point()

# Adding aesthetic to the lineplot
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,
                             by = country)) +
  geom_line(aes(color = continent)) + # So only the lines and not dots are colored.
  geom_point(aes(color = "blue")) # gotta do the quote marks

# Back to no-line scatterplot
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,
                             color = continent)) +
  geom_point()

# Now let's change the plot to a log scale so you can actually read the thing.
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,
                             by = country, color = continent)) +
  geom_point(alpha = 0.5) + # alpha makes points translucent
  scale_x_log10() # puts the x-axis on a log scale

# make a regression line
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,
                             by = country, color = continent)) +
  geom_point(alpha = 0.5) + 
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5) #lm = linear model

# Socrative q:
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 0.5) + #changed the size of the point
  scale_x_log10() +
  geom_smooth(method="lm")

# Colorblindness-friendly plots! There are palettes out there to use.
# You can also compensate for this by doing SHAPES.

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,
                             color = continent)) +
  geom_point(alpha = 0.5, aes(shape = continent), show.legend = FALSE) + 
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)

# clean this up for publishing
# all the info is in here

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp,
                             color = continent)) +
  geom_point(alpha = 0.5, size = 2, aes(shape = continent)) + 
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5) +
  scale_y_continuous(limits = c(0,100), breaks = seq(0,100, by = 10)) +
  theme_bw() +
  ggtitle("Effects of per-capita GDP on Life Expectancy") +
  xlab("GDP per capita ($)") +
  ylab("Life Expectancy (years)")
ggsave(file = "life_expectancy.png")
# You can save right from the code!


# changed scale on y-axis
# Note: specifying scales is good for when you have side-by-side plots
# so that you can easily compare between them
# (like say if you have several collection periods to compare average stages)

#Boxplot

ggplot(data = gapminder, aes(x = continent, y = lifeExp,
                             color = continent)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.5, color = "tomato")

getwd()
