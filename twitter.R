Sys.sleep(10)

# windows
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_111/")

# mac
# paste0(system2('/usr/libexec/java_home', stdout = TRUE), '/jre/lib/server/libjvm.dylib')
dyn.load(paste0(system2('/usr/libexec/java_home', stdout = TRUE), 
                '/jre/lib/server/libjvm.dylib'))

# ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home/jre/lib/server/libjvm.dylib libjvm.dylib

install.packages(c("twitteR", "RCurl", "RJSONIO", "stringr", "streamR", "ROAuth"))
library(twitteR); library(RCurl); library(RJSONIO); library(stringr)
library(streamR); library(ROAuth)

install.packages(c("rJava", "memoise", "KoNLP"))
library(rJava)
library(KoNLP)

# keys are keys.R
# load('data/keys.rda')
# save(keyc, file='data/keys.rda')
setup_twitter_oauth(keyc[1], keyc[2], keyc[3], keyc[4])

# searchTwitter(enc2utf8('승리'), n=100, lan='ko')

tweets = searchTwitter(enc2utf8('승리'), n=100, lan='ko', 
                       since='2019-03-11', until='2019-03-31')

tdf = twListToDF(tweets)

nrow(tdf)
colnames(tdf)
names(tdf)
head(tdf)
tdf %>% filter(!isRetweet) %>% select(text)

tdf = tdf %>% filter(regexpr('광고',text) == -1) %>% select(text)

unique(tdf$text)
tw = unique(tdf$text)
tw
head(tw)
tw = gsub("[[:cntrl:]]", "", tw) 
tw = gsub("http[s]?://[[:alnum:].\\/]+", "", tw) 
tw = gsub("&[[:alnum:]]+;", "", tw)
tw = gsub("@[[:alnum:]]+", "", tw)
tw = gsub("@[[:alnum:]]+[:]?", "", tw)
tw = gsub("[ㄱ-ㅎㅏ-ㅣ]","",tw) 
tw = gsub("\\s{2,}", " ", tw) 
tw = gsub("[[:punct:]]", "", tw)  
tw = gsub("https", "", tw)
tw = gsub("RT", "", tw)
tw = gsub("\\s{2,}", " ", tw) 
# enc2native(tw[9])

# mac: emo 제거
tw = gsub('\\p{So}|\\p{Cn}', '', tw, perl = TRUE)

wc = sapply(tw, extractNoun, USE.NAMES = F)
wc
ul = unlist(wc)
ul = ul[nchar(ul) > 1]
wc1 = table(ul)
names(wc1)
length(wc1)
wc1
wc2 = head(sort(wc1, decreasing = T), 100)
wc2
library(RColorBrewer)
library(wordcloud)
pal = brewer.pal(9, "Set1")
wordcloud(names(wc2), freq=wc2, scale=c(5,0.5), rot.per=0.25, min.freq = 2, random.order = F, random.color = T, colors = pal)

