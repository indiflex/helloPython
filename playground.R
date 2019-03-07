Sys.sleep(10)

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
data
km2 = data[data$반 == '난' & data$성별 == '남' & data$국어 > 90 & data$수학 > 90, ]
km2[order(-km2$국어),]

# 2
data$평균 = (data[, 4] + data[, 5] + data[, 6] + data[, 7] + data[, 8])/5
head(data)
aggregate(data=data[data$국어 >= 80,], cbind(국어, 평균)~반, mean)

# ifelse #########
data$pass = ifelse(data$평균 >= 60, TRUE, FALSE)
data[data$pass, ]

data$scout = ifelse(data$평균 >= 60, 
                    ifelse(data$성별 == '남', 'BoyScout', 'GirlScout'),
                    '')
head(data, 20)
library(ggplot2)

qplot(data$pass)

## Try This #######
# 1 - scout
qplot(data[data$scout != '',]$scout)

# 2
data$학점 = ifelse(data$평균 >= 90, 'A',
                 ifelse(data$평균 >= 80, 'B', 
                        ifelse(data$평균 >= 70, 'C',
                               ifelse(data$평균 >= 60, 'D', 'F'))))


head(data)

# 3 
qplot(data$학점)



## ggplot2::mpg #######
library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)
summary(mpg)
colnames(mpg)
head(mpg)
mpg$fl
?mpg

midwest = as.data.frame(ggplot2::midwest)
summary(midwest)
colnames(midwest)
head(midwest)
midwest
data
# 1
mpg$cthw = mpg$cty + mpg$hwy
head(mpg)
mpg[order(-mpg$cthw),]

# 2
x = aggregate(data=mpg, cthw~(year+fl), mean)
x[order(x$year), ]

# 3
midwest = as.data.frame(ggplot2::midwest)
midwest
summary(midwest)
library(psych)
describe(midwest)
describe(midwest[,4:27], na.rm = T)
colnames(midwest)
head(midwest)
aggregate(data=midwest, cbind(poptotal, popdensity, popasian)~state, mean)

# 4
colnames(midwest)
colnames(midwest)[5] = 'total'
colnames(midwest)[10] = 'asian'

# 5
ta = sum(midwest$asian)
midwest$asianpct = (midwest$asian / ta) * 100
sum(midwest$asianpct)
hist(midwest$asianpct)
library(ggplot2)
plot(midwest$asianpct)

# 6
midwest[order(midwest$asianpct),]
aggregate(data=midwest, asianpct~state, mean)
y = midwest[, c(2:3, 10,15,29)]
tt = y[order(-y$asianpct),]
head(tt)
tail(tt)
avg_a = mean(midwest$asianpct)
midwest$asianrate = ifelse(midwest$asianpct > avg_a, 'lg', 'sm')
head(midwest)
qplot(midwest$asianrate)

# rep & seq #######
seq(1,10, by=2)
rep(1, times=3)
rep(LETTERS[1:3], times=3)
rep(LETTERS[1:3], each=3)
rep(c('I', 'am'), each=2, length.out=7)

rep(c('김일수', '김이수'), each=2)

data.frame(customer=rep(c('김일수', '김이수'), each=2), 
           menu=rep(c('짜장', '짬뽕'), times=2) )

1:10
-3:5
5.5:-4.5
seq(from=1, to=10, by=0.5)
seq(5.4, -8.5, length.out=10)

# runif & sample #########
runif(20) 
t = runif(n=30, min=10, max=20)
t
plot(t[order(t)])

set.seed(100); sample(1:5, size=3)
sample(1:5, size=3)

sample(1:50, size=30, replace = F)
data
data[sample(1:nrow(data), size=5),]

colnames(data)

data
print("aaaaaaaaaa")
cat(nrow(data), nrow(data[data$c1 == 'AA',]))
data$c1 = sample(c('AA', 'BB'), size=nrow(data), replace=T)
data$c1 = sample(c('AA', 'BB'), size=nrow(data), replace=T, prob = c(0.5,0.5))

set.seed(255)
smdt = data.frame(stuno = 1:5, 
                  Korean=sample(60:100, 5),
                  English=sample((5:10) * 10, 5),
                  Math=sample(50:100, 5))
smdt

## string #########
s = "abc,efg,abc"
nchar(s)
toupper(s)
substr(s, 1, 5)
x=strsplit(s, ',')
class(x)
sub('abc', 'ttt', s)
gsub('abc', 'ttt', s)
sub(pattern='abc/g', replacement='ttt', x=s)
sub(pattern='^abc/g', replacement='ttt', x=s)
s = "first\tsecond\nthird"
print(s)
cat(s)
paste0('aaa-bbb', 'ccc-ddd')
data[1:3, '반']
paste(data[1:3, '반'])
paste(data[1:3, '반'], collapse='**')

