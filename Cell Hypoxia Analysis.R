library(foreign)
library(dplyr)

path = '/Users/student/Desktop/200401/'
setwd(path)
HypInt = read.csv('200401 Hyp Intensity Values.csv')

# Creates the C1, C2, C3, and C4 classifications
YoungMax = max(HypInt$Mean.Intensity[HypInt$Age == 6])
YoungMin = min(HypInt$Mean.Intensity[HypInt$Age == 6])
YoungVar = YoungMax - YoungMin
C1 = (YoungVar / 4) + YoungMin
C2 = (YoungVar / 4)*2 + YoungMin
C3 = (YoungVar / 4)*3 + YoungMin
C4 = (YoungVar / 4)*4 + YoungMin

# Assigns every value in the old and young datasets a classification based on the variance of the young intensity values
HypInt$Classification = NA
HypInt$Classification[HypInt$Mean.Intensity <= C4] = '4'
HypInt$Classification[HypInt$Mean.Intensity <= C3] = '3'
HypInt$Classification[HypInt$Mean.Intensity <= C2] = '2'
HypInt$Classification[HypInt$Mean.Intensity <= C1] = '1'

# Splits data into separate files according to digit
DividedSets = split(HypInt, list(HypInt$Age, HypInt$Day), drop = FALSE)
DPA0YoungL = DividedSets[1]
DPA0OldL = DividedSets[2]
DPA7YoungL = DividedSets[3]
DPA7OldL = DividedSets[4]
DPA10YoungL = DividedSets[5]
DPA10OldL = DividedSets[6]
DPA14YoungL = DividedSets[7]
DPA14OldL = DividedSets[8]
DPA21YoungL = DividedSets[9]
DPA21OldL = DividedSets[10]
DPA42YoungL = DividedSets[11]
DPA42OldL = DividedSets[12]

DPA0Young = as.data.frame(DPA0YoungL)
DPA0Old = as.data.frame(DPA0OldL)
DPA7Young = as.data.frame(DPA7YoungL)
DPA7Old = as.data.frame(DPA7OldL)
DPA10Young = as.data.frame(DPA10YoungL)
DPA10Old = as.data.frame(DPA10OldL)
DPA14Young = as.data.frame(DPA14YoungL)
DPA14Old = as.data.frame(DPA14OldL)
DPA21Young = as.data.frame(DPA21YoungL)
DPA21Old = as.data.frame(DPA21OldL)
DPA42Young = as.data.frame(DPA42YoungL)
DPA42Old = as.data.frame(DPA42OldL)

write.csv(DPA0Young,)
# Writes all the data into a new file with intensity classifications included for each cell
write.csv(DPA0Old,'/Users/student/Desktop/200401/Log Transformations/DPA 0 18mo.csv', row.names = FALSE)
write.csv(DPA0Young,'/Users/student/Desktop/200401/Log Transformations/DPA 0 8wk.csv', row.names = FALSE)
write.csv(DPA7Old,'/Users/student/Desktop/200401/Log Transformations/DPA 7 18mo.csv', row.names = FALSE)
write.csv(DPA7Young,'/Users/student/Desktop/200401/Log Transformations/DPA 7 8wk.csv', row.names = FALSE)
write.csv(DPA14Old,'/Users/student/Desktop/200401/Log Transformations/DPA 14 18mo.csv', row.names = FALSE)
write.csv(DPA14Young,'/Users/student/Desktop/200401/Log Transformations/DPA 14 8wk.csv', row.names = FALSE)
write.csv(DPA21Old,'/Users/student/Desktop/200401/Log Transformations/DPA 21 18mo.csv', row.names = FALSE)
write.csv(DPA21Young,'/Users/student/Desktop/200401/Log Transformations/DPA 21 8wk.csv', row.names = FALSE)
write.csv(DPA42Old,'/Users/student/Desktop/200401/Log Transformations/DPA 42 18mo.csv', row.names = FALSE)
write.csv(DPA42Young,'/Users/student/Desktop/200401/Log Transformations/DPA 42 8wk.csv', row.names = FALSE)

# Splits the data into separate tables according to age
DividedAgeSets = split(HypInt, HypInt$Age, drop = FALSE)
View(DividedAgeSets)
YoungData = as.data.frame(DividedAgeSets[1])
OldData = as.data.frame(DividedAgeSets[2])
write.csv(YoungData, '/Users/student/Desktop/200401/Young Data LT.csv', row.names = FALSE)
write.csv(OldData,'/Users/student/Desktop/200401/Old Data LT.csv', row.names = FALSE)

# Analyzing the cells' classification based on age
sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 0 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 0 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 0 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 0 & HypInt$Age == 6))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 0 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 0 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 0 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 0 & HypInt$Age == 18))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 7 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 7 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 7 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 7 & HypInt$Age == 6))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 7 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 7 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 7 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 7 & HypInt$Age == 18))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 10 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 10 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 10 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 10 & HypInt$Age == 6))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 10 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 10 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 10 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 10 & HypInt$Age == 18))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 14 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 14 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 14 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 14 & HypInt$Age == 6))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 14 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 14 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 14 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 14 & HypInt$Age == 18))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 21 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 21 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 21 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 21 & HypInt$Age == 6))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 21 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 21 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 21 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 21 & HypInt$Age == 18))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 42 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 42 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 42 & HypInt$Age == 6))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 42 & HypInt$Age == 6))

sum(with(HypInt, HypInt$Classification == 1 & HypInt$Day == 42 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 2 & HypInt$Day == 42 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 3 & HypInt$Day == 42 & HypInt$Age == 18))
sum(with(HypInt, HypInt$Classification == 4 & HypInt$Day == 42 & HypInt$Age == 18))

HypInt$LogTrans = NA
HypInt$LogTrans = log(HypInt$Mean.Intensity)

View(HypInt)