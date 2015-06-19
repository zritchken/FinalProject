shinyUI(fluidPage(
        titlePanel(div("Ideal Car Selector",style="color:blue",size="30")),
        br(),
        sidebarPanel(width=6,
        h4("This application uses the 1974 Motor Trend dataset to return an ideal car based on transmission, engine size, and performance inputs.
           Select desired transmission type and engine type, and",strong("Acceleration"), "for the car with the fastest quartermile time, or",strong("Efficiency"), "for the one with the highest mpg. 
        The application will return the best resulting vehicle. Just click Go!")),
        sidebarPanel(
                selectInput("Trans", "Choose Transmission Type", choices = c('Manual'='1','Automatic'='0')),
                selectInput("Engine", "Choose Engine Type", choices = c('4 Cyl'='1','6 Cyl'='2','8 Cyl'='3')),
                selectInput("Speed", "Prefer Acceleration or Efficiency?", choices = c('Acceleration'='1','Efficiency'='2')),
                submitButton('Go')
        ),
        mainPanel(width=10,
                h1('Results',style="color:blue"),
                br(),
                h4('You selected'),
                verbatimTextOutput("TransType"),
                h4('You selected'),
                verbatimTextOutput("EngineType"),
                h4('You selected'),
                verbatimTextOutput("SpeedType"),
                br(),
                strong('Answer!',style="font-size:140%"),
                br(),
                strong(verbatimTextOutput("answer"))
           
        )
))