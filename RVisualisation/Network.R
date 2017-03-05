# Prepare data: users taking courses in specific areas
user.area <- data.frame(user=courses.aggregate$name, area=courses.aggregate$area)
user.area <- user.area[sample(1:500, 50, replace=FALSE),]
user.area <- aggregate(cbind(user.area[0], width=1), user.area, length)

# Build the graph
unique.users <- as.character(unique(user.area$user))
unique.areas <- as.character(unique(user.area$area))
vertices <- data.frame(name=c(unique.users, unique.areas))

## Plot the graph using the IGRAPH package
library("igraph")

user.area.graph <- graph.data.frame(user.area, directed = FALSE, vertices=vertices)

# Fill in the style for the graph
V(user.area.graph)$color <- c(rep("gray50", length(unique.users)), rep("tomato", length(unique.areas)))
V(user.area.graph)$size <- c(rep(8, length(unique.users)), rep(20, length(unique.areas)))
V(user.area.graph)$label <- as.character(vertices$name)
V(user.area.graph)$label[1:length(unique.users)] <- ""
V(user.area.graph)$label.color <- "black"
V(user.area.graph)$label.family <- "Arial"

E(user.area.graph)$color = "gray80"
E(user.area.graph)$width = user.area$weight
E(user.area.graph)$arrow.size = 0.3

# Plot the graph
plot(user.area.graph, main="Courses taken by users")

install.packages('visNetwork')
library('visNetwork') 

# Build nodes and edges for visNetwork
nodes <- vertices
nnodes <- nrow(nodes)
nodes$id <- 1:nnodes

edges <- user.area
edges <- merge(x=edges, y=nodes, by.x = "user", by.y="name")
edges$from <- edges$id
edges$id <- NULL
edges <- merge(x=edges, y=nodes, by.x = "area", by.y="name")
edges$to <- edges$id
edges$id <- NULL

# Add styles
nodes$shape <- "dot"  
nodes$shadow <- TRUE # Nodes will drop shadow
nodes$title <- nodes$name # Text on click
nodes$label <- as.character(nodes$name) # Node label
nodes$label[1:length(unique.users)] <- ""
nodes$size <- c(rep(8, length(unique.users)), rep(20, length(unique.areas))) # Node size
nodes$borderWidth <- 2 # Node border width

nodes$color.background <- c(rep("gray50", length(unique.users)), rep("tomato", length(unique.areas)))
nodes$color.border <- "black"
nodes$color.highlight.background <- "orange"
nodes$color.highlight.border <- "darkred"

visNetwork(nodes, edges, main="Courses taken by users")
