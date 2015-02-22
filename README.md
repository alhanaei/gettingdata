---
title: "Readme"
author: "Ahmed Alhanaei"
date: "February 22, 2015"
output: html_document
---
  






##directory location for the data

```{r}
directory1 <-"~/Coursera/UCI HAR/train"
directory2 <-"~/Coursera/UCI HAR/test"
directory3 <-"~/Coursera/UCI HAR"
```

## read training data
* using read.csv(), seperation = ""

``` {r}
file.list <-list.files(path = directory1,full.names = TRUE,pattern = "*.txt")
train.subject <-read.csv(file.list[1],sep = "",header=FALSE)
train.x<-read.csv(file.list[2],sep = "",header=FALSE)
train.y<-read.csv(file.list[3],sep = "",header=FALSE)
```

##read test data to data frame
```{r}
file.list <-list.files(path = directory2,full.names = TRUE,pattern = "*.txt")
test.subject <-read.csv(file.list[1],sep = "",header=FALSE)
test.x<-read.csv(file.list[2],sep = "",header=FALSE)
test.y<-read.csv(file.list[3],sep = "",header=FALSE)
```

#read activity and subject data to data frame
```{r}
file.list <-list.files(path = directory3,full.names = TRUE,pattern = "*.txt")
activity<-read.csv(file.list[1],sep = "",header=FALSE)
features <-read.csv(file.list[2],sep = "",header=FALSE)
```

#combine test and training data 
* using rbind()

```{r}
xdata<-rbind(test.x,train.x)
ydata<-rbind(test.y,train.y)
subjectdata <- rbind(test.subject,train.subject)
```
##transform activity number t activity names
* do lookup with join() function

```{r}
activitydata <- join(ydata,activity)
```

##compining all data into one data set
* using cbind()

```{r}
alldata<-cbind(subjectdata,activitydata$V2,xdata)
```

## changing the column names
* create vector with words "Subject" and "activity" append features data frame to it
* remove dashes and parentheses 
* make names lower case
* assign the vector to colnames()

```{r}
dcoln<-c("Subject","Activity",as.vector(features$V2[]))
dcoln<-gsub("-"," ",dcoln)
dcoln<-gsub("[()]","",dcoln)
tolower(dcoln)
colnames(alldata)<-c(dcoln)
```

## selecting mean and SD columns
* create a vector (for selection)  with location of mean or std as column name, using grep() add 1 ,2 for subject and activity.
* create new data set (untidy) that contain only the selected columns.

```{r}
selectedcol <- c(1,2,grep(".*mean.*|.*std.*",colnames(alldata)))
untidy<-alldata[selectedcol]
```

## generating the Tidy data
* use aggregate() to apply mean() to all columns (except grouping column 1 and 2)

```{r}
tidy<-aggregate(x = untidy[-(1:2)], by = list(newdata$Subject,newdata$Activity), FUN = "mean")
```

## saving the tidy data to a text file.
```{r}
write.table(tidy,"tidy.txt", row.name=FALSE)
...






