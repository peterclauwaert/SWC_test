df <- read.csv("Metadata.csv")
# which variables?
str(df)
#start plotting
library(ggplot2)
#make first plot
ggplot(data = df, aes(x = Timepoint, y = temp, fill = Reactor.cycle))+
geom_point(shape = 21, size=4)
df$Reactor.cycle<-factor(df$Reactor.cycle)
str(df)
#store ggplot object
p1<-ggplot(data = df, aes(x = Timepoint, y = temp, fill = Reactor.phase))
p1<- p1 + geom_point(shape = 21, size=4, alpha=.5)
p1 + theme_bw() + geom_line()
p2 <-p1 + geom_point(shape = 21, size=4, alpha=.5) + geom_line()
p3 <- p2 + facet_grid(~Reactor.cycle)
p3
#what's inside reactor phase
df$Reactor.phase
levels(df$Reactor.phase)
p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle)
p4 + geom_line(aes(color=Reactor.phase))
p4
