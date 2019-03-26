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


data
smdt
prePar = par(col='red')
plot(smdt)
par(prePar)
plot(data$eng, main='영어성적')



plot(x=1, y=1)
plot(x=1:10, y=1:10)
plot(sin, -pi, pi * 3)
sin(30)
plot(smdt$stuno, smdt$Korean)
plot(smdt$stuno, smdt$Korean, col='lightblue') 

colors() 
?points

plot(x = smdt$stuno, y = smdt$Korean,
     col = '#0000FF',
     cex = 2,
     las = 1,
     type = 'p',         # p, l, b, c, o, s
     xlim = c(-0.5, 5.5),
     ylim = c(0, 100),
     pch = 13,                         # > ?points
     xlab = '학번', ylab = '국어',
     main = '그래프 타이틀')

xl = c(-0.5, 8.5); yl = c(0, 100)
plot(x = smdt$stuno, y = smdt$Korean,
     col='#0000FF', cex=3, pch = 8,
     xlim = xl, ylim = yl,
     xlab = '학번', ylab = '국어, 수학',
     main = '우리반 국어 / 수학 성적')
par(new = T)
plot(x = smdt$stuno, y = smdt$Math,
     col='#ff0000', cex=3, pch = 21,
     xlim = xl, ylim = yl,
     xlab = '', ylab = '')

l=legend('center',
       legend=c('국어', '수학'),
       pch=c(8, 21), col=c('blue', 'green'), bg='gray')


head(data)
t = data %>% filter(eng > 90) %>% select('cls') %>% table
t = data %>% filter(eng > 90) %>% select('cls', 'gen') %>% table
t
barplot(t,
        beside = T,
        horiz = T,
        border = 'dark blue',
        density = 50,
        las = 1, 
        cex.names = 0.8,
        xlim = c(0, 13),
        main='영어성적 상위권 학생',
        angle = 15 + 10*1:2,
        xlab = '학급별 성별', ylab = '영어',
        legend=rownames(t),
        col=heat.colors(5))

boxplot(data$kor)
boxplot(kor~cls, data=data, col='lightblue')
boxplot(kor~gen, data=data, col='lightblue')

hist(data$kor, col="gray", labels=T, breaks=10)

curve(tan, -2 * pi, 3 * pi,
      xname='국어', xlab = 'TT',
      n=200, type='p')


d = data %>% filter(kor > 90) %>% select('cls')
d
table(d)
pie(table(d))
pie(table(d), clockwise = T)
pie(table(d), clockwise = T, col=c('red', 'purple', 'green', 'cyan'))

save(data, file='data/data_eng.rda')
data


## ggplot2 ############
smdt

ggplot() + geom_line(data=smdt, aes(x=stuno, y=Korean))
smdt
ggplot() + geom_point(data=smdt, aes(x=stuno, y=Korean))

ggplot(data=smdt) +
  geom_point(aes(x=stuno, y=Korean),
             color='blue', size = 5)

ggplot(data=smdt) +
  geom_point(aes(x=stuno, y=Korean, color=stuno),
             size = 5)

ggplot(data=smdt) +
  geom_point(aes(x=stuno, y=Korean, 
                 color=stuno, size=stuno))

data
d = data %>% filter(stuno >= 30000)
d
library(ggplot2)
library(dplyr)
ggplot(d %>% filter(kor > 80), aes(cls, kor)) +
  geom_point(aes(color=cls, size=kor), 
             alpha=0.3)

ggplot(mpg, aes(cty, hwy)) + geom_point() + xlim(20,25)

## line ######
mpg = as.data.frame(ggplot2::mpg)
head(mpg)
nrow(mpg)
d2 = mpg %>%
  group_by(manufacturer, displ) %>% 
  summarise(m1 = mean(cty), m2 = mean(hwy))
d2
ggplot(d2, aes(x=displ)) + 
  geom_line(aes(y=m1, color='cty')) + 
  geom_line(aes(y=m2, color='hwy'), size=1) +
  scale_colour_manual("", breaks = c("cty", "hwy"),
                      values = c("red", "blue")) +
  xlab("x축") +
  xlim(1, 8) +
  scale_y_continuous("y축", limits = c(5, 45)) +
  labs(title = '타이틀', subtitle = '서브 타이틀') 


