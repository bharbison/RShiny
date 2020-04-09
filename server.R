# server.R
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer <- function(input, output) {
  
    output$map <- renderPlot({
    buffer <- switch (input$var,
                      "Percent White" = counties$white,
                      "Percent Black" = counties$black,
                      "Percent Hispanic" = counties$hispanic,
                      "Percent Asian" = counties$asian
    )
    color <- switch(input$var,
                    "Percent White" = "darkgreen",
                    "Percent Black" = "darkblue",
                    "Percent Hispanic" = "darkred",
                    "Percent Asian" = "gold")
      percent_map(buffer, color, input$var, input$range[1], input$range[2])
    })
}