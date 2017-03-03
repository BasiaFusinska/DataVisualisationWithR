# Areas data set
areas <- data.frame(id=1:4, 
                    name=c('Web', 'Data Science', 'Cloud', 'Software Engineering'))

# Vendors
vendors <- data.frame(id=1:10, 
                      name=c("Software Mind", "Cloud Solutions", "InfraNet", 
                             "DataLearn", "WWW Way","Soft Skills", "Edu Zen", 
                             "Data Foundation", "Learning Island", 
                             "Design your way"))

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
taken.courses <- data.frame(id=1:5000,
                            course=sample(1:100, 5000, replace=TRUE),
                            user=sample(1:500, 5000, replace=TRUE),
                            year=as.integer(sample(c(2014, 2015, 2016), 5000, replace=TRUE)),
                            month=sample(1:12, 5000, replace=TRUE))
