    #Data preprocessing template

    #Loading the libraries

import pandas as pd
import numpy as np
from sklearn.preprocessing import Imputer
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import LabelEncoder,OneHotEncoder
from sklearn.model_selection import train_test_split

    #Importing the dataset

dataset = pd.read_csv('Data.csv')
print(dataset.head())

    #Data Exploration
   
print(dataset.info()) #information about data types
print(dataset.shape) #dimensions of dataframe
print(dataset.describe()) #descriptive stats
print(dataset.columns)

    #Missing Data

imputer = Imputer(missing_values=np.nan, strategy = 'mean')
dataset.iloc[:,[1,2]] = imputer.fit_transform(dataset.iloc[:,[1,2]])
np.round_(dataset.iloc[:,[1,2]], decimals=0)

    #Feature Scaling
    
sc = StandardScaler()
dataset.iloc[:,[1,2]] = sc.fit_transform(dataset.iloc[:,[1,2]])

    #Classifying the dependent & independent variables
    
X = dataset.iloc[:,:-1]
Y = dataset.iloc[:,-1]

    #Encoding Categorical Data

le = LabelEncoder()
X.iloc[:,0] = le.fit_transform(X.iloc[:,0]) #Converting country names to numbers
Y = le.fit_transform(Y) #Converting 'Yes' and 'No' to numbers
ohe = OneHotEncoder(categorical_features=[0])
X = ohe.fit_transform(X).toarray() #one hot encodding done on country (independent variable)

    #Splitting the dataset into training and test set

test_size = 0.2
seed = 111  
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = test_size , random_state = seed)

