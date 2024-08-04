# Title: Performance Evaluation With an R Confusion Matrix


# Load the library
library(datasets) 
library(caTools)
library(party)
library(dplyr)
library(magrittr)
library(rpart)
library(modEvA)
library(caret)

# Load the dataset
birthwtData = (read.csv("c:/Users/user/desktop/birthwt.csv"))



head(birthwtData)
selected_data <- birthwtData[ , -c(1)]

df = data.frame(selected_data)
print(df)

# assigning new names to the columns of the data frame 
colnames(df) <- c('Low Birth weight ','Age','Mother Weight', 'Race', 'Smoke', 'Premature Labor',
                  'Hypertension', 'Uterine Irritability', 'No. Doctor Visit', 'Birth Weight') 

print(df)
head(selected_data)
summary(selected_data)
str(selected_data)


# Split the data into training and testing sets
sample_data = sample.split(selected_data, SplitRatio = 0.8)
sample_data
train_data <- subset(selected_data, sample_data == TRUE)
test_data <- subset(selected_data, sample_data == FALSE)


set.seed(1)

library(randomForest)
#fit the random forest model
rf_model <- randomForest(
  formula = low ~ .,
  data = selected_data
)
#display fitted model
rf_model

# Make predictions on the test set
predictions <- predict(rf_model, test_data)
predictions
library(caret)

# Create confusion matrix
conf_matrix <- confusionMatrix(test_data$low, predictions)

# Print confusion matrix
print(conf_matrix)

#find number of trees that produce lowest test MSE
which.min(model1$mse)

#find RMSE of best model
sqrt(model1$mse[which.min(model1$mse)]) 


#plot the test MSE by number of trees
plot(model1)
