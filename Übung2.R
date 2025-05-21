# -- 
# flood risk seminar in Summer Semester 
# R project language concepts and fundamentals
# 
# Created: 22.05.2022
# Last updated: 14
# Xiaoxiang Guan (guan.xiaoxiang@gfz-potsdam.de)
# ---


# User-defined functions ----
myFunc <- function(parameter_list) {
  # the operations in this function are performed on or based on
  #    the parameters provided.
  
  # command chunk here
  out = ...
  
  # return an object to the environment where this function is called
  # the out object can be of any type of data structure: vector, data frame, ...
  return(out) 
}

myfunc <- function(x1, x2) {
  # give two numeric values x1, x2
  y = (x1 + x2) * (x1 - x2)
  return(y)
}

myfunc(1.0, 2.0)  # call the defined function 


# --- control structure ----

## if-else structure ----
if (condition1) {
  # condition1 == TRUE, then
  
  # command chunk 1 here
  
} else if (condition2) {
  # condition2 == TRUE, then
  
  # command chunk 2 here
  
} else {
  # command chunk 3 here
  
}

# if-else example
condition = TRUE
if (condition) 
{
  print(1)
} else {
  print(0)
}

## Comparison operators ---- 
# operations with logical results
1 < 3      # less than
1.2 <= 2.0 # less than or equal to

2 > 3      # greater than 
1.25 >= 2  # greater than or equal to

x = 1
x == 1     # equal
x != 1     # not equal 


c(1, 2, 1, 3, 2.5) > 1.5 # perform vectorized comparison 
c(1, 2, 1, 3, 2.5) == c(1, 0, 1, 0, 0)

is.numeric()
is.character()
is.logical()

## logical operator ---- 
x1 <- 1.5  
x2 <- 2.5
y1 <- 1.6
y2 <- 0.6

#  Logical Operators
# chain multiple test expressions
x1 > x2  & y1 < y2   # &: and
x1 <= x2 & y1 <= y2  
x1 > x2  | y1 <= y2  # |: or 
x1 <= x2 | y1 <= y2  

# vectorized operation also applies here, but you need also pay extra attention. 

x1 <= x2
!(x1 <= x2)         # !: exclamation mark: not 

# if-else examples ----
x <- -3
if (x > 0) {
  x = x
} else if (x < 0) {
  x = -x
} else {
  x = 0
}


# ---- loops -------
Ids <- c(1, 2, 3, 4, 5)

for (i in Ids) {
  out = i * (-1)
  print(out)
}

id = 1
while (id <= 5) {
  out = id * (-1)
  print(out)
  id = id + 1
}

id <- 1

while (id <= 5) {
  out = id * (-1)
  print(out)
}

#### ---- Data manipulation -----


# data creating ------
x <- NULL
x <- 0
x <- c(1,2,3,4,5,6)  # numeric vectors

# creating logical vectors
x <- c(TRUE, FALSE, FALSE)  # direct creation 

nv <- c(0.1, 1, 1.2, 0.25, 0.56, 5)
x <- nv < 0.5  # create from comparison expression 
x <- nv > 0.5

# creating character vectors
x <- c('a', 'b', 'c', 'f')

as.character(c(1,2,3))

years = 1999:2020  # convert numeric to string
paste0('Y', years)


# creating data frame (from multiple vectors)
# import from text files
# create by keyboard
patientID <- c(1, 2, 3, 4, 5, 6)
age <- c(25, 34, 28, 52, 35, 40)
diabetes <- c("Type1", "Type2", "Type1", "Type1", "Type1", "Type2")
status <- c("Poor", "Improved", "Excellent", "Poor", "Poor", "Improved")
df <- data.frame(patientID, age, diabetes, status)
df

# data rename -----

colnames(df)  # access the column names
colnames(df) <- c("c1", "c2", "c3", "c4")  # rename the columns
colnames(df) <- c("ID", "age", "diabetes", "status")  # rename the columns

# data altering ------
x[1]
x[2] <- 0
x[5] <- 11

# data adding ------
# for vector objects
x <- c(1, 2, 3)
x[4] <- 4

x[10] <- 10

x1 <- c(2, 4, 6)

x <- c(x, x1)  # combine with vectors 

x <- NULL  # null vector, it is empty after declaration 
x[1] <- 1  # fill values
x[5] <- 5
x

# data sorting -----
x <- c(1.0, 0, -2.2, 2.5, -5.1, 6, 4.15, -1.5, 3.2)
sort(x)           # sort the numeric vector in increasing order
sort(x, decreasing = T)

df[order(df$age), ]
df[order(df$age, decreasing = TRUE), ]

# filtering and sub-setting ------

x1 <- c(1.0, 0, -2.2, 2.5, -5.1, 6, 4.15, -1.5, 3.2)

# select (subset) by index (or position)
x1[1]
x1[6]

# subset by an index (position) vector
x1[1:6]
x1[c(1, 3, 5)]

# subset by logical expression
x1[c(TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE)]

x1[x1 > 0] # select all the elements in x1 greater than 0 (positive values)

x1[x1 > mean(x1)]  # select all the elements in x1 greater than the average
x1[x1 > 0 & x1 < 5] 


# filter a data frame with two dimension
# select by a index
df[1, 1]

# select one row of data (observation) by index
df[1, ]

# select on column (field) by index
df[, 1]

# select by name
colnames(df)
df[, "age"]
df[1, "age"]

# multiple selecting (sub-setting)
df[1:2, 1]
df[1, 2:3]

df[1:2, 2:3]
df[2:4, c('ID', 'age')]

# select column(s) by name(s)

df$age   # then all select methods for vectors are also valid

df$age[1]  # just address df$age as a general vector
df$age[2:3]
df$age[df$age > 18]

df$age[df$age > 18 & df$age < 50]

y = df$age
y[y > 18 & y < 50]

df$age[df$status != "Poor"]  # filter one column based on another column

max(df$age[df$status == "Poor"])
mean(df$age[df$status == "Poor"])


# data frame merging ------

gender <- c("M", "F", "F", "M", "M", "F")
cbind(df, gender) # bind by column, number of df rows == length of vector

rbind(
  df, 
  c(7, 30, "Type2", "Excellent")
) # bind by row, number of df columns == length of vector


df1 <- data.frame(
  'c1' = 1:3,
  'c2' = c('a', 'b', 'c')
)
df2 <- data.frame(
  'c1' = 4:6,
  'c2' = c('d', 'e', 'f')
)

cbind(df1, df2)
rbind(df1, df2)

df2 = data.frame(
  ID = c(2,3,5), 
  gender = c("M", "F", "F")
)

merge(
  df, df2,
  by.x = "ID", by.y = "ID", all.x = TRUE
)  # identity column: ID


# data frame group and aggregation ------

aggregate(age~diabetes, df, FUN = mean)
aggregate(age~diabetes, df, FUN = max)
aggregate(age~status, df, FUN = mean)


### ------- Exercise with R - R basics -----------

# exercise 1. ------
# getting data into R and find data file here: 
#     data/Example_data.csv, use read.table() function

# exercise 2. ------
# How many days are there with discharge exceeding (>=) 8000? 

# exercise 3. ------
# Which month has the most discharge days exceeding 8000? 

# exercise 4. ------
# Derive the annual maximum discharge series 

# exercise 5. ------
# Figure out in which day (date) the discharge reaches the maxima for each year 

# split the data frame into subset dfs based on year column
# and the sort the subset df based on discharge column in decreasing order, 
# then retrieve the first row in the sorted subset df


# know more about date in R:
# https://bookdown.org/rdpeng/rprogdatascience/dates-and-times.html

