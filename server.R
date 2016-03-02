# Require libraries
library(shiny)
library(dplyr)
library(plotly)

df <- iris

shinyServer(function(input, output) {
  # Render plotly
  output$irisPlot <- renderPlotly({
    
    # Prepare all data for plotly
    spec <- input$species
    if (spec == "all") {
      temp <- df
    } else {
      temp <- filter(df, Species == spec)
    }
    xaxis <- eval(parse(text = paste0("temp$", input$dim1)))
    xlabel <- sub("\\.", " ", input$dim1)
    yaxis <- eval(parse(text = paste0("temp$", input$dim2)))
    ylabel <- sub("\\.", " ", input$dim2)
    
    # Execute plot
    p <- plot_ly(temp, 
                 x = xaxis, 
                 y = yaxis, 
                 mode = "markers",
                 color = xaxis + yaxis,
                 colors = input$color
                 )

    layout(p, xaxis = list(title = xlabel), yaxis = list(title = ylabel))
  })
})


