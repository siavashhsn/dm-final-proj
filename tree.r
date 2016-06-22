library(rpart)

cat("> Building `Decision Tree` model\n")

tree_model <- rpart(class~., method="class", data=trainset)



# plot tree
plot(tree_model, uniform=TRUE, main="Classification Tree")
text(tree_model, use.n=TRUE, all=TRUE, cex=.8)