ggplot(mpg, aes(displ)) +
  geom_histogram(aes(fill=class), 
                 # binwidth = .3,
                 bins = 5,
                 col='black',       # line color
                 size=.1) +         # line size
  labs(title = 'Title', subtitle = 'Sub Title', fill='등급')


ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill=class),
           width = 0.9) +
  theme(axis.text.x = element_text(angle=85,  
                                   vjust=0.6)) +  
  scale_fill_discrete(name = "class") + 
  labs(title = 'Title', subtitle = 'Sub Title')


ggplot(mpg, aes(cty)) +
  geom_density(aes(fill=factor(cyl)), alpha=0.9) +
  labs(title="밀도그래프", subtitle = "실린더수에 따른 시내연비의 밀도그래프",
       caption="Source: ggplot2::mpg",
       x = "도시 연비",
       fill = "실린더수")

midwest

install.packages('gridExtra')
library(gridExtra)

g3 = ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill=class),
           width = 0.7) +
  theme(axis.text.x = element_text(angle=45,
                                   vjust=0.6)) +
  labs(title = 'Title', subtitle = 'Sub Title')

g4 = ggplot(mpg, aes(cty)) +
  geom_density(aes(fill=factor(cyl)), alpha=0.8) +
  labs(title="밀도그래프", subtitle = "실린더수에 따른 시내연비의 밀도그래프",
       caption="Source: ggplot2::mpg",
       x = "도시 연비",
       fill = "실린더수")

library(ggplot2)
setFont = function() {
  theme_set(theme_gray(base_family="AppleGothic"))
  par(family = "AppleGothic")
}
last_plot()

g3
grid.arrange(g3, grid.arrange(g2, g4, ncol=2), ncol=1)

data
save(data, file = 'data/data_eng.rda')


## Try This: ggplot2 ########

# 1 
setFont()
d4 = mpg %>% group_by(year, displ) %>% summarise(m1 = mean(cty), m2 = mean(hwy))

ggplot(d4, aes(x=displ)) + 
  geom_line(data = d4 %>% filter(year==1999), aes(y=m1, color='1999 cty')) +
  geom_line(data = d4 %>% filter(year==1999), aes(y=m2, color='1999 hwy')) +
  geom_line(data = d4 %>% filter(year==2008), aes(y=m1, color='2008 cty'), size=1) +
  geom_line(data = d4 %>% filter(year==2008), aes(y=m2, color='2008 hwy'), size=1) +
  scale_colour_manual("", breaks = c("1999 cty", "1999 hwy", "2008 cty", "2008 hwy"),
                      values = c("gray", "pink", "blue", "darkblue")) +
  xlab("배기량") +
  scale_y_continuous("연비", limits = c(0, 50)) +
  labs(title = '연도별 통합연비', subtitle = '(굵은선은 2008년)') -> g4

last_plot()
ggplotly(g4)

# 2
d5 = data %>% filter(kor >= 80)
d5
ggplot(data %>% filter(kor >= 80), aes(cls)) +
  geom_bar(aes(fill=gen), width=0.7) +
  xlab('학급') + ylab('학생수') +
  labs(title = "국어 우수 학생", subtitle = "(80점 이상)", fill='성별') -> t

ggplotly(t)

# 3
ggplot(data[data$kor >= 95, ], aes(kor)) +
  geom_density(aes(fill=factor(cls)), alpha = 0.5) + xlab('국어성적') +
  labs(title = "반별 국어 우수 학생", subtitle = "국어성적 A+", 
       fill='학급', caption = "기준점수 >= 95")

# 4
# d7 = midwest %>% filter(poptotal <= 500000 & popasian <= 10000)
# nrow(midwest)
# nrow(d7)

ggplot(midwest) + 
  geom_point(aes(x=poptotal, y=popasian), alpha = 0.5) +
  xlab('전체인구') + ylab("아시아계인구") +
  xlim(0, 500000) + ylim(0, 10000) +
  labs(title = "전체인구 대비 아시아계 인구")


#### perspective ##########
x = 1:5
y = 1:3
z = outer(x, y, function(x,y) { x + y })
persp(x, y, z, theta = 30, phi = 30)

for (i in 1: 12) {
  persp(x, y, z, theta = 30, phi = i * 30)
  Sys.sleep(0.2)
}

x = seq(-10, 10, length=30); y = x
x
f = function(x, y) {
  r = sqrt(x^2 + y^2)
  return (10 * sin(r) / r)
}

z = outer(x, y, f)
persp(x, y, z, theta = 45, phi = 30, expand = 0.5, col='lightblue',
      ltheta = 120, shade = 0.75)

