#install the package for naive bayes
library("caret")

#load the data
irisData <- read.table("C:/Users/tejas/Desktop/NJIT/Data Mining/finalProject/iris.data.txt",sep=",",header=T)
names(irisData) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")
nrow(irisData)
summary(irisData)

#Add first four columns data to xData
xData = iris[,-5]
ySpecies = iris$Species

#Train the model with 10-fold cross validation
nbModel = train(xData,ySpecies,'nb',trControl=trainControl(method='cv',number=10))
print(nbModel)

#Prediction
pred<-predict(nbModel$finalModel,xData)
table(pred$class,y)

#graph plot for naive bayes
naive_iris <- NaiveBayes(iris$Species ~ ., data = iris)
plot(naive_iris)



