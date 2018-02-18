library(shiny)
library(ggplot2)
library(datasets)

dataset <- iris

shinyUI(pageWithSidebar(
  
  titlePanel(title = h4("Iris dataset plotter ", align="center")),
  
  sidebarPanel(
    helpText("This selection enables to select between different graph tipes from ggplot2 library and a common histogram"),
    selectInput('GraphType', 'Graph type', c("Point","Histogram")),
    helpText("The slider can be used to modify the number of item which are plotted"),
    sliderInput('sampleSize', 'Sample Size', min=10, max=nrow(dataset),
                value=min(10, nrow(dataset)), step=5, round=0),
    helpText("Please select the X variable:"),
    selectInput('x', 'X', names(dataset)),
    helpText("Please select the Y variable:"),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    helpText("Select variable used to define the color ramps"),
    selectInput('color', 'Color', c('None', names(dataset))),
    helpText("Select the geometry type to use:"),
    selectInput('geoType', 'GeometryType', c("Point","Line","Area","Box","Col","Density")),
    helpText("Activate / Deactivate smoothing :"),
    checkboxInput('smooth', 'Smooth')
   
  ),
  
  mainPanel(
    
   helpText("DOCUMENTATION: The IRIS dataset is perhaps the best known database to be found in the pattern recognition literature. .
    The data set contains 3 classes of 50 instances each, where each class refers to a type of iris plant. One class is linearly separable from the other 2; the latter are NOT linearly separable from each other. The attributes are 
the sepal length and width in cm, the petal length and width in cm and the different classes: Iris Setosa, Iris Versicolour and Iris Virginica"),
    plotOutput('plot')
  )
))