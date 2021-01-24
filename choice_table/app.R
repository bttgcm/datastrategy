library(shiny)
library(dplyr)

ui <- fluidPage(
    fileInput("csvFile", "Drag cars.csv over here!"),
    tableOutput("rawData"),
    tableOutput("modifiedData")
)

server <- function(input, output, session) {
    rawData <- eventReactive(input$csvFile, {
        read.csv(input$csvFile$datapath)
    })

    output$rawData <- renderTable({
        rawData() %>% head
    })

    output$modifiedData <- renderTable({
        vars <- names(rawData())
        rawData() %>%
            mutate(sum = .data[[vars[[1]]]] + .data[[vars[[2]]]]) %>%
            head
    })
}

shinyApp(ui, server)
