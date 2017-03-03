# Simple barplot counting the occurences of each subject
courses.areas <- table(courses.aggregate$area) 
barplot(courses.areas, ylab="Count", main="Areas")

# Barplot containing information about genders
vendor.area <- data.frame(courses.aggregate$area, courses.aggregate$vshort)
vendor.area <- table(vendor.area)

barplot(vendor.area, ylab="Count", main="Areas by Vendor", col=rainbow(4), xlim=c(0,17))
legend("topright", legend=row.names(vendor.area), fill=rainbow(4), text.width = 3)

# Courses taken by year
# Stacked side by side
areas.year <- data.frame(courses.aggregate$area, courses.aggregate$year)
areas.year <- table(areas.year)

barplot(areas.year, ylab="Count", main="Areas By Year", col=rainbow(4), beside=TRUE)
legend("topleft", legend=row.names(areas.year), fill=rainbow(4), text.width = 3)

# Stacked bar chart
barplot(areas.year, ylab="Count", main="Areas by year", col=rainbow(4), xlim=c(0,5))
legend("topright", legend=row.names(areas.year), fill=rainbow(4), text.width = .8)

# 100% stacked bar chart
# Table entries as fraction of marginal table
barplot(prop.table(areas.year, 2) * 100, col=rainbow(4), ylab="%", main="Years by Areas", xlim=c(0,5))
legend("topright", legend=row.names(areas.year), fill=rainbow(4), text.width = .8)

# Pie chart
# Create the labels
per_labels <- round(courses.areas/sum(courses.areas) * 100, 1)
per_labels <- paste(per_labels, "%", sep="")

pie(courses.areas, col=rainbow(4), labels=per_labels)
legend("topleft", legend=names(courses.areas), fill=rainbow(4), text.width = .52)
