source("Main.R")
library(rsconnect)
library(shiny)
library(shinydashboard)
library(DT)


rsconnect::setAccountInfo(name='ktu03',
                          token='779FAF60BC97C9B55D00781F78195742',
                          secret='lm7gDzn0EDCFGwVfThKqq8/+V2BTg5X28CnPYGnj')
header <- dashboardHeader(
  title = "Democratic Party"
)

sidebar <- dashboardSidebar(
  sidebarMenu (
    menuItem("Candidate",startExpanded = TRUE,
             menuSubItem("Kamala Harris", tabName = "Kamala_Harris"),
             menuSubItem("Gavin Newsom", tabName="Gavin_Newsom"),
             menuSubItem("Pete Buttigieg", tabName="Pete_Buttigieg"),
             menuSubItem("Alexandria Ocasio-Cortez", tabName="Alexandria_Ocasio_Cortez"),
             menuSubItem("Cory Booker", tabName="Cory_Booker"),
             menuSubItem("Tim Walz",tabName="Tim_Walz"),
             menuSubItem("Gretchen Whitmer",tabName="Gretchen_Whitmer"),
             menuSubItem("Josh Shapiro",tabName="Josh_Shapiro")
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "Kamala_Harris",
            box(title = "Kamala Harris", width = 100, status = "warning", DTOutput("Kamala_Harris_Data"), plotOutput("Kamala_Harris_Chart", width="800px",height="600px"), DTOutput("Kamala_Harris_Summary"),uiOutput("Kamala_Harris_Text_1"),uiOutput("Kamala_Harris_Text_2"),uiOutput("Kamala_Harris_Text_3"),uiOutput("Kamala_Harris_Text_4"),uiOutput("Kamala_Harris_Text_5"),uiOutput("Kamala_Harris_Text_6"),uiOutput("Kamala_Harris_Text_7"),uiOutput("Kamala_Harris_Text_8"))
    ),
    
    tabItem(tabName = "Gavin_Newsom",
            box(title = "Gavin Newsom", width = 100, status = "warning", DTOutput("Gavin_Newsom_Data"), plotOutput("Gavin_Newsom_Chart", width="800px",height="600px"),DTOutput("Gavin_Newsom_Summary"))
            
    ),
    tabItem(tabName = "Pete_Buttigieg",
            box(title = "Pete Buttigieg", width = 100, status = "warning", DTOutput("Pete_Buttigieg_Data"), plotOutput("Pete_Buttigieg_Chart", width="800px",height="600px"),DTOutput("Pete_Buttigieg_Summary"),uiOutput("Pete_Buttigieg_Text_1"),uiOutput("Pete_Buttigieg_Text_2"),uiOutput("Pete_Buttigieg_Text_3"),uiOutput("Pete_Buttigieg_Text_4"))
    ),
    tabItem(tabName = "Alexandria_Ocasio_Cortez",
            box(title = "Alexandria Ocasio Cortez", width = 100, status = "warning", DTOutput("Alexandria_Ocasio_Cortez_Data"), plotOutput("Alexandria_Ocasio_Cortez_Chart", width="800px",height="600px"),DTOutput("Alexandria_Ocasio_Cortez_Summary"),uiOutput("Alexandria_Ocasio_Cortez_Text_1"),uiOutput("Alexandria_Ocasio_Cortez_Text_2"),uiOutput("Alexandria_Ocasio_Cortez_Text_3"),uiOutput("Alexandria_Ocasio_Cortez_Text_4"),uiOutput("Alexandria_Ocasio_Cortez_Text_5"),uiOutput("Alexandria_Ocasio_Cortez_Text_6"))
    ),
    tabItem(tabName = "Cory_Booker",
            box(title = "Cory Booker", width = 100, status = "warning", DTOutput("Cory_Booker_Data"), plotOutput("Cory_Booker_Chart", width="800px",height="600px"),DTOutput("Cory_Booker_Summary"),uiOutput("Cory_Booker_Text_1"),uiOutput("Cory_Booker_Text_2"),uiOutput("Cory_Booker_Text_3"),uiOutput("Cory_Booker_Text_4"),uiOutput("Cory_Booker_Text_5"),uiOutput("Cory_Booker_Text_6"))
    ),
    tabItem(tabName = "Tim_Walz",
            box(title = "Tim Walz", width = 100, status = "warning", DTOutput("Tim_Walz_Data"), plotOutput("Tim_Walz_Chart", width="800px",height="600px"),DTOutput("Tim_Walz_Summary"))
    ),
    tabItem(tabName = "Gretchen_Whitmer",
            box(title = "Gretchen Whitmer", width = 100, status = "warning", DTOutput("Gretchen_Whitmer_Data"), plotOutput("Gretchen_Whitmer_Chart", width="800px",height="600px"),DTOutput("Gretchen_Whitmer_Summary"))
    ),
    tabItem(tabName = "Josh_Shapiro",
            box(title = "Josh Shapiro", width = 100, status = "warning", DTOutput("Josh_Shapiro_Data"), plotOutput("Josh_Shapiro_Chart", width="800px",height="600px"),DTOutput("Josh_Shapiro_Summary"))
    )
  )
)

