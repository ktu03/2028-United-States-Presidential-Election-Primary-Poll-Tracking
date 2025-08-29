source("Main.R")
library(rsconnect)
library(shiny)
library(shinydashboard)
library(DT)


rsconnect::setAccountInfo(name='ktu03',
                          token='779FAF60BC97C9B55D00781F78195742',
                          secret='lm7gDzn0EDCFGwVfThKqq8/+V2BTg5X28CnPYGnj')
header <- dashboardHeader(
  title = "Republican Party"
)

sidebar <- dashboardSidebar(
  sidebarMenu (
    menuItem("Candidate",startExpanded = TRUE,
             menuSubItem("Kamala Harris", tabName = "Kamala_Harris"),
             menuSubItem("Gavin Newsom", tabName="Gavin_Newsom"),
             menuSubItem("Pete Buttigieg", tabName="Pete_Buttigieg"),
             menuSubItem("Alexandria Ocasio-Cortez", tabName="Alexandria_Ocasio_Cortez"),
             menuSubItem("Cory Booker", tabName="Cory_Booker"),
             menuSubItem("Tim Walz",tabName="Tim_Walz")
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "Kamala_Harris",
            box(title = "Kamala Harris", width = 100, status = "warning", DTOutput("Kamala_Harris_Data"), plotOutput("Kamala_Harris_Chart", width="775px"))
    ),
    
    tabItem(tabName = "Gavin_Newsom",
            box(title = "Gavin Newsom", width = 100, status = "warning", DTOutput("Gavin_Newsom_Data"), plotOutput("Gavin_Newsom_Chart", width="775px"))
            
    ),
    tabItem(tabName = "Pete_Buttigieg",
            box(title = "Pete Buttigieg", width = 100, status = "warning", DTOutput("Pete_Buttigieg_Data"), plotOutput("Pete_Buttigieg_Chart", width="775px"))
    ),
    tabItem(tabName = "Alexandria_Ocasio_Cortez",
            box(title = "Alexandria Ocasio Cortez", width = 100, status = "warning", DTOutput("Alexandria_Ocasio_Cortez_Data"), plotOutput("Alexandria_Ocasio_Cortez_Chart", width="775px"))
    ),
    tabItem(tabName = "Cory_Booker",
            box(title = "Cory Booker", width = 100, status = "warning", DTOutput("Cory_Booker_Data"), plotOutput("Cory_Booker_Chart", width="775px"))
    ),
    tabItem(tabName = "Tim_Walz",
            box(title = "Tim Walz", width = 100, status = "warning", DTOutput("Tim_Walz_Data"), plotOutput("Tim_Walz_Chart", width="775px"))
    )
  )
)

# Define UI ----

ui<-dashboardPage(header, sidebar, body)

# Define server logic ----
server <- function(input, output) {
  
  output$Kamala_Harris_Data <- renderDT({datatable(kamala_harris_data)})
  output$Kamala_Harris_Chart<- renderPlot({ggplot(kamala_harris_data, aes(x=DMY,y=Polling,color=Poll_Boundary)) + geom_point(alpha=0.6) + geom_line() +scale_x_date(date_breaks="3 months") + labs(title="Kamala Harris",x="Date",y="Polling (%)")})
  output$Gavin_Newsom_Data <- renderDT({datatable(gavin_newsom_data)})
  output$Gavin_Newsom_Chart<- renderPlot({ggplot(gavin_newsom_data, aes(x=DMY,y=Polling,color=Poll_Boundary)) + geom_point(alpha=0.6) + geom_line() +scale_x_date(date_breaks="3 months") + labs(title="Gavin Newsom",x="Date",y="Polling (%)")})
  output$Pete_Buttigieg_Data <- renderDT({datatable(pete_buttigieg_data)})
  output$Pete_Buttigieg_Chart<- renderPlot({ggplot(pete_buttigieg_data, aes(x=DMY,y=Polling,color=Poll_Boundary)) + geom_point(alpha=0.6) + geom_line() +scale_x_date(date_breaks="3 months") + labs(title="Pete Buttigieg",x="Date",y="Polling (%)")})
  output$Alexandria_Ocasio_Cortez_Data <- renderDT({datatable(alexandria_ocasio_cortez_data)})
  output$Alexandria_Ocasio_Cortez_Chart<- renderPlot({ggplot(alexandria_ocasio_cortez_data, aes(x=DMY,y=Polling,color=Poll_Boundary)) + geom_point(alpha=0.6) + geom_line() +scale_x_date(date_breaks="3 months") + labs(title="Alexandria Ocasio Cortez",x="Date",y="Polling (%)")})
  output$Cory_Booker_Data <- renderDT({datatable(cory_booker_data)})
  output$Cory_Booker_Chart<- renderPlot({ggplot(cory_booker_data, aes(x=DMY,y=Polling,color=Poll_Boundary)) + geom_point(alpha=0.6) + geom_line() +scale_x_date(date_breaks="3 months") + labs(title="Cory Booker",x="Date",y="Polling (%)")})
  output$Tim_Walz_Data <- renderDT({datatable(tim_walz_data)})
  output$Tim_Walz_Chart<- renderPlot({ggplot(tim_walz_data, aes(x=DMY,y=Polling,color=Poll_Boundary)) + geom_point(alpha=0.6) + geom_line() +scale_x_date(date_breaks="3 months") + labs(title="Tim Walz",x="Date",y="Polling (%)")})
  
  #output$table = DT::renderDataTable({
  # DT::datatable(tabledata)
  #})
}

# Run the app ----
shinyApp(ui = ui, server = server)