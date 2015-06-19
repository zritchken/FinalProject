library(shiny)
library(datasets)

shinyServer(
        function(input, output) {
                output$TransType <- renderText({
                        if (input$Trans == "1") "Manual"
                        else "Automatic"
                })
                
                output$EngineType <- renderText({
                        if (input$Engine == "1") "4-Cyl"
                        else if (input$Engine == "2") "6-Cyl"
                        else if (input$Engine == "3") "8-Cyl"
                        else ""
                })
                
                output$SpeedType <- renderText({
                        if (input$Speed == "1") "Acceleration"
                        else if (input$Speed == "2") "Efficiency"
                        else ""
                })
                
                data_modded <- reactive({
                        mtcars$carname <- rownames(mtcars)
                        mtcars <- subset(mtcars, mtcars$am %in% input$Trans)
                        mtcars$cyl <- as.character(mtcars$cyl)
                        if (input$Engine=="2") {cyl <- "6"}
                        if (input$Engine=="1") {cyl <- "4"}
                        if (input$Engine=="3") {cyl <- "8"}
                        mtcars <- mtcars[mtcars$cyl == cyl,]
                        if (input$Speed=="1") 
                        {mtcars <- mtcars[mtcars$qsec ==min(mtcars$qsec),]}
                        if (input$Speed=="2")
                        {mtcars <- mtcars[mtcars$mpg==max(mtcars$mpg),]}
                        mtcars <- mtcars[1,12]
                        mtcars <- as.character(mtcars)
                        return(mtcars)
                        
              
                
                        
                })
                
                output$answer <- renderText({data_modded()})
                
        
                
                        
        }
        
)





