# Revenue by year
revenue.year <- aggregate(price~year, data=courses.aggregate, sum)

barplot(revenue.year$price, names.arg = revenue.year$year , ylab="Count [$]", main="Revenue per year")

# Stacked bar plot
# Install reshape package
install.packages('reshape')
library(reshape)

# Aggregate data
revenue.year.area <- aggregate(price ~ year + area, data=courses.aggregate, sum)
rya <- t(cast(revenue.year.area, year ~ area, value="price"))

# Stacked barplot
barplot(rya, ylab="Count [$]", main="Revenue by Year & Area", col=rainbow(4), xlim=c(0,5))
legend("topright", legend=row.names(rya), fill=rainbow(4), text.width = .8)

# Grouped bar chart
barplot(rya, ylab="Count [$]", main="Revenue by Year & Area", col=rainbow(4), beside=TRUE, xlim=c(0,20))
legend("topright", legend=row.names(rya), fill=rainbow(3), text.width = 2.5)
