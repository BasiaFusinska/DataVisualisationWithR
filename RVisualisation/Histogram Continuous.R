# Simple histogram of total revenue
hist(courses.aggregate$price, main="Ditribution of prices", xlab="Course price")

# Change the bucket size & add colours
hist(courses.aggregate$price, main="Ditribution of prices", xlab="Course price", breaks=10, col=heat.colors(10))
hist(courses.aggregate$price, main="Ditribution of prices", xlab="Course price", breaks=20, col=heat.colors(20))

# Histograms of revenue per month
revenue.year.month <- aggregate(price ~ year + month, data=courses.aggregate, sum)
hist(revenue.year.month$price, main="Ditribution of revenue per month", xlab="Revenue per month", breaks=10, col=heat.colors(10))
hist(revenue.year.month$price, main="Ditribution of revenue per month", xlab="Revenue per month", breaks=20, col=heat.colors(20))
hist(revenue.year.month$price, main="Ditribution of revenue per month", xlab="Revenue per month", breaks=30, col=heat.colors(30))

# if you want to see how likely it is that an interval of values of the x-axis occurs, you will need a probability density rather than frequency. We thus want to ask for a histogram of proportions. You can change this by setting the freq argument to false or set the prob argument to true
hist(revenue.year.month$price, main="Distribution of revenue per month", xlab="Revenue per month", breaks=20, col=heat.colors(20), prob=TRUE)
lines(density(revenue.year.month$price))
