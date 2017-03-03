revenue <- data.frame(total=as.numeric(c(250, 20, 35, 0, 5, 120, 550, 12, 14, 18,
                                         50, 130, 15, 44, 33, 250, 0, 99, 95, 20,
                                         30, 200, 350, 11, 55, 0, 12, 160, 44, 180)),
                      areas=c('L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M'),
                      years=c('2014', '2015', '2015', '2014', '2014', '2016', '2016', '2015', '2015', '2015',
                              '2015', '2016', '2014', '2016', '2014', '2016', '2016', '2014', '2016', '2015',
                              '2015', '2016', '2016', '2016', '2015', '2016', '2014', '2016', '2016', '2016'))

# Aggregate data
library(reshape)
bardata_aggr <- aggregate(total ~ years + areas, data=revenue, sum)
bardata_cast <- cast(bardata_aggr, years ~ areas, value="total")
bardata <- bardata_cast
row.names(bardata) <- bardata$years
bardata$years <- NULL

# Stacked barplot
# Base
barplot(t(as.matrix(bardata)), ylab="Count [$]", main="Areas by Year", col=rainbow(3), xlim=c(0,5))
legend("topright", legend=names(bardata), fill=rainbow(3))

# lattice
fareas <- names(bardata_cast)
fareas <- fareas[2:length(fareas)]
formula <- as.formula(paste(paste(fareas, collapse= "+"), " ~ years"))

barchart(formula, data=bardata_cast, stack=TRUE, horizontal=FALSE, ylab="Count [$]", main="Areas by Year", auto.key=TRUE)

# ggplot2
install.packages('ggplot2')
library(ggplot2)

ggplot(bardata_aggr, aes(x = years, y= total, fill = areas)) + 
  geom_bar(stat = "identity")

# Histogram
# base
hist(revenue$total, main="Distribution of prices", xlab="Course price", breaks=20, col=heat.colors(20))

# lattice
histogram(~total, data=revenue, breaks = 20, type = "count", col=heat.colors(20), main="Distribution of prices", xlab="Course price")

# ggplot
ggplot(revenue, aes(x = total)) + geom_histogram(stat = "bin", binwidth=20, aes(fill=..count..))

# box plot
# base
boxplot(total~years, data=revenue, col=2:4, main="Total by Year", 
        xlab="Year", ylab="Revenue")

# lattice
bwplot(total~years, data=revenue, main="Total by Year", 
        xlab="Year", ylab="Revenue")

# adding colours
my.theme = list(box.dot = list(col = "black"), 
                box.rectangle = list(fill=2:4),
                box.umbrella = list(col = "black"))
bwplot(total~years, data=revenue, main="Total by Year", 
       par.settings = my.theme,
       xlab="Year", ylab="Revenue")

# ggplot
ggplot(revenue, aes(x=years, y=total)) + 
  geom_boxplot(aes(fill=years))

# Scatter plot
# Prepare data
bardata <- aggregate(total~years+areas, data=revenue, sum)
bardata$freq <- aggregate(total~years+areas, data=revenue, length)$total

# base
plot(bardata$freq, bardata$total, xlab="Units", ylab="Revenue", col=bardata$areas)
legend("topleft", legend=levels(bardata$areas), col=1:length(levels(bardata$areas)), pch=21)

#lattice
xyplot(total~freq, data=bardata, xlab="Units", ylab="Revenue",
       group = areas, auto.key = TRUE)

# ggplot
ggplot(bardata, aes(x=freq, y=total)) + geom_point(aes(col=areas))

# set up size az total for the specific vendor
ggplot(bardata, aes(x=freq, y=total)) + geom_point(aes(col=areas, size=total))

