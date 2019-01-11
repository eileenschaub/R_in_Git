# Software Carpentry R Workshop - James's Code

#doing some programming!

number <- 37
if(number > 100) {
  print("greater than 100")
}

# The above produces no visible result cos 37 isn't > 100.

number <- 37
if(number > 100) {
  print("greater than 100")
} else {
  print("less than or equal to 100")
}

#Some notation:
# Less than: <
# Equal to: ==
# Not equal to: !=

number <- -3

if(number > 0) {
  print(1)
}  else if (number < 0) {
    print(-1)
} else {print(0)
    }

# And now... the ampersand.
# 'a bit of r & coding'

number1 <- -15
number2 <- 40

if(number1 >= 0 & number2 >= 0) {
  print("both numbers are positive")
} else{
  print("at least one number was negative")
}

# you could use this to figure out the boundaries of stages.
# like finding which sites have no flowers at a certain coll. period

# Loops!
# Automating & doing repetetive tasks.

numbers <- 1:10
# count to ten
# don't forget to actually ctrl+r when you assign objects

# for loop
for(number in numbers) {
  print(number)
}

for(i in 1:10) {
  print(i)
}

# So R stores whatever number in the loop in 'i'.
print(i)
# It prints the last number that was assigned to 'i'.

letter <- "z"
print(letter)
for(letter in c("a","b","c")) {
  print(letter)
}
print(letter)
# 'c' was the last thing stored in the letter variable / the increment variable.

# Socrative: Write a for loop that will calculate the sum of a vector of numbers and print it out at the end... without using 'sum()'.

numbers <- c(4,8,16,23,42)
sum <- 0

for(number in numbers) { 
  sum <- sum+number 
    print(sum)
  }

# You can define objects, like 'number', within the loop
# It will write over the value assignment each time the loop runs.
# For example, here it is basically doing "number <- 0, number <- 0 + 4,
# number <- 4+8, number <- 12+16 etc etc.

# Now you can do the for loop and have it add the things, and run the print command
# AFTER the loop close, so that you don't have a zillion numbers on the result.

for(number in numbers) { 
  sum <- sum+number 
}
print(sum)
#viz.

# Functions
# To see the source code of it, just run it with nothing.

dim
nrow

# Farenheit to Kelvin function
fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5/9) + 273.15)
  return(kelvin) # this tells the function what to send back when you run it
}

fahr_to_kelvin(32)
fahr_to_kelvin(212)

kelvin_to_celsius <- function(temp){
  celsius <- temp - 273.15
  return(celsius)
}
kelvin_to_celsius(0)

# Socrative

# Function to convert fahrenheit to kelvin
fahr_to_kelvin <- function(temp) {
  
  temp <- ((temp - 32) * (5 / 9)) + 273.15
  return(temp)
}

# Store the current temperature in F
temp <- 73


# Get the temperature in kelvin
kelvin_temp <- fahr_to_kelvin(temp)


# Print the temperature
print(temp)

# Socrative: Write a function to convert a temperature in Celsius to Fahrenheit using # the formula: F = C * 9 / 5 + 32

celsius_to_fahr <- function(temp) {
  fahr <- ((temp) * (9/5) + 32)
  return(fahr)
}
celsius_to_fahr(0)
celsius_to_fahr(100)
celsius_to_fahr(37)

# Day 2 afternoon: data manipulation with ~*Cera*~ #
# RMarkdown

install.packages(c("tidyr","dplyr","knitr","rmarkdown","formatR"))