persp(x, y, z, theta = 45, phi = 30, expand = 0.5, col='lightblue',
      ltheta = 120, shade = 0.75, ticktype='detailed',
      xlab = 'X', ylab = 'Y', zlab = "Sinc(r)")


## Choropleth Map ########
head(USArrests)
str(USArrests)
rownames(USArrests)
library(ggiraphExtra)
library(tibble)
chodata = rownames_to_column(USArrests, var = 'state')
chodata
chodata$state = tolower(chodata$state)
head(chodata)
nrow(chodata)
chodata$sta = substr(chodata$sta, 1, 3)

chodata = data.frame(state = tolower(rownames(USArrests)), USArrests)
save(chodata, file='data/chodata.rda')

install.packages('ggiraphExtra')
install.packages('maps')
library(ggiraphExtra)
usmap = map_data('state') 
str(usmap)
head(usmap)
ggChoropleth(data=chodata,
             aes(fill=Murder, map_id=state),
             map = usmap,
             title = 'US Murder',
             reverse = F,
             interactive = T)

ggplot(chodata, aes(map_id = state)) + 
  geom_map(aes(fill = Murder), map = usmap) + 
  expand_limits(x = usmap$long, y = usmap$lat) +
  scale_fill_gradient2('Murder',
                       low="red", 
                       mid='green',
                       high='blue') +
  labs(title="USA Murder", fill = 'Murder')


sprintf('name=%s, %.0f', 'Hong', pi)
class(chodata$state)


tooltips = paste0(
  '<meta charset="utf-8">',
  sprintf("<p><strong>%s</strong></p>", as.character(chodata$state)),
  '<table>',
  '  <tr>',
  '    <td>인구(만)</td>',
  sprintf('<td>%.0f</td>', chodata$UrbanPop * 10),
  '  </tr>',
  '  <tr>',
  '    <td>살인</td>',
  sprintf('<td>%.0f</td>', chodata$Murder),
  '  </tr>',
  '  <tr>',
  '    <td>폭력</td>',
  sprintf('<td>%.0f</td>', chodata$Assault),
  '  </tr>',
  '</table>' )

tooltips
onclick = sprintf("alert(\"%s\")", as.character(chodata$state))
onclick

install.packages('stringi')
library(stringi)
stringi::stri_enc_toutf8(tooltips)

enc2utf8(tooltips)
enc2native(tooltips)
encodeString('cp949')
Sys.getlocale()

library(ggiraph)
ggplot(chodata, aes(data = Murder, map_id = state)) +
  geom_map_interactive( 
    aes(fill = Murder,
        data_id = state,
        tooltip = enc2utf8(tooltips),
        onclick = onclick), 
    map = usmap) +
  expand_limits(x = usmap$long, y = usmap$lat) +
  scale_fill_gradient2('살인', low='red', high = "blue", mid = "green") +
  labs(title="USA Murder") -> gg_map

ggiraph(code = print(gg_map))
girafe(ggobj = gg_map)


### 우리나라 ########
install.packages('devtools')

# devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)
# kdata = kormaps2014::changeCode(korpop1)   # do not need
kdata = korpop1
head(kdata)
head(kormap1)
colnames(kdata)
kdata = kdata %>% rename(pop = 총인구_명)
kdata = kdata %>% rename(area = 행정구역별_읍면동)
# kdata$area = stringi::stri_enc_toutf8(kdata$area)  # windows only
save(kdata, file='data/kdata.rda')

ggChoropleth(data=kdata, 
             aes(fill = pop, map_id = code, tooltip = area),
             map = kormap1,
             interactive = T)

rm(kdata)

ggplot(kdata, aes(data = pop, map_id = code)) +
  geom_map( aes(fill = pop), map = kormap1) + 
  expand_limits(x = kormap1$long, y = kormap1$lat) +
  scale_fill_gradient2('인구', low='darkblue') +
  xlab('경도') + ylab('위도') + 
  labs(title="시도별 인구")


## plotly ######
install.packages('plotly')
library(plotly)

ggplot(data, aes(eng, kor)) +
  geom_point(aes(color=eng, size=kor), alpha=0.3) -> t

ggplotly(t)

## dygraphs ######
install.packages('dygraphs')
library(dygraphs)
library(xts)

economics
ue = xts(economics$unemploy, order.by = economics$date)
head(ue)
dygraph(ue)

