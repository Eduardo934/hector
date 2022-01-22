library(shiny)
library(shinyFiles)

ui <- fluidPage(
  shinyDirButton('folder', 'Select a folder', 'Please select a folder', FALSE)
)
server <- function(input, output){
  volumes = getVolumes() # this makes the directory at the base of your computer.
  observe({
    shinyDirChoose(input, 'folder', roots=c('wd' = '.'), filetypes=c('', 'txt'))
  })
}
shinyApp(ui=ui, server=server)
