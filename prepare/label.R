library(readr)

setwd('/home/xuranzeng/thesis')

label<-read.csv("EC_labels.csv")


path<-read.csv("EC_path.csv")[,-1]
colnames(path)[1]<-"path"


library(dplyr)
sentiment<- path %>%
  left_join(label,by='path') %>%
  arrange(Company, Day, Filename)



speaker<-as.data.frame(sentiment$Filename)
colnames(speaker)<-"Filename"
for (i in 1:nrow(speaker)){
  file<-str_sub(speaker[i,'Filename'],1,nchar(speaker[i,'Filename'])-4)
  speaker[i,2:4]<-str_split(file,"_")[[1]]
}
colnames(speaker)[2:4]<-c("Speaker","Para","Sentence")
speaker$Para<-as.numeric(speaker$Para)
speaker$Sentence<-as.numeric(speaker$Sentence)


sentiment2<- sentiment %>%
  left_join(speaker,by='Filename') %>%
  arrange(Company, Day, Para,Sentence)%>% 
  distinct()

sentiment2$Score<-0*sentiment2$X0+1*sentiment2$X1+2*sentiment2$X2

#write_csv(sentiment2,"merged_sentiment.csv")



sample<-sentiment2[1:179,]
sample$moment<-paste(sample$Para,sample$Sentence,sep="_")

library(ggplot2)

sample$label<-as.numeric(sample$label)



raw<-sample[,c("moment","label","Score")]


ggplot(raw,mapping = aes(moment,Score,fill=label))+
  geom_bar(stat='identity') +
  labs(x = 'time',y = 'sentiment') +
  theme_bw()




ggplot(raw, aes(x=as.factor(moment), y=label)) +       # Note that id is a factor. If x is numeric, there is some space between the first bar
  geom_bar(stat="identity", fill=alpha("blue", 0.3)) +
  theme_minimal() +
  coord_polar(start = 0)


# MLE
sentiment2


hist(sentiment2$label, breaks = 50,probability = T ,main = "Histogram of label")
lines(density(sentiment2$label), col="red", lwd=2)
