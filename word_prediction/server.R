

library(shiny)
library(wordcloud)
source("prediction.R")


shinyServer(
  function(input, output){
    
    ## print input
    output$sentence <- renderPrint({input$sentence})
    
    ## best prediction
    output$best_prediction <- renderPrint({prediction(input$sentence)[1,1]})
    
    ## top 10 possible words prediction table
    output$pred_table <- renderDataTable({head(prediction(input$sentence), 10)})
    
    ## wordcloud layout
    output$wordcloud <- renderPlot({wordcloud(prediction(input$sentence)$pred_word,
                                               prediction(input$sentence)$counts,
                                               max.words=100,
                                               random.order=FALSE,
                                               scale=c(5,0.75),
                                               colors=brewer.pal(5,"Dark2") ) 
      
                                               
                                    })                           
    
        
  }
  
)