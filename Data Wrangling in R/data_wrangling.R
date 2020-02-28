
  #Importing the dataset
X = read.csv('Sa_Data.csv')

dim(X)
head(X)
tail(X)

X[4:10, ]
X$Salary[4:10]
X$ratio = X$Salary/X$YearsExperience
write.csv(X, file = 'mod.data.csv')

  #Descriptive stats
summary(X) 
str(X) #Data type

  # Data Visualisations
plot(X$YearsExperience, X$Salary, type = "b", main = "Years Experience vs Salary")

#install.packages("ggplot2")
library(ggplot2)
ggplot(X, aes(x= YearsExperience, y = Salary))+ 
  geom_point(size = 2.5, color="navy")+
  xlab("YearsExperience")+
  ylab("Salary")+
  ggtitle("YearsExperience Vs Salary")

boxplot(X$Salary)

  #Simple Linear Regression
regressor = lm(formula = Salary ~ YearsExperience, data = X)

summary(regressor)

#Questions to work out
1. Load the IPL dataset
2. Print the first 6 data samples
3. Print the dimensionality of the data set
4. Print the descriptive statistics of the last five columns in the data set 
5. write a csv file which contains rows from 5 to 100 and columns from 10 to 25
6. plot a colourful scatter plot of Sixers vs Base Price




