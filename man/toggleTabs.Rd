% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update-functions.R
\name{bs4HideTab}
\alias{bs4HideTab}
\alias{bs4ShowTab}
\title{Dynamically hide/show a bs4TabPanel}
\usage{
bs4HideTab(inputId, target, session = shiny::getDefaultReactiveDomain())

bs4ShowTab(
  inputId,
  target,
  select = FALSE,
  session = shiny::getDefaultReactiveDomain()
)
}
\arguments{
\item{inputId}{The id of the \link{bs4TabSetPanel} in which to find target.}

\item{target}{The value of the \link{bs4TabPanel} to be hidden/shown.}

\item{session}{The shiny session within which to call this function.}

\item{select}{Should target be selected upon being shown?}
}
\description{
Dynamically hide/show a bs4TabPanel
}
\examples{
if (interactive()) {
 library(shiny)
 library(bs4Dash)
 
 ui <- bs4DashPage(
   body = bs4DashBody(
     bs4TabSetPanel(
       id = "tabs",
       side = "left",
       bs4TabPanel(
         tabName = "Tab 1", 
         active = FALSE,
         "Content 1"
       ),
       bs4TabPanel(
         tabName = "Tab 2", 
         active = TRUE,
         "Content 2"
       ),
       bs4TabPanel(
         tabName = "Tab 3", 
         active = FALSE,
         "Content 3"
       )
     ),
     br(),
     actionButton("hideTab", "Hide 'Tab 1' tab"),
     actionButton("showTab", "Show 'Tab ' tab"),
     actionButton("hideTab2", "Hide 'Tab 2'"),
     actionButton("showTab2", "Show 'Tab 2'")
   )
 )
 
 server <- function(input, output, session) {
   observeEvent(input$hideTab, {
     bs4HideTab(inputId = "tabs", target = "Tab 1")
   })
   
   observeEvent(input$showTab, {
     bs4ShowTab(inputId = "tabs", target = "Tab 1")
   })
   
   observeEvent(input$hideTab2, {
     bs4HideTab(inputId = "tabs", target = "Tab 2")
   })
   
   observeEvent(input$showTab2, {
     bs4ShowTab(inputId = "tabs", target = "Tab 2", select = TRUE)
   })
   
 }
 
 shinyApp(ui, server)
}
}
