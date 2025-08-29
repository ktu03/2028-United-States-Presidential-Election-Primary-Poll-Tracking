library(shiny)
library(bslib)
library(ggplot2)
library(DT)
# Define UI ----

ui<-fluidPage(titlePanel("Ron Desantis"), DTOutput("Ron_Desantis_Data"), plotOutput("Ron_Desantis_Chart",height="600px",width="900px"))

# Define server logic ----
server <- function(input, output) {
  output$Ron_Desantis_Data <- renderDT({datatable(ron_desantis_data)})
  output$Ron_Desantis_Chart<- renderPlot({ggplot(ron_desantis_data, aes(x=DMY,y=Polling,color=Poll_Boundary)) + geom_point(alpha=0.6) + geom_line() +scale_x_date(date_breaks="3 months") + labs(title="Ron Desantis",x="Date",Y="Polling (%)")})
}

# Run the app ----
shinyApp(ui = ui, server = server)


