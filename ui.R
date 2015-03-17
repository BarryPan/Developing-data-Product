shinyUI(fluidPage(
  titlePanel("Data Analysis in Kaggle bike sharing"),
  h4("This APP can help you to find out the best way to devide the time variable in the 'train' dataset from Kaggle.com - Bike Sharing Demand Competition."),
  h5("Data source: Fanaee-T, Hadi, and Gama, Joao, Event labeling combining ensemble detectors and background knowledge, Progress in Artificial Intelligence (2013): pp. 1-15, Springer Berlin Heidelberg.
     "),
  h4("Learn more information about the competition, please",
     a("Link.",
       href = "https://www.kaggle.com/c/bike-sharing-demand")),
  h2(strong("Devide time variable into different groups")),
  h5("You can at most devide time variables into four groups by entering the starting hour and ending hour."),
  h5("If you want to devide time variables into fewer groups, just enter '25' in both 'start' and 'from' blanks."),
  br(),
  
  fluidRow(
    h4("period 1"),
    column(2,
           numericInput("num1",
                        label = h5("from (hour)"),
                        value = 8
           )
           
           
    ),
    
    column(2,
           numericInput("num2",
                        label = h5("to (hour)"),
                        value = 12
           )   
    )
    
  ), 
  
  
  
  fluidRow(
    h4("period 2"),
    column(2,
           
           numericInput("num3", 
                        label = h5("from (hour)"),
                        value = 13
           )),
    column(2,    
           numericInput("num4",
                        label = h5("to (hour)"),
                        value = 17
           ))  
  ),  
  
  fluidRow(
    h4("period 3"),
    
    column(2,                         
           numericInput("num5",
                        label = h5("from (hour)"),
                        value = 18
           )      
           
    ),
    column(2,
           numericInput("num6",
                        label = h5("to (hour)"),
                        value = 21
           )   
    )
  ),
  
   
  fluidRow(
   
    p(h4(div("Important!! Any time variables which are not included in groups above are in the 'other' group.",style = "color:red")))
  ),
  
  h2(strong("Other Factors")),
  h5("You are able to add at most one factor into the analysis. To do so, you can find out the best way to devide the time variables under other factors"),
  
  fluidRow(
    selectInput("choice", 
                       label = "other factor",
                       choices = list("season" = 1,
                                      "holiday" = 2,
                                      "workingday" = 3,
                                      "weather" = 4 ,
                                      "None" = 5                                      
                                      ),
                       selected = 5)
  ),
  
  br(),
  
  fluidRow(
    submitButton("Go")
  ),
  br(),
  br(),
  img(src = "Logo.png", height = 154*2/3, width = 111*2/3),
  h5(em("This web is designed by Barry Pan (Panda)")),
  br(),
  br(),
  
  mainPanel(
    h2(strong("Number of observations in each group")),
    tableOutput("table1"),
    h2(strong("Mean of rentals in each group (per hour)")),
    tableOutput("table2"),
    h2(strong("Density plot in each group")),
    plotOutput("plot"),
    h5("*count: number of total rentals")
    )
  )
)
