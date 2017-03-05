# Prepare data on the vendors per area
area.vendor <- data.frame(area=courses.merge$areaname, vendor=courses.merge$vname)
circular.data <- with(area.vendor, table(vendor, area))

# Make the circular plot
chordDiagram(as.data.frame(circular.data), transparency = 0.5)
