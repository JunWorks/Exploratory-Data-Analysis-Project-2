
library(dplyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.baltimore <- filter(NEI, fips == '24510')

Emission.year.baltimore <- aggregate(Emissions ~ year, NEI.baltimore, sum)

png('plot2.png', width=480, height=480, bg = 'transparent')

plot(Emission.year.baltimore$year, Emission.year.baltimore$Emissions, 
        xlab='Year', ylab='total PM2.5 emission (ton)',
        main='Baltimore')
lines(Emission.year.baltimore$year, Emission.year.baltimore$Emissions, type='l')

dev.off()


