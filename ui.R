library(shiny)
shinyUI(fluidPage(
  # Title
  titlePanel("Irises"),
    
   # Sidebar panel
  sidebarPanel( h2("Flower Parameters"), 
    
    # Widgets
    # Select species
    selectInput(inputId = "species",
      label = "Species",
      choices = c("Setosa" = "setosa", "Versicolor" = "versicolor", "Virginica" = "virginica", "All" = "all"),
      selected = "setosa"),
    # Select dimension 1
    selectInput(inputId = "dim1",
                label = "Dimension 1",
                choices = c("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width", 
                            "Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"),
                selected = "Sepal.Length"),
    # Select dimension 2
    selectInput(inputId = "dim2",
                label = "Dimension 2",
                choices = c("Sepal Length" = "Sepal.Length", "Sepal Width" = "Sepal.Width", 
                            "Petal Length" = "Petal.Length", "Petal Width" = "Petal.Width"),
                selected = "Sepal.Width"),
    # Select color
    radioButtons("color", label = "Color",
                 choices = list("Green" = 'Greens', "Blue" = 'Blues', "Red" = "Reds"), 
                 selected = 'Greens')
  ),

  # Main panel
  mainPanel(h2("Flower Measurment"), 
    # Plot here
    plotlyOutput('irisPlot')
  )
))
