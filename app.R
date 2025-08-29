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
             menuSubItem("Ron Desantis", tabName = "Ron_Desantis"),
             menuSubItem("J.D. Vance", tabName="JD_Vance"),
             menuSubItem("Nikki Haley", tabName="Nikki_Haley"),
             menuSubItem("Vivek Ramaswamy", tabName="Vivek_Ramaswamy"),
             menuSubItem("Ted Cruz", tabName="Ted_Cruz"),
             menuSubItem("Marco Rubio",tabName="Marco_Rubio")
    )
  )
)
ron_desantis_data<-republican_party_primary_polling|>filter(Candidate=="Ron Desantis")|>mutate(Poll_Boundary=ifelse(State=="NULL","Nationwide",State))
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "Ron_Desantis",
            box(title = "Ron Desantis", width = 100, status = "warning", DTOutput("Ron_Desantis_Data"), plotOutput("Ron_Desantis_Chart", width="775px"),DTOutput("Ron_Desantis_Summary"),uiOutput("Ron_Desantis_Text_1"),textOutput("Ron_Desantis_Text_2"),textOutput("Ron_Desantis_Text_3"))
    ),
    
    tabItem(tabName = "JD_Vance",
            box(title = "J.D. Vance", width = 100, status = "warning", DTOutput("JD_Vance_Data"), plotOutput("JD_Vance_Chart", width="775px"),DTOutput("JD_Vance_Summary"),uiOutput("JD_Vance_Text_1"),uiOutput("JD_Vance_Text_2"),uiOutput("JD_Vance_Text_3"),uiOutput("JD_Vance_Text_4"),uiOutput("JD_Vance_Text_5"),uiOutput("JD_Vance_Text_6"))
            
    ),
    tabItem(tabName = "Nikki_Haley",
            box(title = "Nikki Haley", width = 100, status = "warning", DTOutput("Nikki_Haley_Data"), plotOutput("Nikki_Haley_Chart", width="775px"),DTOutput("Nikki_Haley_Summary"))
    ),
    tabItem(tabName = "Vivek_Ramaswamy",
            box(title = "Vivek Ramaswamy", width = 100, status = "warning", DTOutput("Vivek_Ramaswamy_Data"), plotOutput("Vivek_Ramaswamy_Chart", width="775px"),DTOutput("Vivek_Ramaswamy_Summary"))
    ),
    tabItem(tabName = "Ted_Cruz",
            box(title = "Ted Cruz", width = 100, status = "warning", DTOutput("Ted_Cruz_Data"), plotOutput("Ted_Cruz_Chart", width="775px"),DTOutput("Ted_Cruz_Summary"))
    ),
    tabItem(tabName = "Marco_Rubio",
            box(title = "Marco Rubio", width = 100, status = "warning", DTOutput("Marco_Rubio_Data"), plotOutput("Marco_Rubio_Chart", width="775px"),DTOutput("Marco_Rubio_Summary"))
    )
  )
)

# Define UI ----

ui<-dashboardPage(header, sidebar, body)

