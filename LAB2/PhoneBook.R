##Код собирает тел. справочник из базы данны сотрудников некоторой фирмы

library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File", accept = ".csv"),
      checkboxInput("header", "Header", TRUE)
    ),
    mainPanel(
      tableOutput("mytable")
    )
  )
)

server <- function(input, output) {
  output$mytable <- renderTable({
    if (is.null(input$file1)) {
      return(NULL)
    }
    data <- read.csv(input$file1$datapath, header = input$header, na.strings = "", fill = TRUE)
    names <- paste(data$first_name, data$last_name, sep = " ")
    data2 <- data.frame(Name = names, Phone = data$phone_number, Position = data$position)
    data2
  })
}

shinyApp(ui, server)
