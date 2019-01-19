    # Data Preprocessing Template

# Importing the dataset

A = read.csv('Data.csv')

summary(A)
str(A)
head(A)
tail(A)
dim(A)
# Taking care of missing data

table(is.na(A))
colSums(is.na(A))

A$Age = ifelse(is.na(A$Age), mean(A$Age, na.rm = TRUE), A$Age)
A$Age = round(A$Age,0)

A$Salary = ifelse(is.na(A$Salary), mean(A$Salary, na.rm = TRUE), A$Salary)
A$Salary = round(A$Salary,0)


# Encoding categorical data

A$Country = factor(A$Country, 
       levels = c('France', 'Spain', 'Germany'), 
       labels = c(1 , 2 , 3))

A$Purchased = factor(A$Purchased, 
                   levels = c('No', 'Yes'), 
                   labels = c(0, 1))


# Data Visualisations
plot(A$Age,A$Salary)

library("ggplot2")

ggplot(A, aes(x= Age, y = Salary)) + 
  geom_point(size = 2.5, color="red") + 
  xlab("Age") + ylab("Salary") + 
  ggtitle("Age Vs Salary")

#ggplot() +geom_point(aes(x = A$Age, y = A$Salary), colour = 'red') + 
  #geom_line(aes(x = X$Age, y = X$Salary, colour = 'blue'))+ 
  #ggtitle('Age Vs Salary') + xlab('Age') + ylab('Salary')

# Splitting the dataset into the Training set and Test set
install.packages('caTools')

library('caTools')
split = sample.split(A$Salary , SplitRatio = 0.7)
set.seed(111)
training_set = subset(A, split==TRUE)
test_set =   subset(A, split==FALSE)

# Rattle
install.packages("rattle")
library(rattle)
rattle()