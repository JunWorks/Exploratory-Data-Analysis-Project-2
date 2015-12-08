
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Emission.year <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png', width=480, height=480, bg = 'transparent')

plot(Emission.year$year, Emission.year$Emissions, 
        xlab='Year', ylab='total PM2.5 emission (ton)',
        main='')
lines(Emission.year$year, Emission.year$Emissions, type='l')

dev.off()