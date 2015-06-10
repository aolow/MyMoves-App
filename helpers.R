
p <- function(act, var, min, max){
  my_data <- read.csv("data/summary.csv")[,-1]
  my_data <- transform(my_data, Duration = Duration / 60)
  meltdf <- my_data[my_data$Activity==act,]
  meltdf <- melt(meltdf)
  meltdf <- meltdf[meltdf$variable %in% var,]
  meltdf$Date <- as.Date(meltdf$Date)
  meltdf <- meltdf[(meltdf$Date>=min & meltdf$Date<=max),]
  
  
  ggplot(meltdf, aes(x=Date, y=value, colour = variable, group = variable), environment=environment()) + 
    geom_line() + 
    ggtitle(paste(act, "\nfrom", min, "to", max)) +
    theme_bw() +
    theme(plot.title = element_text(size=20, face="bold", vjust=2),
          axis.text.x=element_text(angle=50, size=8, vjust=0.5))
   # scale_color_discrete(name=act)
}

