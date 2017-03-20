# Create tree map
install.packages('treemap')
library(treemap)

treemap(courses.aggregate, index=c("vendor"), vSize="price", title="Revenue per vendor", type="index")

# Revenue per vendor
tm <- treemap(courses.aggregate, index=c("vendor", "area"), vSize="price", title="Revenue per vendor", type="index")

install.packages("XML")
install.packages("DiagrammeR")
install.packages("RJSONIO")

install.packages("devtools")
library(devtools)
devtools::install_github("timelyportfolio/d3treeR")
library(d3treeR)

inter <- d3tree2(tm,  rootname = "Vendors revenue" )
inter