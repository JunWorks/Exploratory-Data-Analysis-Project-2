library(ggplot2)
library(dplyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")

coal.related  <- grepl('coal', NEISCC$Short.Name, ignore.case=TRUE)
Emission.coal <- NEISCC[coal.related, ]

Emission.coal.year <- aggregate(Emissions ~ year, Emission.coal, sum)


png('plot4.png', width=480, height=480, bg = 'transparent')

ggplot(Emission.coal.year, aes(year, Emissions)) + 
  geom_line(size = 1) + xlab('year') + ylab('PM2.5 emission (ton)') +
  ggtitle('PM 2.5 Emissions from Coal in US from 1999 to 2008')

dev.off()




