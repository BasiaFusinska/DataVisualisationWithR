# count units and calculate total revenue per month in 2016
revenue.month <- aggregate(price~month+year, data=courses.aggregate[courses.aggregate$year==2016,], sum)
revenue.month$units <- aggregate(price~month+year, data=courses.aggregate[courses.aggregate$year==2016,], length)$price

# Plot the revenue and units (* 100) in one graph
labels <- paste(revenue.month$month, revenue.month$year, sep = "/")
revenue.bar <- barplot(revenue.month$price, names.arg = labels , ylab="Revenue [$]", main="2016 Revenue by month")
lines(x=revenue.bar, y=revenue.month$units*100)
points(x=revenue.bar, y=revenue.month$units*100)

# Plot revenue trend through 2016
months <- 1:12
plot(price ~ month, data=revenue.month, xaxt="n", type="l", ylab="Revenue [$]", xlab="", main="Revenue in 2016")
axis(1, at=months, labels=labels)

# displaying the trend
lines(c(1,12), c(25000, 12000), type='l', lty=2, col="blue")
legend("topright", c("Revenue", "Trend"), col=c("black", "blue"), lty=1:2)

# Plot revenue per number of the courses send by month
plot(price~units, data=revenue.month, xlab="Units", ylab="Revenue [$]", main="Revenue by Units in 2016")
lines(c(30, 380), c(3000, 35000), type='l', lty=2, col="blue")
legend("topleft", c("revenue/freq", "trend"), col=c("black", "blue"), lty=c(0,2), pch=c(21, -1))

# plot revenue per units for different areas
revenue.month.area <- aggregate(price~month+year+area, data=courses.aggregate, sum)
revenue.month.area$units <- aggregate(price~month+year+area, data=courses.aggregate, length)$price

plot(price~units, data=revenue.month.area, xlab="Units", ylab="Revenue [$]", col=area, main="Revenue by Units (All years)")
legend("topleft", legend=levels(revenue.month.area$area), col=1:length(levels(revenue.month.area$area)), pch=21, text.width = 30)
