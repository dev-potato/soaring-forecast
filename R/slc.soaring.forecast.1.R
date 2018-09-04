#Website structure changed!

#Get the working directory
  working.directory<-file.path(path.expand("~"),"SLC_SoaringForecast")
  setwd(working.directory)
#Get today's date
  today <- Sys.Date()
#Download html from the webpage for today's date
  url<-"http://www.weather.gov/source/slc/aviation/files/SLCSRGSLC0.txt"
#Download today's data and save with today's date
  filename <- paste0(as.character(today,format="%Y.%m.%d"),"_SLC_Soaring_Forecast.txt")
  download.file(url = url,destfile = file.path(working.directory,"Soaring_Forecast_Archive",filename))
