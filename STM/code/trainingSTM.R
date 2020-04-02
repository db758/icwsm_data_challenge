library(stm)
setwd("Downloads/ICWSM-2020-Twitter-Inappropriate-Speech/")
data <- read.csv('hatespeech_text_label_vote_RESTRICTED_100K.csv', header=F) 
data <- data[!(data$V2 == "spam"),]
processed <- textProcessor(data$V1, metadata = data.frame(data$V2))
out <- prepDocuments(processed$documents, processed$vocab, processed$meta)
docs <- out$documents
vocab <- out$vocab
meta <-out$meta
hatespeechFit <- stm(documents = out$documents, vocab = out$vocab,K=15, max.em.its = 150, data = out$meta, init.type = "Spectral") #model converged in 119 iterations 
labelTopics(hatespeechFit)
plot.STM(hatespeechFit,type="summary")
plot.STM(hatespeechFit, type = "labels")
#how to use findThoughts and estimateEffect !! 



#using searchK  
#storage <- searchK(out$documents, out$vocab, K = c(5, 10, 15, 20, 25, 30), data = meta)
#show(storage)

#K=5 - 85 iterations to converge
#K=10 - 174  iterations to converge
#K=15 - 102 iterations to converge 
#K=20 - 19 iterations to converge 
#K=25 - 75 iterations to converge 
#best between 15 and 20 topics 