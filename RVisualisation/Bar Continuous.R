# Revenue form the courses taken by year
revenue <- data.frame(total=as.numeric(c(250, 20, 35, 0, 5, 120, 550, 12, 14, 18,
                              50, 130, 15, 44, 33, 250, 0, 99, 95, 20,
                              30, 200, 350, 11, 55, 0, 12, 160, 44, 180)),
                      areas=c('L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M'),
                      years=c('2014', '2015', '2015', '2014', '2014', '2016', '2016', '2015', '2015', '2015',
                              '2015', '2016', '2014', '2016', '2014', '2016', '2016', '2014', '2016', '2015',
                              '2015', '2016', '2016', '2016', '2015', '2016', '2014', '2016', '2016', '2016'))

# Prepare the sum of data for every year
bardata <- aggregate(total~years, data=revenue, sum)

# Simple bar plot
barplot(bardata$total, names.arg = bardata$years , ylab="Count [$]", main="Areas")

# Stacked bar plot
# Install reshape package
install.packages('reshape')
library(reshape)

# Aggregate data
bardata_aggr <- aggregate(total ~ years + areas, data=revenue, sum)
bardata <- cast(bardata_aggr, years ~ areas, value="total")
row.names(bardata) <- bardata$years
bardata$years <- NULL

# Stacked barplot
barplot(as.matrix(bardata), ylab="Count [$]", main="Areas by Year", col=rainbow(3), xlim=c(0,5))
legend("topright", legend=names(bardata), fill=rainbow(3))

# Grouped bar char
barplot(as.matrix(bardata), ylab="Count [$]", main="Areas by Year", beside=TRUE, col=rainbow(3), xlim=c(0,15))
legend("topright", legend=names(bardata), fill=rainbow(3))