outer(month.abb, 2011:2020, paste, sep='-')
outer(LETTERS, 2010:2020, paste0)

grep(pattern='^2.+0$', x=data$학번, value = T)
data$학번

s = "aBc,efg,abc,"
gsub(pattern='[,]+a.+', replacement='ttt', x=s, ignore.case = T)
gsub(pattern='[,]+a(.*)', replacement='ttt', x=s, ignore.case = T)
gsub(pattern='[,]+[ae].*,', replacement='ttt', x=s, ignore.case = T)
s

Sys.time()
d1 = as.Date('2019-03-05 09:00')
class(d1)
d1
dt1 = as.POSIXct('2019-03-04 09:00')
class(dt1)
seq(dt1, as.POSIXct('2019-04-02'), by='day')
seq(dt1, as.POSIXct('2019-04-01'), by='2 hour')
seq(dt1, as.POSIXct('2019-04-01 23:59'), by='min')

install.packages('lubridate')
library(lubridate)
ymd('20190305')
mdy('03052019')
year(dt1)
day(dt1) = 15
dt1
days_in_month(1:12)
ddays(10)
duration(1000)
round(as.POSIXct('2019-03-05 18:39:45'), 'min') 

x = 5
5+5 -> x
f = function(n) {
  print(paste('x=', x, ', n=', n))
}
#f(n = 30)  vs f(n <- 30)
x=10
f2 = function(n) {
  #x = n
  x <<- n
  print(paste('x=', x, ', n=', n))
}
f2(50)
x


for (i in 1:3) { print(i) }
switch(2, "111", "222", "333")
for (r in 1:nrow(data)) { print (data[r, 'scout']) }

while(i < 10) { print(i); i = i + 1 }

i = 0
while(TRUE) { 
  i = i + 1
  #print(i %% 2)
  if (i %% 2 == 0)
    next
  
  if (i > 10)
    break
  
  print(i)
}

# apply ######
apply(smdt[, 2:4], MARGIN = 2, FUN = mean)
smdt

apply(smdt[, 2:4], MARGIN = 2, FUN = quantile)

l = lapply(smdt[, 2:4], FUN = mean)
l
unlist(l)

sapply(smdt[, 2:4], FUN = mean, simplify = T)
apply(smdt[, 2:4], MARGIN = 2, FUN = mean)

vapply(smdt[, 2:4], FUN = mean, FUN.VALUE = 10)
smdt

library('reshape2')
dim(data)
data.frame(no=1:4, year=2016:2019)
list(1:4, paste0('Q', 1:4))
matrix(round(runif(16), 3) * 1000, ncol=4, dimnames = list(NULL, paste0('Q', 1:4)))

dfsum = cbind( data.frame(no=1:4, year=2016:2019), 
               matrix(round(runif(16), 3) * 1000, ncol=4, dimnames = list(NULL, paste0('Q', 1:4))) )
dfsum
melt(data=dfsum[,2:6], id.vars = "year")
meltsum = melt(dfsum[,2:6], id.vars = "year", variable.name = 'Sales')
meltsum

dcast(meltsum, Sales~year, value.var="value")
dfsum

smdt[order(smdt$Korean),]


### Try This - PF ############
# 1
data = read.csv('data/성적.csv')
data
sample(c(rep('A조', 160), rep('B조', 160), rep('C조', 160))) -> data$group
head(data, 100)

# 2
# fibonacci.R 참조

# 3
set.seed(255)
smdt = data.frame(stuno = 1:5, 
                  Korean=sample(60:100, 5),
                  English=sample((5:10) * 10, 5),
                  Math=sample(50:100, 5))
smdt
class(smdt$Korean)
class(smdt$Math)
smdt[nrow(smdt) + 1, ] = c('계', sapply(smdt[, 2:4], FUN = mean, simplify = T))

smdt$Korean = as.integer(smdt$Korean)
smdt[, 2:4] = as.integer(smdt[, 2:4])
for (i in 2:4) {
  smdt[, i] = as.integer(smdt[, i])
}
class(smdt[, 2:4])

smdt$total = apply(smdt[, 2:4], MARGIN = 1, FUN = sum)
smdt$avg = apply(smdt[, 2:4], MARGIN = 1, FUN = mean)
smdt
smdt$avg = round(smdt$avg)
matrix(round(runif(48), 3) * 100000, ncol=12, 
       dimnames = list(NULL, month.abb))
sales = cbind( data.frame(no=1:4, year=2016:2019), 
               matrix(round(runif(48), 3) * 100000, ncol=12, 
                      dimnames = list(NULL, month.abb)) )
sales
melt(data=sales[,2:ncol(sales)], id.vars = "year", variable.name = 'month', value.name = 'saleamt')


######## order, sort ###############
smdt[order(smdt$avg, -smdt$Korean),]
t = c(5, 7, 2, 8, 20, 11, 19)
t[order(t)]
rev(t)
sort(t)

