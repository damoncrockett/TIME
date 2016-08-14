d = read.csv("X.csv")
final_idx = nrow(d) - 1 # bc python is 0-indexed
d$idx = as.character(c(0:final_idx))

library(ggplot2)
library(reshape2)

DIR = "/Users/damoncrockett/Desktop/TIME/histlines/"
EXT = ".jpg"

for (i in d$idx) {
  filestring = paste(DIR,i,EXT,sep="")
  tmp = melt(subset(d,d$idx==i),id.vars="idx")
  #tmp$cat = c(rep("A",8),rep("B",8),rep("C",8))
  ggplot(tmp,aes(variable,value,group=idx)) + 
    geom_line(color="white",size=0.25) +
    #geom_line(data=tmp[tmp$cat=="A",],color="white",size=0.25) + 
    #geom_line(data=tmp[tmp$cat=="B",],color="white",size=0.25,linetype="dotted") + 
    #geom_line(data=tmp[tmp$cat=="C",],color="white",size=0.25) + 
    theme(panel.background = element_rect(fill=rgb(50,50,50,max=255)),
          panel.grid.major = element_line(color=rgb(50,50,50,max=255)),
          panel.grid.minor = element_line(color=rgb(50,50,50,max=255)),
          plot.background = element_rect(fill=rgb(50,50,50,max=255)),
          legend.position="none",
          axis.ticks = element_blank(),
          axis.text = element_blank(),
          text = element_blank())
  ggsave(filename=filestring,width=1,height=1,units="in",dpi=300)
}