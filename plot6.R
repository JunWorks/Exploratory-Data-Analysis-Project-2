library(ggplot2)
library(dplyr)
library(gridExtra)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.baltimore.road <- filter(NEI, fips == '24510', type=='ON-ROAD')
Emission.year.type.baltimore <- mutate(aggregate(Emissions ~ year, NEI.baltimore.road, sum), city = 'Baltimore')
Emission.year.type.baltimore <- mutate(Emission.year.type.baltimore, change = Emissions/Emissions[1])


NEI.LA.road <- filter(NEI, fips == '06037', type=='ON-ROAD')
Emission.year.type.LA <- mutate(aggregate(Emissions ~ year, NEI.LA.road, sum), city = 'LA')
Emission.year.type.LA <- mutate(Emission.year.type.LA, change = Emissions/Emissions[1])


data.compare <- rbind(Emission.year.type.baltimore, Emission.year.type.LA)


png('plot6.png', width=640, height=480, bg = 'transparent')

plot1 <- ggplot(data.compare, aes(year, Emissions, color = city)) + 
  geom_line(size = 1) + xlab('year') + ylab('PM2.5 emission (ton)') +
  ggtitle('PM 2.5 Emissions from Vehicle')+theme(legend.position="top")

plot2<- ggplot(data.compare, aes(year, change, color = city)) + 
  geom_line(size = 1) + xlab('year') + ylab('Normalized PM2.5 emission') +
  ggtitle('PM 2.5 Emissions from Vehicle')+theme(legend.position="top")

grid.arrange(plot1, plot2, ncol=2)

dev.off()




