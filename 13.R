load('data/data_eng.rda')
data

n.gen = table(data$gen)
p.gen = prop.table(n.gen)
rt.gen = rbind(n.gen, p.gen)

ct.gen = cbind(n.gen, p.gen)
colnames(ct.gen) = c('돗수', '상대도수')
ct.gen = addmargins(ct.gen, margin = 1)  # 1: 마지막 행에만 (즉, 라인별 sum은 제외)
round(ct.gen, 3)

t.gen_cls = table(data$gen, data$cls)   # 첫번째 변수가 행
p.gen_cls = prop.table(gen_cls)
s.gen_cls = addmargins(cbind(t.gen_cls, p.gen_cls), margin = 1)
s.gen_cls = round(s.gen_cls, 2)
s.gen_cls

library(ggplot2)
theme_set(theme_gray(base_family="AppleGothic"))
par(family = "AppleGothic")
barplot(p.gen)
barplot(p.gen, main='성별', xlab="gender", ylab='%', col=c("red", "blue"), legend = rownames(p.gen))
barplot(p.gen_cls, main='성별', xlab="gender", ylab='%', col=c("green", "blue"), ylim=c(0, 0.5), legend = rownames(p.gen_cls))

barplot(p.gen, main='성별', xlab="gender", ylab='%', col=c("red", "blue"), legend = rownames(p.gen), horiz = T)
barplot(t.gen_cls, main='반별 성별', ylab='반', col=heat.colors(4), 
        legend = rownames(t.gen_cls), horiz = T)

data

# install.packages("gmodels")
library(gmodels)
CrossTable(data$gen, data$cls)
