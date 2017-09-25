
#Read the data files into local variables
a_test  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
a_train <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

s_train <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
s_test  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

f_test  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
f_train <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)


#Merge the training and test sets of each data set
s_data <- rbind(s_train, s_test)
a_data<- rbind(a_train, a_test)
f_data<- rbind(f_train, f_test)

#Apply column names to the data sets
names(s_data)<-c("subject")
names(a_data)<- c("activity")
f_names <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(f_data)<- f_names$V2

#Merge the data sets into a single data set
Data <- cbind(f_data, cbind(s_data, a_data))

#Get the column names matching mean or std
sub_f_names<-f_names$V2[grep("mean\\(\\)|std\\(\\)", f_names$V2)]

#Create extration list of colum names we're interested in
selectedNames<-c(as.character(sub_f_names), "subject", "activity" )

#Extract target data columns to replace into our data variable
Data<-subset(Data,select=selectedNames)

#Rename column names to something more human readable
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

library(plyr);

#Create mean data values 
Data2<-aggregate(. ~subject + activity, Data, mean)

#Write to file
write.table(Data2, file = "outputdata.txt",row.name=FALSE)
