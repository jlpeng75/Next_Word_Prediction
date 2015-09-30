library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Prediction of Next Word"),
  sidebarPanel(
    textInput('sentence', label = h3("Text Input"), value = "Enter your text here"),
    submitButton('Predict Next Word'),
    hr(), 
    h4('Instructions:'),
    p('1. Type in a word or phrase into the "Text Input" box'),
    p('2. Click the "Predict Next Word" button'),
    p('3. The top ten next-word prediction will be displayed on the "prediction_table" tab'),
    p('4. Select other tabs to view the wordcloud and project summary') 
    
  ),
  
  mainPanel(
    tabsetPanel(
        tabPanel("Best_Prediction",
                 h3('next word prediction'),
                 h4('You entered'),
                 verbatimTextOutput("sentence"),
                 h4('Best Prediction'),
                 verbatimTextOutput("best_prediction")
                 ),
        
        tabPanel("Pred_table",
                 h3("Top 10 possible prediction and counts"),
                 br(),
                 dataTableOutput('pred_table')
                 ),
        
        tabPanel("wordcloud",
                 h3('Wordcloud: Top 100 Predictions'),
                 em('Wordcloud may take a few seconds to load...'),
                 br(), 
                 br(),
                 plotOutput(outputId = "wordcloud", height = "450px", width = "450px")
                 ),
        
        tabPanel("About",
                 h3('Text-Prediction App, Version 1.0'),
                 a("Source Code (Github)", href="https://github.com/jlpeng75/Next_Word_Prediction", style="color: limegreen"),
                 h3('Application Summary'),
                 HTML("This application, made specifically for the capstone project of the Johns Hopkins University Data Science Specialization Certificate Program"),
                 
                 
                 h3('Data'),
                 HTML("(1.) Data Source: HC Corpora, corpora.heliohost.org <br>
                 (2.) Training Set: US blogs, news, and twitter (500K lines of text) <br> 
                 (3.) Removed capital letters, numbers, punctuation, and symbols <br>
                 (4.) Tokenized text and created n-grams (n=1,2,3,4) <br>
                 (5.) Created n-gram frequency tables (limited to frequencies > 1) <br>
                 (6.) Converted to data.table objects for faster lookup <br>"),
                 
                 h3('Algorithm'),
                 HTML("(1.) Process text input from user (separate into n words) <br>
                 (2.) Search (n+1)-gram frequency table for matches <br> 
                 (3.) Calculate probabilities of each match (frequency/total) <br>
                 (4.) If no matches, search the next lower-order n-gram table <br>
                 (5.) If no match in 2-gram table, use most frequent 1-grams <br>
                 (6.) Return word with the highest count <br> ")
         
         )
  ))))
