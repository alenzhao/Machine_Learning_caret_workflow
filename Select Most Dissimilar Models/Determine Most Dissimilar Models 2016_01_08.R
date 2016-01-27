# Select Most Dissimlar Models For Evaluation Using Caret

# Neal Cariello
# 8 Jan 2016

# clear the decks.
rm(list=ls(all=TRUE))

setwd("F:/Google Drive/R/caret/Select Most Dissimilar Models")   # home
# setwd("C:/Google Drive/R/caret/Select Most Dissimilar Models")   # work

tag <- read.csv("tag_data.csv", row.names = 1)
tag <- as.matrix(tag)

## Select only models for Regression or Classification
regModels <- tag[tag[,"Classification"] == 1,]

all <- 1:nrow(regModels)

## Seed the analysis with the model you want to find dissimlar models for
start <- grep("(rpart)", rownames(regModels), fixed = TRUE)
pool <- all[all != start]

## Select 4 model models by maximizing the Jaccard
## dissimilarity between sets of models
nextMods <- maxDissim(regModels[start,,drop = FALSE],
                      regModels[pool, ],
                      method = "Jaccard",
                      n = 6)

rownames(regModels)[c(start, nextMods)]
