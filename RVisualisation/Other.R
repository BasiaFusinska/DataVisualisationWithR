# Create tree map
install.packages('treemap')
library(treemap)

# Revenue per vendor
treemap(courses.aggregate, index="vendor", vSize="price", title="Revenue per vendor")

