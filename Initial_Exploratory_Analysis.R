library(dplyr)
library(ggmap)
library(ggplot2)
library(readr)

train <- read.csv(file = "./train.csv")


train$newDT <- as.POSIXct(train$Dates, format="%Y-%m-%d %H:%M:%S")

View(train)
str(train)
##Histogram based on crimes in the the District
qplot(x = train$PdDistrict,xlab = "District")

ggmap(ggmap = )


train$X[1]

mapImageData2 <- get_map(location = c(lon = train$X, lat =  train$Y),
                         color = "color",
                         source = "google",
                         maptype = "terrain",
                         zoom = 16
                                )

ggmap(mapImageData2,
      extent = "device",
      ylab = "Latitude",
      xlab = "Longitude")

library(biganalytics)
inTrain <- createDataPartition( y= train$Category, p = 0.75 , list = FALSE)


trainingSet <- train[inTrain,]
testingSet <- train[-inTrain,]

cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)


trcntrl <- trainControl(classProbs=TRUE,
                        savePredictions=TRUE,
                        allowParallel=TRUE)
gc()

trainingModel <- train(Category ~ ., data=data, method="glm",trControl = trcntrl)

big.rf <- randomForest(Category ~ ., data=trainingSet, do.trace=10)

bigkmeans(x = data,centers = 10,nstart = 10)

sessionInfo()

install.packages("randomForest")
free()
call
View(data)

install.packages("bigmemory", repos="http://R-Forge.R-project.org")
install.packages("bigmemory.sri", repos="http://R-Forge.R-project.org")
install.packages("biganalytics", repos="http://R-Forge.R-project.org")
install.packages("bigalgebra", repos="http://R-Forge.R-project.org")
install.packages(c("BH","biglm"))
