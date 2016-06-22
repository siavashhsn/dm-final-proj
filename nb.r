library(e1071)
library(class)

cat("> Building `Naive Bayesian` model\n")


# build the nb model
nb_model 	<- naiveBayes(trainset[,1:(ncol(trainset) - 1)], trainset[,ncol(trainset)])