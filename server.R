library(ggplot2)
train <- read.csv("data/train.csv",header = T)
train$date <- as.Date(train$datetime)
x=as.character(train$datetime)
train$time <- substr(x, start=12, stop=13)
train$time <- as.integer(train$time)
train$weather <- as.factor(train$weather)
train$season <- as.factor(train$season)
train$holiday <- as.factor(train$holiday)
train$workingday <- as.factor(train$workingday)
levels(train$season) = c("spring","summer","fall","winter")
levels(train$holiday) = c("is not holiday","is holiday")
levels(train$workingday) = c("is not working day","is working day")
TF=rep(0,length(train$time))


shinyServer(function(input, output) {  
    
  output$plot <- renderPlot({
    TF[which(train$time %in% c(input$num1:input$num2))] = 1
    TF[which(train$time %in% c(input$num3:input$num4))] = 2
    TF[which(train$time %in% c(input$num5:input$num6))] = 3
    train$timefactor = as.factor(TF)
    levels(train$timefactor) = c("other", "period 1", "period 2", "period 3")
    g=ggplot(train, aes(count, colour = timefactor))
    if(input$choice == 1){x= g + geom_density() + facet_grid(. ~ season)}
    if(input$choice == 2){x= g + geom_density() + facet_grid(. ~ holiday)}
    if(input$choice == 3){x= g + geom_density() + facet_grid(. ~ workingday)}
    if(input$choice == 4){x= g + geom_density() + facet_grid(. ~weather)}
    if(input$choice == 5){x= g + geom_density()}
    
    x
      
    })
  output$table1 <- renderTable({
    TF[which(train$time %in% c(input$num1:input$num2))] = 1
    TF[which(train$time %in% c(input$num3:input$num4))] = 2
    TF[which(train$time %in% c(input$num5:input$num6))] = 3
    train$timefactor = as.factor(TF)
    levels(train$timefactor) = c("other", "period 1", "period 2", "period 3")
    if(input$choice == 1){y = aggregate(count ~ season + timefactor, data = train, length) }
    if(input$choice == 2){y = aggregate(count ~ holiday + timefactor, data = train, length) }
    if(input$choice == 3){y = aggregate(count ~ workingday + timefactor, data = train, length)}
    if(input$choice == 4){y = aggregate(count ~ weather + timefactor, data = train, length)}
    if(input$choice == 5){y = aggregate(count ~ timefactor, data = train, length)}
    
    y
  })
  
  output$table2 <- renderTable({
    TF[which(train$time %in% c(input$num1:input$num2))] = 1
    TF[which(train$time %in% c(input$num3:input$num4))] = 2
    TF[which(train$time %in% c(input$num5:input$num6))] = 3
    train$timefactor = as.factor(TF)
    levels(train$timefactor) = c("other", "period 1", "period 2", "period 3")
    if(input$choice == 1){z = aggregate(count ~ season + timefactor, data = train, mean) }
    if(input$choice == 2){z = aggregate(count ~ holiday + timefactor, data = train, mean) }
    if(input$choice == 3){z = aggregate(count ~ workingday + timefactor, data = train, mean)}
    if(input$choice == 4){z = aggregate(count ~ weather + timefactor, data = train, mean)}
    if(input$choice == 5){z = aggregate(count ~ timefactor, data = train, mean)}
    
    z
  })
  
})
