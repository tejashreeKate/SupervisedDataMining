#Random forest on iris dataset
library(randomForest)
library(caret)

#load the data
irisData <- read.table("C:/Users/tejas/Desktop/NJIT/Data Mining/finalProject/iris.data.txt",sep=",",header=T)
names(irisData) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")
nrow(irisData)
summary(irisData)

#get sample data
data<-sample(2,nrow(irisData),replace=TRUE,prob=c(0.7,0.3))
trainData <- irisData[data==1,]
testData <- irisData[data==2,]
rf <-rfcv(iris, iris$Species, cv.fold=10)
with(rf, plot(n.var, error.cv, log="x", type="o", lwd=2, col="blue"))
#table(iris$Species,rf$predicted$`4`)


iris_rf <- randomForest(Species~.,data=trainData,ntree=100,proximity=TRUE)
print(iris_rf)
plot(iris_rf)
pred1<-predict(iris_rf)
print(pred1)
table(predict(iris_rf),trainData$Species)
confusionMatrix(pred)

#print(mod)
pred<-predict(iris_rf,newdata=testData)
print(pred)
table(pred,testData$Species)
print(importance(iris_rf)) 

varImpPlot(iris_rf)

plot(margin(iris_rf,testData$Species))