# Define server logic ----
server <- function(input, output) {
  
  output$Ron_Desantis_Data <- renderDT({datatable(ron_desantis_data)})
  output$Ron_Desantis_Summary <- renderDT({datatable(ron_desantis_summary)})
  output$Ron_Desantis_Chart<- renderPlot(ron_desantis_chart)
  output$Ron_Desantis_Text_1<-renderUI(h3("Additional Notes",style = "font-size:18px;"))
  output$Ron_Desantis_Text_2<-renderText("Since J.D. Vance was nominated to run for Vice President, Ron Desantis has continued to struggle polling past J.D. Vance")
  output$Ron_Desantis_Text_3<-renderText("Hi J.D. Vance was nominated to run for Vice President, Ron Desantis has continued to struggle polling past J.D. Vance")
  output$JD_Vance_Data <- renderDT({datatable(jd_vance_data)})
  output$JD_Vance_Summary <- renderDT({datatable(jd_vance_summary)})
  output$JD_Vance_Chart<- renderPlot(jd_vance_chart)
  output$JD_Vance_Text_1<-renderUI(h3("Important Events",style = "font-size:18px;"))
  output$JD_Vance_Text_2<-renderUI(tags$ul(tags$li("July 15, 2024 - J.D. Vance is selected as then presumptive Republican Nominee Donald Trump’s running mate"),
                                   tags$li("November 5, 2024 - J.D. Vance is elected as the 48th United States Vice President"),
                                   tags$li("January 20, 2025 - J.D. Vance is inaugurated as the 48th United States Vice President"),
                                   style = "font-size:16px;"))
  output$JD_Vance_Text_3<-renderUI(h3("Additional Notes & Analysis",style = "font-size:18px;"))
  output$JD_Vance_Text_4<-renderUI(tags$ul(tags$li("Since being nominated to run for Vice President, J.D. Vance has lead in all nationwide and statewide polls"),
                                   tags$li("Vance’s surge in the polls comes greatly to the expense of Ron Desantis, Nikki Haley, and Vivek Ramaswamy, who all polled over 10 points ahead of him prior to his Vice Presidential nomination"),
                                   tags$li("While an NBC news poll conducted in March 2025 has J.D. Vance at an approval rating of only 41%, J.D. Vance still has an average polling of 38.58%, a lot higher than all other potential contenders for the Republican nomination"),
                                   style = "font-size:16px;"))
  output$JD_Vance_Text_5<-renderUI(h3("References",style = "font-size:18px;"))
  output$JD_Vance_Text_6<-renderUI(tags$ul (tags$li(tags$em("NBC March 2025 poll - 3-16-2025 release"), ". DocumentCloud. (n.d.).",tags$br(), tags$a(href= "https://www.documentcloud.org/documents/25569109-nbc-march-2025-poll-3-16-2025-release/","https://www.documentcloud.org/documents/25569109-nbc-march-2025-poll-3-16-2025-release/"),style="font-size:16px;"),
                                                            tags$li("NBCUniversal News Group. (2024, July 16). ", tags$em("Trump picks Ohio sen. JD Vance for vice president. "), "NBCNews.com.",tags$br(), tags$a(href="https://www.nbcnews.com/politics/2024-election/trump-vice-president-running-mate-pick-jd-vance-rcna157485","https://www.nbcnews.com/politics/2024-election/trump-vice-president-running-mate-pick-jd-vance-rcna157485"),style="font-size:16px;"),
                                                            tags$li(tags$em("JD Vance has officially been sworn in as the vice president of the US"),". Sky News. (n.d.).", tags$br(),
                                            tags$a(href="https://news.sky.com/video/jd-vance-has-officially-been-sworn-in-as-the-vice-president-of-the-us-13293169","https://news.sky.com/video/jd-vance-has-officially-been-sworn-in-as-the-vice-president-of-the-us-13293169"),style="font-size:16px;")))
  output$Nikki_Haley_Data <- renderDT({datatable(nikki_haley_data)})
  output$Nikki_Haley_Summary <- renderDT({datatable(nikki_haley_summary)})
  output$Nikki_Haley_Chart<- renderPlot(nikki_haley_chart)
  output$Vivek_Ramaswamy_Data <- renderDT({datatable(vivek_ramaswamy_data)})
  output$Vivek_Ramaswamy_Summary <- renderDT({datatable(vivek_ramaswamy_summary)})
  output$Vivek_Ramaswamy_Chart<- renderPlot(vivek_ramaswamy_chart)
  output$Ted_Cruz_Data <- renderDT({datatable(ted_cruz_data)})
  output$Ted_Cruz_Summary <- renderDT({datatable(ted_cruz_summary)})
  output$Ted_Cruz_Chart<- renderPlot(ted_cruz_chart)
  output$Marco_Rubio_Data <- renderDT({datatable(marco_rubio_data)})
  output$Marco_Rubio_Summary <- renderDT({datatable(marco_rubio_summary)})
  output$Marco_Rubio_Chart<- renderPlot(marco_rubio_chart)
  #{ggplot(ron_desantis_data, aes(x=DMY,y=Polling,color=Poll_Boundary)) + geom_point(alpha=0.6) + geom_line() +scale_x_date(date_breaks="3 months") + labs(title="Ron Desantis",x="Date",y="Polling (%)")}
  #output$table = DT::renderDataTable({
   # DT::datatable(tabledata)
  #})
}

# Run the app ----
shinyApp(ui = ui, server = server)