#### missing values #########
t = c(1:5, NA, 7, NA, 9, 10)
mean(t, na.rm = T)
t[!is.na(t)]
mean(t[!is.na(t)])
table(data$반)
is.na(t)
table(is.na(t))
t[is.na(t)]
t = ifelse(is.na(t), 0, t)
t

m1 = m2 = m3 = matrix(c(1:3, NA, 9:3, NA, 1:3), nrow=3)
m1
m1[is.na(m1)] = 0 
m2
m2[is.na(m2[,2]), 2] = 5555

dataArray = array(1:24, dim=c(3, 4, 2)) 
dataArray
dim(dataArray)

dimnames(dataArray)
dimnames(dataArray) = list( 1:3, c('c1', 'c2', 'c3', 'c4'), c('x','y'))

ad1 = dataArray[,,1]
ad1
attr(dataArray, "dim") = c(3,8)
dataArray

#### dplyr #######
smdt
data = read.csv('data/성적.csv')
head(data)
library(dplyr)
library(ggplot2)
data = dplyr::rename(data, math=수학)
a.b = 123

attach(data)
data$국어 + data$수학
mean(국어)
sum(math)
detach(data)

with(data, mean(math))

data[data$group == 'C조',]
data %>% filter(group == 'C조') 
data %>% filter(group %in% c('A조', 'C조'))
data %>%
  filter(group == 'C조') %>%
  select(-반, -영어) %>% head

d1 = data
d1 = rename(d1, math=)
head(d1)
mean(d1$math)
d1 = rename(d1, kor=math)

select(data, math)
plot(data$math)

data = dplyr::rename(data, math=수학)
data = dplyr::rename(data, kor=국어, sci=과학, eng=영어, art=예체)
data = dplyr::rename(data, stuno=학번, cls=반, gen=성별)
head(data)

data %>% arrange(desc(math)) %>% head
data %>% arrange(math, desc(eng)) %>% head

data %>% mutate(subTotal = kor + eng + math) %>% head
data

data %>%
  mutate(kor_eng = kor + eng) %>%
  arrange(desc(kor_eng)) %>%
  head

x = data %>% summarize(t = mean(math))
class(x)
class(mean(data$math))

?summarise

data %>% group_by(cls) %>% summarise(m = mean(math))
data %>% head

data %>% 
  group_by(cls, gen) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            medi_math = median(math),
            n_math = n()) %>%
  arrange(cls, gen, desc(mean_math))


data %>% 
  group_by(cls, gen) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            medi_math = median(math),
            n_math = n()) %>%
  group_by(gen) %>%
  summarise(mean_gen = mean(mean_math)) %>%
  arrange(gen, desc(mean_gen))

### join ########
dfsum = cbind( data.frame(yno=1:4, year=2016:2019), 
               matrix(round(runif(16), 3) * 1000, ncol=4, dimnames = list(NULL, paste0('Q', 1:4))))
dfsum
sales = cbind( data.frame(no=1:12, year=2016:2019), 
               matrix(round(runif(144), 3) * 100000, ncol=12, dimnames = list(NULL, month.abb)) )
sales

left_join(sales, dfsum, by=c('year' = 'year'))
right_join(sales, dfsum, by=c('year' = 'year'))

inner_join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
semi_join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
full_join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
anti_join(sales, dfsum, by=c('no' = 'yno'))

topsale4 = sales[1:4,] %>% select(year, Jan, Apr, Jul, Oct)
top4 = sales[5:8,] %>% 
  select(1:4, year, Jan, Apr, Jul, Oct) %>% 
  rename(yno=no, Q1=Jan, Q2=Apr, Q3=Jul, Q4=Oct)

topsale4
top4
dfsum
bind_rows(dfsum, topsale4)
bind_rows(dfsum, top4)
bind_rows(dfsum, top4, .id = 'group')

bind_cols(dfsum, top4)
cbind(dfsum, top4)
bind_cols(dfsum, top4) %>% select(-year1, -yno1, -Feb)


###### Try This : dplyr #############
# 1

mpg = as.data.frame(ggplot2::mpg)
mpg
mpg %>% filter(class %in% c('suv', 'compact')) %>%
  select(model, cty, hwy) %>% head

# 2 
mpg %>% arrange(desc(hwy)) %>% head(5)

# 3
mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(m = mean( (cty + hwy) / 2)) %>%
  arrange(desc(m)) %>%
  head(5)

# 4
t = table(mpg$fl)
n = names(t)
n
dput(n)


flpr = data.frame(fl = c("c", "d", "e", "p", "r"),
                  price = c(1.33, 1.02, 0.92, 1.99, 1.22), stringsAsFactors = F )
flpr
class(mpg$fl)

mpg = inner_join(mpg, flpr, by=c('fl', 'fl')) %>% rename(fl_price = price) %>% head
mpg
