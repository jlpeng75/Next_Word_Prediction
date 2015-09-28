source(prediction.R)


shinyServer(
  function(input, output){
    
    output$sentence <- renderPrint({input$sentence})
    output$pred <- renderPrint({prediction(input$sentence)})
        
  }
  
)