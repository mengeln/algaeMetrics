library(plyr)
library(stringr)

lapply(list.files("r", full.names=TRUE), source)

testdata <- read.csv("C:/Users/marke/Desktop/sampleTemplate.csv", stringsAsFactors=FALSE)
# testmeta <- read.csv("C:/Users/marke/Desktop/algaeMetaData3.csv")

testdata$FinalID[1] <- "bla1"
testdata$FinalID[2] <- "bla2"


result <- try(algae.IBIs(testdata))


# taxonInfo(testdata, testmeta)
