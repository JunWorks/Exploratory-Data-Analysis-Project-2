library(ggplot2)
library(dplyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.baltimore <- filter(NEI, fips == '24510')

Emission.year.type.baltimore <- aggregate(Emissions ~ year + type, NEI.baltimore, sum)

png('plot3.png', width=480, height=480, bg = 'transparent')

ggplot(Emission.year.type.baltimore, aes(year, Emissions, color = type)) + 
  geom_line(size = 1) + xlab('year') + ylab('PM2.5 emission (ton)') +
  ggtitle('PM 2.5 Emissions in Baltimore from 1999 to 2008')

dev.off()




