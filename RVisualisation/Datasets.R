# Areas data set
areas <- data.frame(id=1:4, 
                    name=c('Web', 'Data Science', 'Cloud', 'Software Engineering'))

# Vendors
vendors <- data.frame(id=1:10, 
                      name=c("Software Mind", "Cloud Solutions", "InfraNet", 
                             "DataLearn", "WWW Way","Soft Skills", "Edu Zen", 
                             "Data Foundation", "Learning Island", 
                             "Design your way"),
                      short=c("SMin", "CSol", "INet", 
                              "DataL", "WWay","Soft", "EZen", 
                              "DataF", "LearI", 
                              "DesYW"))

# Courses
prices <- c(10, 19, 49, 99, 250, 500)
courses <- data.frame(id=1:100, 
                      area=sample(1:4, 100, replace=TRUE, prob=c(.25, .5, .15, .1)), 
                      vendor=sample(1:10, 100, replace=TRUE, prob=c(.2, .03, .12, .07, .11, .04, .1, .25, .05, .03)), 
                      price=prices[sample(1:6, 100, replace=TRUE, prob=c(.25, .15, .2, .2, .15, .05))],
                      name=paste("course", 1:100))

# Users
users <- data.frame(id=1:500,
                    username=paste("user", 1:100, sep = ""))

# Taken courses
years <- as.integer(sample(c(2014, 2015, 2016), 2500, replace=TRUE, prob=c(.1, .3, .6)))
years <- c(years, as.integer(sample(c(2014, 2015, 2016), 1500, replace=TRUE, prob=c(.3, .5, .2))))
years <- c(years, as.integer(sample(c(2014, 2015, 2016), 1000, replace=TRUE, prob=c(.7, .2, .1))))

taken.courses <- data.frame(id=1:5000,
                            course=sample(1:100, 5000, replace=TRUE),
                            user=sample(1:500, 5000, replace=TRUE),
                            year=years,
                            month=sample(1:12, 5000, replace=TRUE, prob=c(.2, .12, .1, .08, .07, .05, .03, .02, .14, .1, .07, .02)))

# Merge the data and prepare data frame
courses.merge <- merge(x=taken.courses, y=courses, by.x="course", by.y="id")
courses.merge <- merge(x=courses.merge, y=areas, by.x="area", by.y="id")
courses.merge <- merge(x=courses.merge, y=vendors, by.x="vendor", by.y="id")

courses.aggregate <- data.frame(area=courses.merge$name.y,
                                vendor=courses.merge$name,
                                vshort=courses.merge$short,
                                year=courses.merge$year,
                                month=courses.merge$month,
                                price=courses.merge$price) 
