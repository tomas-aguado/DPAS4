library(shiny)
library(ggplot2)
library(xml2)
library(rvest)
library(tidyr)
library(dplyr)
library(magrittr)


shinyServer(function(input, output) {

    dataset <- reactive( {
      iris[sample(nrow(iris), input$sampleSize),]
  })
  
  output$plot <- reactivePlot(function() {
    if (input$GraphType == 'Point'){
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$geoType == 'Point')
     p <- p + geom_point()  
    else if (input$geoType == 'Line')
     p <- p + geom_line()
    else if (input$geoType == 'Area')
      p <- p + geom_area()
    else if (input$geoType == 'Box')
      p <- p + geom_boxplot()
    else if (input$geoType == 'Col')
      p <- p + geom_col()
    else if (input$geoType == 'Density')
      p <- p + geom_density2d()   
    else if (input$geoType == 'Area')
      p <- p + geom_area()
    else if (input$geoType == 'Box')
      p <- p + geom_boxplot()  

    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)

    if (input$smooth)
      p <- p + geom_smooth()
    
    print(p)
    }
    else{
      histogram <- ggplot(dataset(), aes_string(x=input$x))
      histogram + geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) + 
        xlab(input$x) +  ylab("Frequency") + ggtitle("Histogram of IRIS variables")
    }
    
  }, height=600
  )
  
})