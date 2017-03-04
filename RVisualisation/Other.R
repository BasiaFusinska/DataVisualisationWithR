# Create tree map
install.packages('treemap')
library(treemap)

# Revenue per vendor
treemap(courses.aggregate, index="vendor", vSize="price", title="Revenue per vendor")

#Interactive

#not interactive graph
ggplot(revenue.month.vendor, aes(x=units, y=total)) + 
       geom_point(aes(col=area, size=dltotal, text = paste("DataLearn:", dltotal)))

# Use plotly to make it interactive
install.packages('plotly')
library(plotly)

plot_ly(revenue.month.vendor, x=~units, y=~total, color = ~factor(area), 
        size=~dltotal/1000, mode="markers", text=~paste("Units:", units,"</br>Revenue", total, "</br>DataLearn cut:", dltotal) , 
        hoverinfo="text", type='scatter') %>%
  layout(title="Revenue per vendor", xaxis=list(title="Units"), yaxis=list(title="Revenue [$]"))