dygraph(ue) %>% dyRangeSelector()
psave = xts(economics$psavert, order.by = economics$date)
head(psave)
dygraph(psave)

dygraph(cbind(ue, psave))
ue2 = xts(economics$unemploy / 1000, order.by = economics$date)
pu = cbind(ue2, psave)
colnames(pu) = c('unemploy', 'saverate')
dygraph(pu) %>% dyRangeSelector()

kormaps2014::tbc

save(tbc, file='data/kmap.tbc.rda')


####### SQLDF #######
install.packages('sqldf')


d = read.csv('data/성적.csv')
sqldf("select * from d")

names(d) = iconv(names(d), "cp949", "utf-8")
d

data
data %>% filter(kor > 50)
sqldf("select stuno, kor from data where kor < 50 limit 10")
sqldf("select stuno, kor from data where kor < 50")

sqldf("select * from data where stuno in (select stuno from data where kor < 50)")

rs = sqldf("select * from data where stuno = '20439'")
rs
sqldf("update data set kor = 28 where stuno = '20439'")   # 안됨!!
class(rs)
sqldf("select kor, count(*) cnt from data where kor < 30 group by kor order by cnt")

data2 = sqldf("select stuno, avg(kor) avgkor from data group by stuno limit 5")
sqldf("select * from data2 left outer join data on data.stuno = data2.stuno")
sqldf("select * from data2 inner join data on data.stuno = data2.stuno")


## RMySQL ########
install.packages('RMySQL')
library(RMySQL)
drv = dbDriver("MySQL")

conn = dbConnect(drv, 
                 host='127.0.0.1', port=3306, 
                 dbname='dadb', user='dooo', password='dooo!')
dbListTables(conn) 
dbSendQuery(conn, 'set character set utf8')
d = dbGetQuery(conn, "select * from Song limit 5")
d

sr = dbGetQuery(conn, "select s.songno, s.genre, r.rank from Song s inner join SongRank r on s.songno = r.songno where r.rankdt = '2019-01-25' order by genre")
sr

dbDisconnect(conn)
dbUnloadDriver(drv)


str(sr)

ggplot(sr) + 
  geom_point(aes(x=rank, y=genre, size = -rank, col = rank), alpha = 0.5)

sqldf("select * from sr")
unloadNamespace('RMySQL')


## Text Mining #########
install.packages('tm')

getSources()
getReaders()

folder = system.file("texts", "txt", package="tm")
folder
txtSource = DirSource(folder)
class(txtSource); str(txtSource)   

doc = VCorpus(txtSource, readerControl = list(language='lat'))
class(doc); summary(doc)

meta(doc)
meta(doc, type = 'local')

inspect(doc)

inspect(doc[1])

doc[[1]][1]

names(doc)   # c('a.txt', 'b..)
writeCorpus(doc, path="data", filenames = names(doc))


getTransformations()
doc = tm_map(doc, stripWhitespace)

data("crude")
crude
crude[[1]]
crude[[1]][1] 

stopwords("english")

crude = tm_map(crude, stripWhitespace)
crude = tm_map(crude, content_transformer(tolower))
crude = tm_map(crude, removePunctuation)
crude = tm_map(crude, removeWords, stopwords("english"))
crude = tm_map(crude, stripWhitespace)
crude = tm_map(crude, stemDocument, language="english")

tdm = TermDocumentMatrix(crude) 
tdm
rownames(tdm) 
head(as.matrix(tdm))
tdm['year',] 
View(as.matrix(tdm)) 
dimnames(tdm) 

tdm$i
tdm$j
tdm$v
tdm = removeSparseTerms(tdm, 0.8)

t(tdm)
inspect(tdm)
inspect(tdm[50:60, 1:20])

findFreqTerms(tdm, 20)
findFreqTerms(tdm, 10)
findFreqTerms(tdm, 20, 30)
findFreqTerms(tdm, 0, 9)

inspect(stemDocument(crude[[1]]))

findAssocs(tdm, "last", 0.5)
findAssocs(tdm, "oil", .7)

rowSums(as.matrix(tdm)) 

wFreq = sort(rowSums(as.matrix(tdm)), decreasing = T)
wFreq
names(wFreq)
wFreq > 10  
wFreq = subset(wFreq, wFreq > 10)
wFreq

install.packages('RColorBrewer')  
library(RColorBrewer)
display.brewer.all()

brewer.pal.info
pa = brewer.pal(8, 'Blues')
pa
darks = brewer.pal(8, 'Dark2')
darks
install.packages("wordcloud")   

