mtcars ## Stored practice data in R

mtcars_training <- mtcars[1:16,]
mtcars_test <- mtcars[17:32,]
nrow(mtcars_training)

source("http://bioconductor.org/biocLite.R") # run if necessary
biocLite("caret")
library(caret)
mtcars_lm <- train(mpg~., data = mtcars_training, method = 'lm') #can use x and y - fun (x) = y
## x are the features in this case cyl, hp, etc and y is mpg
## Trying to train a function to use features
## Method = linear model (lm)
## mpg~. means mpg relative to everything else
mtcars_lm
mtcars_lm$finalModel

mtcars_test$predicted_mpg <- predict(mtcars_lm, newdata = mtcars_test)
#object is model from the train function

#Can compare predicted and real mpg with correlation
cor(mtcars_test$mpg, mtcars_test$predicted_mpg)# very low correlation
# Can improve by training method in train function, not a guarantee
mtcars_test <- mtcars[25:32,]


##Trying decision tree method (rpart)
mtcars_rpart <- train(mpg~., data = mtcars_training, method = 'rpart')
mtcars_test$predicted_mpg <- predict(mtcars_rpart, newdata = mtcars_test)

mtcars_knn <- train(mpg~., data = mtcars_training, method = 'knn')
mtcars_knn
mtcars_test$predicted_mpg <- predict(mtcars_knn, newdata = mtcars_test)




