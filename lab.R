### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3

## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out
Seahawks <- c(23, 41, 15, 32, 22)
Seahawks
## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name
opponent <- c(10, 32, 11, 5, 30)
opponent
## Combine your two vectors into a dataframe
football <- data.frame(Seahawks, opponent)
football
## Create a new column "diff" that is the difference in points
## (in favor of Hawks)
football$diff <- Seahawks - opponent
football
#method 2
football[["diff"]] <- Seahawks -opponent

## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them
football$won <- football$diff > 0
football
## Create a vector of the opponents name (such as "Denver Broncos")
opp_name <- c("Denver Broncos")
opp_name
## Add the vector of opponents into the data frame
football$opp_name <- opp_name
football 
## Compute the average score of Seahawks
mean(football$Seahawks)

## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)
sum(football$won)

## What was the largest difference in scores (in favor of Seahawks)?
max(football$diff)

## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`
?unique
length(unique(football$opp_name))
## Print the variable names in your data frame
names(football)

## Write a loop over all variables in your data frame
## print the variable name inside the loop
for(each in names(football)) {
  cat(each, "\n")
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'
for(each in names(football)) {
  cat(each, "\n")
  if(is.numeric(football[[each]])) {
    cat(is.numeric(football[[each]]), "the variable name is: ",  football[[each]], "\n")
  }
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric
for(each in names(football)) {
  cat(each, "\n")
  if(is.numeric(football[[each]])) {
    cat(mean (football[[each]]), "\n")
  }
}


##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`
employees <- paste("Employee", 1:100)
employees
## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,
## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120
salaries2021 <- runif(100, 60, 120)
salaries2021
## Create a random vector of 2022 salaries that are typically
## higher than the 2014 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.
salaries2022 <- runif(100,80, 160)
salaries2022
## Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(salaries2021, salaries2022)
salaries
## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022
salaries$raise <- salaries2022 - salaries2021
salaries
## Retrieve values from your data frame to answer the following questions:
##
## What was the 2022 salary of employee 57
salaries[57, "salaries2022"]

## Now round the answer down to two digits after comma
## check out 'round()' function
round(salaries[57, "salaries2022"], 2)
# 2 means two digits

## How many employees got a raise?
sum(salaries$raise > 0)

## What was the value of the highest raise?
## Round the number to two digits!
highest_raise <- round(max(salaries$raise, 2))

## What was the name of the employee who recieved the highest raise?
salaries$employees <- employees
salaries$employees[salaries$raise == highest_raise]

## What was the average salary increase?
## Round the number!
mean(salaries$raise)

## For people who did not get a raise, how much money did they lose?
## Round the number!
round(mean(salaries$raise[salaries$raise < 0]), 2)
