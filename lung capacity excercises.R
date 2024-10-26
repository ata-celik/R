#first import the data "LungCapData"
# find dimensions of a data

dim(LungCapData)

# first six rows

head(LungCapData)

# last six rows

tail(LungCapData)

#individual row numbers

LungCapData[c(5,6,7,8,9), ]

LungCapData[5:9, ]

#if you want to get the rows,except the ones you write, just throw a "-"

LungCapData[-(5:722), ]

#to learn  the variable names
names(LungCapData)

# if you want to export a file, for example I want to export rows 5 to 9;

write.table(LungCapData[5:9, ], file = "lungcap5to9.csv", row.names = F, sep = ",")

#continue...
# Finding mean

mean(LungCapData$Age)

mean.age <- mean(LungCapData$Age)
mean.age

#if you write "attach" code, you will kind of be in that folder and following codes
#will be searched in that dataset. We don't need to use "$"  over and over again.

attach(LungCapData)
mean(Age)
Age

#for detach; 

detach(LungCapData)

attach(LungCapData)

#for seeing the var??able names on the data
names(LungCapData)
#for seeing the classes on the data; numeric, integer, factor, character...
class(LungCap)
class(Age)
class(Height)
class(Smoke)
class(Gender)
class(Caesarean)
#to see the answers you can use the "levels" function, but somewhow it didn't work.
levels(Smoke)
levels(Gender)
#alternative for the levels;
levels(as.factor(Smoke))
levels(as.factor(Gender))

#summary function can give you a lot:

summary(LungCapData)

#last three columns wasnt giving me what i want. Because there should be "factor" titles instead of character.
#firs i copied my original data to "LungCapDataC" and than used upcoming formulations;
LungCapDataC <- LungCapData

LungCapDataC$Smoke <- as.factor(LungCapDataC$Smoke)
LungCapDataC$Gender <- as.factor(LungCapDataC$Gender)
LungCapDataC$Caesarean <- as.factor(LungCapDataC$Caesarean)

#These three functions individually converted my characters to factors. there is an easier function.
#in one line i could have wrote;
LungCapDataC <- as.data.frame(unclass(LungCapDataC))
#it would have do the same thing but easier
#now my characters are converted into factors. Now detach older data and attach the new one;

detach(LungCapData)
attach(LungCapDataC)

#now lets try summary function;
summary(LungCapDataC)
#perfect, it works.
#now this one works basically too;
levels(Smoke)


#sometimes factors can be presented a 1 and 0. Lets pretend 1 is yes 0 is no.
x <- c(0,1,1,1,0,0,0,0,0,0)

class(x)
summary(x)
#lets convert it to factor;

x<- as.factor(x)
class(x)
summary(x)

#subsetting the data

mean(Age[Gender=="female"])
mean(Age[Gender=="male"])
FemData <- LungCapDataC[Gender=="female",]
MaleData <- LungCapDataC[Gender=="male",]

dim(FemData)
dim(MaleData)
summary(Gender)

#lets use a numeric filtering

MaleOver15 <- LungCapDataC[Gender=="male" & Age>15,]
MaleOver15[1:5,]

#here is a logic command that we can find whether it is true or false
Age[1:5]
temp <- Age>15
temp[1:5]

#now we used as.numeric function to see it in 1 and 0
temp2 <- as.numeric(Age>15)
temp2[1:5]

#let's use more than one filtering; with this command, we are looking for both smoking and female candidates
FemSmoke <- Gender=="female" & Smoke=="yes"
FemSmoke[1:5]

#you can add a new column as our new filter with;
MoreData <- cbind(LungCapDataC, FemSmoke)
MoreData[1:5,]
class(LungCapData)
class(LungCapData$Gender)
rm(LungCapDataC)
z <- summary(LungCapData)
z
rm(list=ls())
