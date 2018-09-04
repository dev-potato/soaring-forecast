  #Download and save today's soaring forecast for SLC from www.wrh.noaa.gov/slc/aviation/soar.php
  #Oh no! URL changed, http://www.weather.gov/slc/Soar
  #This is an Rscript, meant to be run from cron on a daily schedule
  
  #Load required packages
    require(rvest)
    require(methods)

  #Get the working directory
    working.directory<-file.path(path.expand("~"),"SLC_SoaringForecast")
    setwd(working.directory)
  #Get today's date
    today <- Sys.Date()
  #Download html from the webpage for today's date
    url<-"http://www.wrh.noaa.gov/slc/aviation/soar.php?version=0"
    website <- read_html(url)
  #Extract the html node containing today's information. SelectorGadget Chrome Extension is very useful.
    forecasthtml <- html_nodes(website,"pre")
    
  #Parse the html as text  
    forecast <- html_text(forecasthtml,trim = T)
  #Save the forecast with today's date
    filename <- paste0(as.character(today,format="%Y.%m.%d"),"_SLC_Soaring_Forecast.txt")
    write.table(forecast,file = file.path(working.directory,"Soaring_Forecast_Archive",filename),row.names = F,quote = F,col.names = F,eol = "\r\n")
    print("finished")

   
   
    