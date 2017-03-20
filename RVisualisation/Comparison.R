# Data aggregation
library(reshape)
revenue.year.area <- aggregate(price ~ year + area, data=courses.aggregate, sum)
rya_cast <- cast(revenue.year.area, year ~ area, value="price")
rya <- t(rya_cast)

# Stacked barplot
# Base

barplot(rya, ylab="Count [$]", main="Revenue by Year & Area", col=rainbow(4), xlim=c(0,5))
legend("topright", legend=row.names(rya), fill=rainbow(4), text.width = .8)

# lattice
areas.formula <- paste("`", row.names(rya), "`", sep="")
areas.formula <- as.formula(paste(paste(areas.formula, collapse= "+"), " ~ year"))

barchart(areas.formula, data=rya_cast, stack=TRUE, horizontal=FALSE, ylab="Count [$]", main="Areas by Year", auto.key=TRUE)

# ggplot2
install.packages('ggplot2')
library(ggplot2)

ggplot(revenue.year.area, aes(x = year, y=price, fill = area)) + 
  geom_bar(stat = "identity") +
  ggtitle("Revenue by Year & Area") +
  ylab("Count [$]")

# Histogram
# Get revenue per month
revenue.year.month <- aggregate(price ~ year + month, data=courses.aggregate, sum)

# base
hist(revenue.year.month$price, main="Ditribution of revenue per month", xlab="Revenue per month", breaks=20, col=heat.colors(20))

# lattice
histogram(~price, data=revenue.year.month, type = "count", main="Ditribution of revenue per month", xlab="Revenue per month", breaks = 20, col=heat.colors(20))

# ggplot
ggplot(revenue.year.month, aes(x = price)) + 
  geom_histogram(stat = "bin", binwidth=2500, aes(fill=..count..)) +
  ggtitle("Ditribution of revenue per month") +
  xlab("Revenue per month")

# Box plot
# base
boxplot(price~year, data=revenue.year.month, col=2:4, main="Revenue by Year", 
        xlab="Year", ylab="Revenue")

# lattice
bwplot(price~factor(year), data=revenue.year.month, main="Revenue by Year", 
       xlab="Year", ylab="Revenue")

# adding colours
my.theme = list(box.dot = list(col = "black"), 
                box.rectangle = list(fill=2:4),
                box.umbrella = list(col = "black"))
bwplot(price~factor(year), data=revenue.year.month, main="Total by Year", 
       par.settings = my.theme,
       xlab="Year", ylab="Revenue")

# ggplot
ggplot(revenue.year.month, aes(x=factor(year), y=price)) + 
  geom_boxplot(aes(fill=factor(year))) +
  ggtitle("Total by Year") +
  ylab("Revenue") +
  xlab("Year")


# Scatter plot
# Monthly revenue by area
revenue.month.area <- aggregate(price~month+year+area, data=courses.aggregate, sum)
revenue.month.area$units <- aggregate(price~month+year+area, data=courses.aggregate, length)$price

# base
plot(price~units, data=revenue.month.area, xlab="Units", ylab="Revenue [$]", col=area, main="Revenue by Units (All years)")
legend("topleft", legend=levels(revenue.month.area$area), col=1:length(levels(revenue.month.area$area)), pch=21, text.width = 30)

#lattice
xyplot(price~units, data=revenue.month.area, xlab="Units", ylab="Revenue [$]", pch=19,
       group = area, 
       auto.key = TRUE)

# ggplot
ggplot(revenue.month.area, aes(x=units, y=price)) +
  geom_point(aes(col=area)) +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units") +


# set up size as total for the specific vendor
# Get the revenue for DataLearn vendor
data.learn <- courses.aggregate[courses.aggregate$vendor=="DataLearn",]
data.learn.revenue <- aggregate(price~month+year+area, data=data.learn, sum)

revenue.month.vendor <- merge(x=revenue.month.area, y=data.learn.revenue, by=c("month", "year", "area"), all = TRUE)
revenue.month.vendor$total <- revenue.month.vendor$price.x
revenue.month.vendor$price.x <- NULL
revenue.month.vendor$dltotal <- revenue.month.vendor$price.y
revenue.month.vendor$price.y <- NULL
revenue.month.vendor$dltotal[is.na(revenue.month.vendor$dltotal)] <- 0

ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
  geom_point(aes(col=area, size=dltotal)) +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units")

