# practice ####
fn3 = function(d, n=3) {
  print(head(d, n))
  print(tail(d, n))
}

fn3(data)

fn4 = function(d, n=0) {
  print(d[n,])
}

fn4(d, 5)


bt = function(n=1) {
   #return(n * 2)
   n * 2
}
bt(3)

# factor ####

f = factor(2, levels=1:3, labels=c('A', 'B', 'C'), ordered = T)
f
nlevels(f)
levels(f)
class(f)

c=c(1,2,3, 4.5, 'sss')
class(c)
c
rm(v1,v2)

as.numeric(f)
as.vector(f)
f

f2 = factor(1, levels=3:1, labels=c('A', 'B', 'C'))
f2
as.character(f2)

row.names(d) = NULL

# vector ######
v1 = c(1,2,3)
v1
v1[1] + v1[3]
length(v1)
length(data)
ncol(data)
summary(v1)
v1[4] = 4
v1
v1[6] = 6
class(v1)
v1[ c(1,3, 5) ] = 0
v1[1:3] = 0
v1[-3]
v1[-(1:3)]
length(v1)
names(v1) = LETTERS[1:length(v1)]
v1
names(v1)
names(v1) = NULL
LETTERS
letters
rm(v1)

# matrix ########
m1 = matrix(c('A', 'F', 'G', 'D', 'C', 'B'), ncol=3, byrow=T)
m1
m2 = matrix(c(LETTERS, 1, 2,3, 4), ncol=5)
m2
nrow(m2)
ncol(m2)
colnames(m2)
colnames(m2) = c('1분단', '2분단', '3분단', '4분단', '5분단')
rownames(m2) = 1:6
rownames(m2) = 1:nrow(m2)

m2[, c(1,3)]
m2[, '5분단']

data1 = 1:30
rowcnt = 5
m3 = matrix(data1, ncol=length(data1)/rowcnt, byrow=T)
colcnt = 5
m3 = matrix(data1, nrow=length(data1)/colcnt, byrow=T)
m3
m2
colnames(m3) = LETTERS[1:5]
rbind(m2, m3)
cbind(m2, m3)

paste('A', 10, sep='')
paste0('A', 10)
m2

# Try This ########
# 1
blood_type = function(n=1) {
  bf = factor(n, levels=1:4, labels=c('A', 'B', 'O', 'AB'))
  as.vector(bf)
}
blood_type(2)

# 2
append = function(v, val) {
  v[length(v) + 1] = val
  v
}
v1 = 1:3
v1 = append(v1, 4)
v1

# 3
m = matrix(1:(10*20), ncol=20, byrow = T)
m
colnames(m) = LETTERS[1:ncol(m)]
rownames(m) = letters[1:nrow(m)]

paste('A', 'B', sep = '')
paste0('A', 'B')

colnames(m)[10] = paste0(colnames(m)[10], 10)
colnames(m)[20] = paste0(colnames(m)[20], 20)
colnames(m[, c(10,20)])


# data.frame ######
df1 = data.frame(column1=11:15, column2=LETTERS[1:5])
df1
class(df1)
str(m)
str(df1)
m
data
str(data)
class(data)

df2 = data[1:10, 1:6]
df3 = data[1:10, c(1:3, 7,8)]
df2
df3
cbind(df2, df3)

df100 = data[101:110, 1:6]
df100
rbind(df2, df100)

# list ######
lst1 = list(a=1:3, b=4:7)
lst1
lst1$a
str(lst1)
names(lst1)

lst3 = list(1:3, LETTERS[1:3], c(2.5, 4.5, 3.7, 'Q'))
lst3
names(lst3)
str(lst3)

unlist(lst3)

m1
as.data.frame(m1)
data$수학
tbl = table(data$수학)
tbl
as.data.frame(tbl)

factor(5, levels = 1:5)
as.factor(1:5)

# Try This - chap.4 #######
# 1
df2
df3
df4 = cbind(df2, df3[, 4:5])
df4

# 2
df4[, c(1:4, 7, 6, 8, 5)]
cn = colnames(df4)
cn
df4[, c(cn[1:4], '과학', '수학', '예체', '영어')]

# built-in dataset ######
data()
dr = data()$result
str(dr)
head(dr)
class(dr)
dr[, 'Item']

data("AirPassengers")
class(AirPassengers)
AirPassengers

data("trees")
trees
class(trees)
head(trees)
letters
LETTERS
month.name
month.abb
pi
letters = c('AA', 'BB', 'CC')
letters
rm(letters)
ls(pattern = 'Air')

# packages ######
install.packages('data.table')

library('data.table')

start = Sys.time()
#
read.csv('data/성적.csv')
#fread('data/성적.csv', encoding = 'UTF-8')
Sys.time() - start

head(data)

## read sep file #######
sepdata = read.delim('data/sep.txt', sep='#')
str(sepdata)
sepdata$name = as.character(sepdata$name)
View(head(sepdata))
summary(sepdata)

## read tsv ######
tsvdata = read.table("data/tcv.tsv", sep='\t', header = T, stringsAsFactors=F)
str(tsvdata)
summary(tsvdata)
View(tsvdata)

## read fwf ########
fwfdata = read.fwf('data/fwf.txt', header=F, width=c(8, 6, 5, 3, 4))
fwfdata
str(fwfdata)
summary(fwfdata)

## read excel file #########
install.packages('readxl')
library('readxl')
mtx = read_excel('data/meltop100.xlsx', sheet = 1, col_names =T)
mtx
colnames(mtx) = NULL

## Try This - read data file ######
# 1
nrow(mtx)
tail(mtx[-nrow(mtx), ])
mtx = mtx[-nrow(mtx), ]   # remove last row
tail(mtx)
mtx = mtx[, -(2:4)]
save(mtx, file = 'data/meltop_rm_last.rda')
str(mtx)
tail(mtx)
mtx$가수
save(mtx, file = 'data/meltop100.rda')
rm(mtx)
load('data/meltop100.rda')

# 2
mtc = read.csv('data/mtc.csv')
summary(mtc)
tail(mtc)

# 3
temper = read.fwf('data/temper.txt', header=F, width=c(15, 4, 68, 5, 1))
temper  # V2, V4, V5
temper$V1 = NULL
temper$V3 = NULL
temper = temper[, c(2,4,5)]

## chap7. #########
data
boxplot(data$수학)
hist(data$수학)
data[data$학번 == 10337, ]

km = data[data$국어 > 90 & data$수학 > 90, ]
km
km[order(km$수학), ]
mean(data$수학)
sum(data$수학)
median(data$수학)

(data$국어 + data$영어 + data$수학) / 3
colnames(data)
data$총점 = data[,4] + data[,5] + data[,6]
head(data)
data$총점 = NULL

aggregate(data=data, 수학~반, mean)
aggregate(data=data, cbind(국어,영어,수학)~반, mean)

# install.packages('psych')
library('psych')
describe(data)
describe(data, IQR=T)
summary(data)
View(data)
data$avg = (data[,4] + data[,5])
head(data)
data$avg = NULL 
## Try This - Row Operator ######
# 1
km2 = data[data$반 == '난' & data$성별 == '남' & data$국어 > 90 & data$수학 > 90, ]
km2

# 2
