#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
base<-read.csv("BasePBA.csv", header=FALSE)
names(base)<-c("County", "long", "lat", "Population", "Category", "Superficie")

# Define server logic required to plot
shinyServer(function(input, output) {
  x_val<-reactive({
    thresh<-input$population_threshold
    base[base$Population>=thresh,4]
    })
  y_val<-reactive({
    thresh<-input$population_threshold
    base[base$Population>=thresh,6]
  })
  pop_mean<-reactive({
    thresh<-input$population_threshold
    mean(base[base$Population>=thresh,4])
  })
  area_mean<-reactive({
    thresh<-input$population_threshold
    mean(base[base$Population>=thresh,6])
  })
  output$popmean<-renderText({round(pop_mean(),digits=1)})
  output$areamean<-renderText({round(area_mean(),digits=1)})
  output$plot1<-renderPlot({
    plot(x_val(),y_val(), xlab="Population", ylab="Area (km2)", main="Population vs Area of Counties above threshold")
    if(input$pop_mean){abline(v=pop_mean(),col="red", lwd=2)}
    if(input$area_mean){abline(h=area_mean(), col="blue", lwd=2)}
  })
})


