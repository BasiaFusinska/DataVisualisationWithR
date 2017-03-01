revenue <- data.frame(total=as.numeric(c(250, 20, 35, 0, 5, 120, 550, 12, 14, 18,
                                         50, 130, 15, 44, 33, 250, 0, 99, 95, 20,
                                         30, 200, 350, 11, 55, 0, 12, 160, 44, 180)),
                      areas=c('L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M'),
                      years=c('2014', '2015', '2015', '2014', '2014', '2016', '2016', '2015', '2015', '2015',
                              '2015', '2016', '2014', '2016', '2014', '2016', '2016', '2014', '2016', '2015',
                              '2015', '2016', '2016', '2016', '2015', '2016', '2014', '2016', '2016', '2016'))

# count units and total revenue per year
bardata <- aggregate(total~years, data=revenue, sum)
bardata$freq <- aggregate(total~years, data=revenue, length)$total

# Plot the revenue and units (* 100) in one graph
barplot(bardata$total, names.arg = bardata$years , ylab="Count [$]", main="Revenue by year")
lines(bardata$freq*100)
points(bardata$freq*100)

# Plot revenue per years
x <- as.integer(as.character(bardata$years))
plot(x, bardata$total, type='l', xaxt="n")
axis(1, at=round(x, 0))

# displaying the trend
lines(x, c(250, 1000, 1750), type='l', lty=2, col="blue")
legend("topleft", c("revenue", "trend"), col=c("black", "blue"), lty=1:2)

# plot revenue per units number
plot(bardata$freq, bardata$total, xlab="Units", ylab="Revenue")
lines(c(7, 10, 13, 14), c(250, 1000, 1750, 2000), type='l', lty=2, col="blue")
legend("topleft", c("revenue/freq", "trend"), col=c("black", "blue"), lty=c(0,2), pch=c(21, -1))

# plot revenue per units for different areas
bardata <- aggregate(total~years + areas, data=revenue, sum)
bardata$freq <- aggregate(total~years + areas, data=revenue, length)$total

plot(bardata$freq, bardata$total, xlab="Units", ylab="Revenue", col=bardata$areas)
legend("topleft", legend=levels(bardata$areas), col=1:length(levels(bardata$areas)), pch=21)

