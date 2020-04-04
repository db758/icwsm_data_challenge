library(stm)
setwd("Desktop/icwsm_data_challenge/race_classifier/data/")
data <- read.csv('founta_race_annotated_2.csv') 
data <- data[!(data$label == "spam"),]
data <- data[!(data$afam == -9),]
processed <- textProcessor(data$cleaned_text, metadata = data.frame(data$label,data$afam, data$white))
out <- prepDocuments(processed$documents, processed$vocab, processed$meta)
docs <- out$documents
vocab <- out$vocab
meta <-out$meta
hatespeechFit <- stm(documents = out$documents, vocab = out$vocab,K=25, max.em.its = 200, data = out$meta, init.type = "Spectral") #K=25, 27 iterations to converge
labelTopics(hatespeechFit)
plot.STM(hatespeechFit,type="summary")
plot.STM(hatespeechFit, type = "labels")

#might be worth using searchK for K=10, 15, 20, 25, 30, 35 instead of current range 5-25?
#how to use findThoughts and estimateEffect !! 