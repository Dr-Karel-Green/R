frame <- read.csv("stats/data/salary_data_1000.csv")

head(frame, n=10)
library(ggplot2)

ggplot(data=frame, aes(x=years_since_phd, y=salary))+geom_point()

ggplot(data=frame, aes(x=salary))+geom_histogram(aes(fill=rank),
                                                        color="black", bins=20)

ggplot(data=frame, aes(x=years_since_phd, y=salary))+geom_point(aes(color=rank))+
  geom_smooth(aes(color=rank), fill=NA)

ggplot(data=frame, aes(x=rank, y=salary))+geom_jitter(aes(color=rank))+geom_boxplot(
  aes(fill=rank), alpha=0.5)

ggplot(data=frame, aes(x=salary))+geom_histogram(aes(fill=rank),
                                                 color="black", bins=20)+
  facet_grid(rank~.)#, scales="free")
