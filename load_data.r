# splitdf function will return a list of training and testing sets


# using this site : http://stackoverflow.com/questions/17200114/
# 						 how-to-split-data-into-training-testing
#						 -sets-using-sample-function-in-r-program

#and using this site to : http://www.gettinggeneticsdone.com/2011/02/
#						  split-data-frame-into-testing-and.html

splitdf <- function(dataframe, training_portion = 0.7, seed=NULL) {
	if (!is.null(seed)) set.seed(seed)
	index 		<- 1:nrow(dataframe)
	tindex 		<- sample(index, trunc(length(index) * training_portion))
	trainset 	<- dataframe[tindex, ]
	testset 	<- dataframe[-tindex, ]
	list(trainset = trainset, testset = testset)
}

iprintf 	<- function(...) invisible(cat(sprintf(...)))
isize 		<- function(a) iprintf("[%i, %i]\n", nrow(a), ncol(a)) 

library(foreign)

cat("> Loading dataset\n")
if(!(file.exists("trainset.arff") && 
	 file.exists("testset.arff"))) {

	dataset 	<- read.arff('credit_fruad.arff')

	cat("> Shuffling dataset\n")
	for(iter in 1:100) 
		dataset <- dataset[sample(nrow(dataset)), ]

	cat("> Building train/test sets\n")
	splits 		<- splitdf(dataset, training_portion = 0.7, seed=808)
	trainset 	<- splits$trainset
	testset 	<- splits$testset

	write.arff(trainset, "trainset.arff")
	write.arff(testset, "testset.arff")
} else {
	cat("> Reading from cache sets!\n")
	trainset 	<- read.arff('trainset.arff')
	testset 	<- read.arff('testset.arff')
	dataset 	<- rbind(trainset, testset)
}
