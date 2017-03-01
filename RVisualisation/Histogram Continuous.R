revenue <- data.frame(total=as.numeric(c(250, 20, 35, 0, 5, 120, 550, 12, 14, 18,
                                         50, 130, 15, 44, 33, 250, 0, 99, 95, 20,
                                         30, 200, 350, 11, 55, 0, 12, 160, 44, 180)),
                      areas=c('L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M'),
                      years=c('2014', '2015', '2015', '2014', '2014', '2016', '2016', '2015', '2015', '2015',
                              '2015', '2016', '2014', '2016', '2014', '2016', '2016', '2014', '2016', '2015',
                              '2015', '2016', '2016', '2016', '2015', '2016', '2014', '2016', '2016', '2016'))

# Simple histogram of total revenue
hist(revenue$total, main="Distribution of prices", xlab="Course price")

# Change the bucket size
hist(revenue$total, main="Distribution of prices", xlab="Course price", breaks=10, col=heat.colors(10))
hist(revenue$total, main="Distribution of prices", xlab="Course price", breaks=10, col=heat.colors(20))

# if you want to see how likely it is that an interval of values of the x-axis occurs, you will need a probability density rather than frequency. We thus want to ask for a histogram of proportions. You can change this by setting the freq argument to false or set the prob argument to true
hist(revenue$total, main="Distribution of prices", xlab="Course price", breaks=20, col=heat.colors(20), prob=TRUE)
lines(density(revenue$total))
