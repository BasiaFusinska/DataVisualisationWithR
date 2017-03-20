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

library(ggplot2)
ggplot(revenue.month.vendor, aes(x=units, y=total)) +
  geom_point()

ggplot(revenue.month.vendor, aes(x=units, y=total)) +
  geom_point(aes(col=area))

ggplot(revenue.month.vendor, aes(x=units, y=total)) +
  geom_point(aes(col=area)) +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units")

ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
  geom_point(aes(col=area, size=dltotal)) +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units")

ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
  geom_point(aes(col=area)) +
  geom_line() +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units")

ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
  geom_point(aes(col=area)) +
  geom_abline(intercept = 0, slope = 110) +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units")


ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
  geom_point(aes(col=area)) +
  stat_smooth() +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units")

ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
  geom_point(aes(col=area)) +
  stat_smooth() +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units") +
  theme(legend.title=element_text(colour="chocolate", size=16, face="bold"))

ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
  geom_point(aes(col=area)) +
  stat_smooth() +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units") +
  theme(legend.title=element_text(colour="chocolate", size=16, face="bold")) +
  scale_color_discrete(name="Learning Areas")
  
ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
  geom_point(aes(col=area)) +
  stat_smooth() +
  ggtitle("Revenue by Units (All years)") +
  ylab("Revenue [$]") +
  xlab("Units") +
  theme(legend.title=element_text(colour="chocolate", size=16, face="bold")) +
  scale_color_discrete(name="Learning Areas") +
  guides(colour = guide_legend(override.aes = list(size=4)))

