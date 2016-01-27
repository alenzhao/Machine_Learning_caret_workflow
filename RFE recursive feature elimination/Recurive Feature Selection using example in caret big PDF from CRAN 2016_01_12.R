# Recurive Feature Selection from big caret pdf from CRAN, dated Jan 6 2016
# See ref()

rm(list=ls(all=TRUE))

data(BloodBrain)

dim(logBBB)
head(logBBB)
attributes(logBBB)
str(logBBB)
colnames(logBBB)

x <- scale(bbbDescr[,-nearZeroVar(bbbDescr)])
x <- x[, -findCorrelation(cor(x), .8)]
x <- as.data.frame(x)

dim(x)
head(x)
attributes(x)
str(x)
colnames(x)

rfProfile <- rfe(x, logBBB,
                 sizes = c(2, 5, 10, 20),
                 rfeControl = rfeControl(functions = rfFuncs))

