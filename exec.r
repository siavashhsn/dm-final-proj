system('clear')

# caret: Classification and Regression Training
library(caret)

# load the load_data.r and tree.r and nb.r assoc.r files
source("load_data.r")
source("nb.r")
source("tree.r")
source("assoc.r")




cat("\n-----------------------------------------------------------\n")
cat("            [Decision tree contingency table]\n\n")

# test the testset using tree_model which is created in tree.r
tr_prediction 	<- predict(tree_model, testset[,1:(ncol(testset) -1)], type='class')

# confusionMatrix is result of DT
confusionMatrix(tr_prediction, testset[,ncol(testset)])

cat("\n-----------------------------------------------------------\n")
cat("        [Naive Bayesian model contingency table]\n\n")


# test the testset using nb_model which is created in nb.r
nb_prediction 	<- predict(nb_model, testset[,1:(ncol(testset) -1)], type='class')

# confusionMatrix is result of nb
confusionMatrix(nb_prediction, testset[,ncol(testset)])