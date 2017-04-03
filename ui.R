#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that compares BA Counties
shinyUI(navbarPage("Buenos Aires Province Counties",
  tabPanel("Use APP",
       sidebarPanel(
          sliderInput("population_threshold", "Choose minimun population value to analyze (Threshold)",0,1000000,value=100000),
          checkboxInput("pop_mean", "Show mean Population line",value=TRUE),
          checkboxInput("area_mean", "Show mean Area line", value=TRUE)
    ),
      mainPanel(
         plotOutput("plot1"),
         h3("Average Population of counties above population threshold"),
         textOutput("popmean"),
         h3("Average Area of counties above population threshold (km2)"),
         textOutput("areamean")
    )
  ),
  tabPanel("About",
           mainPanel(
             includeMarkdown("About.Rmd")
           )
  )
))

