library(ggplot2)
library(dplyr)
library(gridExtra)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.baltimore.road <- filter(NEI, fips == '24510', type=='ON-ROAD')
Emission.year.type.baltimore <- mutate(aggregate(Emissions ~ year, NEI.baltimore.road, sum), city = 'Baltimore')

png('plot5.png', width=640, height=480, bg = 'transparent')

ggplot(Emission.year.type.baltimore, aes(year, Emissions)) + 
  geom_line(size = 1) + xlab('year') + ylab('PM2.5 emission (ton)') +
  ggtitle('PM 2.5 Emissions from Vehicle in Baltimore from 1999 to 2008')+theme(legend.position="top")


dev.off()




