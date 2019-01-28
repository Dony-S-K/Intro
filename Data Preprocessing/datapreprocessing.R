    #Data Preprocessing Template

    #Loading the Libraries

library(caTools)
library(ggplot2)

    #Importing the dataset

A = read.csv('Data.csv')
head(A)
tail(A)

    #Data Exploration

summary(A)
str(A)
dim(A)

    #Taking care of missing data

table(is.na(A))
colSums(is.na(A))

A$Age = ifelse(is.na(A$Age), mean(A$Age, na.rm = TRUE), A$Age)
A$Age = round(A$Age,0)

A$Salary = ifelse(is.na(A$Salary), mean(A$Salary, na.rm = TRUE), A$Salary)
A$Salary = round(A$Salary,0)

    #Encoding categorical data

A$Country = factor(A$Country, 
       levels = c('France', 'Spain', 'Germany'), 
       labels = c(1 , 2 , 3))

A$Purchased = factor(A$Purchased, 
                   levels = c('No', 'Yes'), 
                   labels = c(0, 1))

    #Data Visualisations

#install.packages('ggplot2')
plot(A$Age,A$Salary)

ggplot(A, aes(x= Age, y = Salary)) + 
  geom_point(size = 2.5, color="red") + 
  xlab("Age") + ylab("Salary") + 
  ggtitle("Age Vs Salary")

    #Splitting the dataset into the Training set and Test set

#install.packages('caTools')

split = sample.split(A$Salary , SplitRatio = 0.7)
set.seed(111)
training_set = subset(A, split==TRUE)
test_set =   subset(A, split==FALSE)