set.seed(100);
wordcloud(words = names(wFreq), freq=wFreq, min.freq = 1,
          random.order = F, colors = pa)

## Try This : wordcloud ########
doc = tm_map(doc, stripWhitespace)
doc = tm_map(doc, stemDocument, language="english")
doc = tm_map(doc, removeWords, stopwords("english"))
doc = tm_map(doc, stripWhitespace)
doc[[1]][1]
tdmDoc = TermDocumentMatrix(doc)
findFreqTerms(tdmDoc, 1)
docFreq = sort(rowSums(as.matrix(tdmDoc)), decreasing = T)
docFreq
docFreq = subset(docFreq, docFreq > 1)

wordcloud(words = names(docFreq), freq=docFreq, min.freq = 1, scale = c(2.5, 0.5),
          rot.per = 0, random.order = F, random.color = T, colors = darks)

## twitter #######
# twitter.R 참고

# 연관성 분석
install.packages(c("arules", "igraph", "combinat", "arulesViz", "visNetwork"))
?apriori
library(arules); library(igraph); library(combinat)
library(arulesViz); library(visNetwork)

load('data/wc.rda')
wc
nouns = unique(wc)
length(nouns)
nouns = sapply(wc, unique)
nouns
# 1글자 ~ 4글자까지
nouns1 = sapply(nouns, function(x) {
  Filter(function(y) { nchar(y) <= 4 && nchar(y) > 1 && is.hangul(y) }, x)
})
nouns1
wtrans = as(nouns1, "transactions")
class(wtrans)
rules = apriori(wtrans, parameter = list(supp=0.015, conf=0.5))
inspect(sort(rules))

paste0("trans", 1:length(nouns1))

# 연관성 시각화
library(arulesViz); library(visNetwork)
subrules2 <- head(sort(rules, by="lift"), 20) ## lift 기준으로 상위 20개만을 시각화
ig <- plot( subrules2, method="graph", control=list(type="items") )

subrules2 <- head(sort(rules, by="confidence"), 30)
ig <- plot( subrules2, method="graph", control=list(type="items") )
# saveAsGraph seems to render bad DOT for this case
ig_df <- get.data.frame( ig, what = "both" )

visNetwork(
  nodes = data.frame(id = ig_df$vertices$name,
                     value = ig_df$vertices$support,
                     title = ifelse(ig_df$vertices$label == "", ig_df$vertices$name, ig_df$vertices$label), ig_df$vertices), edges = ig_df$edges) %>%
  visEdges(ig_df$edges) %>%visOptions( highlightNearest = T )

visNetwork(
  nodes = data.frame(id = ig_df$vertices$name,
                     value = ig_df$vertices$support, ig_df$vertices),
  edges = ig_df$edges
  )



## scrap naver news ###########
library(rvest); library(httr); library(stringr); library(dplyr)
newsUrl = "https://news.naver.com/main/ranking/popularDay.nhn?mid=etc&sid1=111"
newsUrl
html = read_html(newsUrl)
html
links = html_attr(html_nodes(html, '.content dt a'), 'href')
links = links[!is.na(links)]
length(links)
head(links)
news = list()
for (i in 1:length(links)) {
  try({
    print(links[i])
    htxt = read_html(paste0('https://news.naver.com', links[i]))
    comments = html_nodes(htxt, '#articleBodyContents')
    get_news = repair_encoding(html_text(comments))   # repair_encoding(html_text(comments), from='utf-8')
    news[i] = str_trim(get_news)
  }, silent = F)
}
news
removeStopword(news)
removeStopword = function(t) {
  t = gsub("[[:cntrl:]]", "", t) 
  t = gsub("http[s]?://[[:alnum:].\\/]+", "", t) 
  t = gsub("&[[:alnum:]]+;", "", t)
  t = gsub("@[[:alnum:]]+", "", t)
  t = gsub("@[[:alnum:]]+[:]?", "", t)
  t = gsub("[ㄱ-ㅎㅏ-ㅣ]","",t) 
  t = gsub("\\s{2,}", " ", t) 
  t = gsub("[[:punct:]]", "", t)  
  t = gsub("https", "", t)
  t = gsub("RT", "", t)
  t = gsub("\\s{2,}", " ", t) 
  # mac: emo 제거
  gsub('\\p{So}|\\p{Cn}', '', t, perl = TRUE)
}
