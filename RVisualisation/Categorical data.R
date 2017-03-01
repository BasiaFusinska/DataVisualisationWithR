# Taken courses subjects & genders of the attendees
courses <- data.frame(gender=c('F', 'F', 'M', 'F', 'M', 'F', 'M', 'M', 'M', 'F'),
                      areas=c('L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M'))

# Simple barplot counting the occurences of each subject
barplot(table(courses$areas), ylab="Count", main="Areas")

# Barplot containing information about genders
barplot(table(courses), ylab="Count", main="Genders by Areas", col=heat.colors(2), ylim=c(0,7), xlim=c(0,5))
legend("topright", legend=levels(courses$gender), fill=heat.colors(2))

# Courses taken by year
courses <- data.frame(areas=c('L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M',
                              'L', 'M', 'L', 'F', 'M', 'M', 'F', 'M', 'F', 'M'),
                      years=c('2014', '2015', '2015', '2014', '2014', '2016', '2016', '2015', '2015', '2015',
                              '2015', '2016', '2014', '2016', '2014', '2016', '2016', '2014', '2016', '2015',
                              '2015', '2016', '2016', '2016', '2015', '2016', '2014', '2016', '2016', '2016'))

barplot(table(courses), ylab="Count", main="Genders by Areas", col=rainbow(3), beside=TRUE, ylim=c(0,9), xlim=c(0,17))
legend("topright", legend=levels(courses$areas), fill=rainbow(3))