# Define UI ----

ui<-dashboardPage(header, sidebar, body)

# Define server logic ----
server <- function(input, output) {
  
  output$Kamala_Harris_Data <- renderDT({datatable(kamala_harris_data)})
  output$Kamala_Harris_Summary <- renderDT({datatable(kamala_harris_summary)})
  output$Kamala_Harris_Chart<- renderPlot(kamala_harris_chart)
  output$Kamala_Harris_Text_1<-renderUI(h3("Important Events",style = "font-size:18px;"))
  output$Kamala_Harris_Text_2<-renderUI(tags$ul (tags$li("July 21, 2024 - Kamala Harris launches 2024 Presidential bid after President Joe Biden dropped out of the race"),style="font-size:16px;"))
  output$Kamala_Harris_Text_3<-renderUI(tags$ul (tags$li("August 5, 2024 - Kamala Harris officially secures Democratic Party nomination to run for President"),style="font-size:16px;"))
  output$Kamala_Harris_Text_4<-renderUI(tags$ul (tags$li("November 5, 2024 - Kamala Harris loses 2024 U.S. Presidential Election to Donald Trump"),style="font-size:16px;"))
  output$Kamala_Harris_Text_5<-renderUI(h3("Additional Notes & Analysis",style = "font-size:18px;"))
  output$Kamala_Harris_Text_6<-renderUI(tags$ul (tags$li("If Kamala Harris were to launch a bid for California’s 2026 Gubernatorial Election, then it is unlikely that she will run for President again considering that she would need to launch a Presidential bid within one year of taking office, which would lead to great criticism of not focusing on her role as Governor"),
                                               tags$li("Average polling for Kamala Harris since Apr. 2025 has been at 26%, 8 points below from Jan. 2024 - Mar. 2025, with Gavin Newsom, Cory Booker, Alexandria Ocasio-Cortez, and Pete Buttigieg making significant gains simultaneously. Such phenomenon may suggest that the momentum Democrats had for Kamala Harris, especially throughout the 2024 U.S. Presidential Election, is not persisting"),
                                               tags$li("According to a YouGov/Economist survey, 79% of Democrats would have supported Kamala Harris if Joe Biden withdrew from the 2024 race, which he eventually did")
                                               ,style="font-size:16px;"))
  output$Kamala_Harris_Text_7<-renderUI(h3("References",style = "font-size:18px;"))
  output$Kamala_Harris_Text_8<-renderUI(tags$ul (tags$li("Sforza, L. (2024, July 18). ", tags$em("79 percent of Democrats approve of Harris replacing Biden if he steps aside: Poll. "), "The Hill.",tags$br(), tags$a(href="https://thehill.com/homenews/campaign/4779366-kamala-harris-joe-biden-withdraw-2024-survey/","https://thehill.com/homenews/campaign/4779366-kamala-harris-joe-biden-withdraw-2024-survey/")),
                                               style="font-size:16px;"))
  output$Gavin_Newsom_Data <- renderDT({datatable(gavin_newsom_data)})
  output$Gavin_Newsom_Summary <- renderDT({datatable(gavin_newsom_summary)})
  output$Gavin_Newsom_Chart<- renderPlot(gavin_newsom_chart)
  output$Pete_Buttigieg_Data <- renderDT({datatable(pete_buttigieg_data)})
  output$Pete_Buttigieg_Summary <- renderDT({datatable(pete_buttigieg_summary)})
  output$Pete_Buttigieg_Chart<- renderPlot(pete_buttigieg_chart)
  output$Pete_Buttigieg_Text_1<-renderUI(h3("Important Events",style = "font-size:18px;"))
  output$Pete_Buttigieg_Text_2<-renderUI(tags$ul (tags$li("March 13, 2025 - Pete Buttigieg declines running for Michigan Senate in 2026"),style="font-size:16px;"))
  output$Pete_Buttigieg_Text_3<-renderUI(h3("Additional Notes & Analysis",style = "font-size:18px;"))
  output$Pete_Buttigieg_Text_4<-renderUI(tags$ul (tags$li("As a result of not running for the Senate in 2026, Pete Buttigieg has positioned himself as a better contender for the White House in 2028 as winning a Senate race would almost certainly take away any ambitions of running for President"),
                                                  tags$li("Since announcing that he would not run for Senate, Pete Buttigieg polled on average 13%, 3 points higher than before making the announcement"),
                                                  tags$li("Pete Buttigieg beat Kamala Harris in 4 nationwide polls and 1 statewide poll so far since Apr. 2025"),
                                                  style="font-size:16px;"))
  output$Alexandria_Ocasio_Cortez_Data <- renderDT({datatable(alexandria_ocasio_cortez_data)})
  output$Alexandria_Ocasio_Cortez_Summary <- renderDT({datatable(alexandria_ocasio_cortez_summary)})
  output$Alexandria_Ocasio_Cortez_Chart<- renderPlot(alexandria_ocasio_cortez_chart)
  output$Alexandria_Ocasio_Cortez_Text_1<-renderUI(h3("Important Events",style = "font-size:18px;"))
  output$Alexandria_Ocasio_Cortez_Text_2<-renderUI(tags$ul (tags$li("February 22, 2025 - Fighting Oligarchy Tour begins, led by Bernie Sanders and Alexandria Ocasio-Cortez"),style="font-size:16px;"))
  output$Alexandria_Ocasio_Cortez_Text_3<-renderUI(h3("Additional Notes & Analysis",style = "font-size:18px;"))
  output$Alexandria_Ocasio_Cortez_Text_4<-renderUI(tags$ul (tags$li("According to a Gallup poll conducted during Jan. 21-27 2025, 66% of Democrats had viewed her favorably, while only 24% for Independents"),
                                               tags$li("A CNN poll conducted during Mar. 6-9 2025 with a sample of 504 respondents found 10% of respondents to believe that Alexandria Ocasio-Cortez best reflects the core values of the Democratic Party"),
                                               tags$li("Between Nov. 2024 and the end of Feb, 2025, Alexandria Ocasio-Cortez polled on average 4%, while from March 2025 to the end of June 2025, Alexandria Ocasio-Cortez polled on average 11%, which may suggest her popularity is rising as a result of the Fighting Oligarchy Tour she ran with Bernie Sanders ")
                                               ,style="font-size:16px;"))
  output$Alexandria_Ocasio_Cortez_Text_5<-renderUI(h3("References",style = "font-size:18px;"))
  output$Alexandria_Ocasio_Cortez_Text_6<-renderUI(tags$ul (tags$li("Jones, J. M. (2025, April 9).", tags$em("Few major U.S. political figures rated positively on balance."), "Gallup.com.",tags$br(), tags$a(href="https://news.gallup.com/poll/656111/few-major-political-figures-rated-positively-balance.aspx?version=print","https://news.gallup.com/poll/656111/few-major-political-figures-rated-positively-balance.aspx?version=print")),
                                                            tags$li("CNN Poll. (n.d.).", tags$em("Political parties poll results"), "[PDF]. Retrieved June 30, 2025, from",tags$br(), tags$a(href="https://s3.documentcloud.org/documents/25563079/cnn-poll-political-parties.pdf","https://s3.documentcloud.org/documents/25563079/cnn-poll-political-parties.pdf")),
                                               style="font-size:16px;"))
  output$Cory_Booker_Data <- renderDT({datatable(cory_booker_data)})
  output$Cory_Booker_Summary <- renderDT({datatable(cory_booker_summary)})
  output$Cory_Booker_Chart<- renderPlot(cory_booker_chart)
  output$Cory_Booker_Text_1<-renderUI(h3("Important Events",style = "font-size:18px;"))
  output$Cory_Booker_Text_2<-renderUI(tags$ul (tags$li("March 31, 2025 - Cory Booker delivers longest speech in U.S. Senate history, a time length of 25 hours and 5 minutes to protest against Donald Trump’s administration"),style="font-size:16px;"))
  output$Cory_Booker_Text_3<-renderUI(h3("Additional Notes & Analysis",style = "font-size:18px;"))
  output$Cory_Booker_Text_4<-renderUI(tags$ul (tags$li("On TikTok, Cory Booker’s speech was streamed live and viewed by more than 300 thousand people at once, while receiving more than 350 million likes"),
                                               tags$li("Since his marathon speech, Cory Booker polled on average 8%, 6 points higher than before the speech, which may be due to a gain in popularity after the speech "),
                                               tags$li("With such a record breaking and nationwide known speech, Cory Booker’s action is beneficial for Democrats to regain their popularity as Independents are more likely to support Cory Booker for protesting via a speech rather than radical left-wing policy proposals that Democrats have been criticized for in the past. Additionally, Democrats will more likely unite behind Cory Booker to lead them, which allows for a strong base of support heading into the next Presidential Election")
                                               ,style="font-size:16px;"))
  output$Cory_Booker_Text_5<-renderUI(h3("References",style = "font-size:18px;"))
  output$Cory_Booker_Text_6<-renderUI(tags$ul (tags$li("NBCUniversal News Group. (2025, April 2).", tags$em("Cory Booker goes viral in shattering a nearly 70-year record with Historic Marathon Senate speech."), "NBCNews.com.",tags$br(), tags$a(href="https://www.nbcnews.com/pop-culture/pop-culture-news/cory-booker-marathon-speech-rcna199246","https://www.nbcnews.com/pop-culture/pop-culture-news/cory-booker-marathon-speech-rcna199246")),
                                               style="font-size:16px;"))
  output$Tim_Walz_Data <- renderDT({datatable(tim_walz_data)})
  output$Tim_Walz_Summary <- renderDT({datatable(tim_walz_summary)})
  output$Tim_Walz_Chart<- renderPlot(tim_walz_chart)
  output$Gretchen_Whitmer_Data <- renderDT({datatable(gretchen_whitmer_data)})
  output$Gretchen_Whitmer_Summary <- renderDT({datatable(gretchen_whitmer_summary)})
  output$Gretchen_Whitmer_Chart<- renderPlot(gretchen_whitmer_chart)
  output$Josh_Shapiro_Data <- renderDT({datatable(josh_shapiro_data)})
  output$Josh_Shapiro_Summary <- renderDT({datatable(josh_shapiro_summary)})
  output$Josh_Shapiro_Chart<- renderPlot(josh_shapiro_chart)
  #output$table = DT::renderDataTable({
  # DT::datatable(tabledata)
  #})
}

# Run the app ----
shinyApp(ui = ui, server = server)