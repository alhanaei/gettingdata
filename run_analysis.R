
library("plyr")


setwd("C:/Users/aaalhanaee/Documents/DataScience/Coursera")

##directory location for the data
directory1 <-"./UCI HAR/train"
directory2 <-"./UCI HAR/test"
directory3 <-"./UCI HAR"
file.list <-list.files(path = directory2,full.names = TRUE,pattern = "*.txt")



## read training data
file.list <-list.files(path = directory1,full.names = TRUE,pattern = "*.txt")
train.subject <-read.csv(file.list[1],sep = "",header=FALSE)
train.x<-read.csv(file.list[2],sep = "",header=FALSE)
train.y<-read.csv(file.list[3],sep = "",header=FALSE)

##read test data
file.list <-list.files(path = directory2,full.names = TRUE,pattern = "*.txt")
test.subject <-read.csv(file.list[1],sep = "",header=FALSE)
test.x<-read.csv(file.list[2],sep = "",header=FALSE)
test.y<-read.csv(file.list[3],sep = "",header=FALSE)

#read activity and subject data
file.list <-list.files(path = directory3,full.names = TRUE,pattern = "*.txt")
activity<-read.csv(file.list[1],sep = "",header=FALSE)
features <-read.csv(file.list[2],sep = "",header=FALSE)


#combine test and training data
xdata<-rbind(test.x,train.x)
ydata<-rbind(test.y,train.y)
subjectdata <- rbind(test.subject,train.subject)

##transform activity in activity names
activitydata <- join(ydata,activity)

##compining all data into one data set
alldata<-cbind(subjectdata,activitydata$V2,xdata)


## changing the column names
dcoln<-c("Subject","Activity",as.vector(features$V2[]))
dcoln<-gsub("-"," ",dcoln)
dcoln<-gsub("[()]","",dcoln)
tolower(dcoln)
colnames(alldata)<-c(dcoln)


## selecting mean and SD columns
selectedcol <- c(1,2,grep(".*mean.*|.*std.*",colnames(alldata)))
untidy<-alldata[selectedcol]


## generating the Tidy data
tidy<-aggregate(x = untidy[-(1:2)], by = list(untidy$Subject,untidy$Activity), FUN = "mean")

## saving the tidy data to a text file.
write.table(tidy,"tidy.txt", row.name=FALSE)

    
    