library(shiny)
library(ggplot2)
library(datasets)

dataset <- iris

shinyUI(pageWithSidebar(
  
  titlePanel(title = h4("Iris dataset plotter ", align="center")),
  
  sidebarPanel(
    
    selectInput('GraphType', 'Graph type', c("Point","Histogram")),
    sliderInput('sampleSize', 'Sample Size', min=10, max=nrow(dataset),
                value=min(10, nrow(dataset)), step=5, round=0),
    
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    
     selectInput('geoType', 'GeometryType', c("Point","Line","Area","Box","Col","Density")),
    
    checkboxInput('smooth', 'Smooth')
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))