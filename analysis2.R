setwd("C:/Users/kefisher/Box/Publications/Adult Monarch Feeding Behavior/Data Analysis/Telemetry")

library(ggplot2)
library(emmeans)
library(lattice)
library(Rmisc)
library(grid)
library(dplyr)
library(lubridate)
library(circular)
library(multcomp)
library(gridExtra)
library(cowplot)

# ##interactions in 2020
# interact<-read.csv("20_floralsurvey_interactions.csv", header=TRUE)
# names(interact)
# 
# a1<-ggplot(interact,aes(x=reorder(PlantSpecies,Order2), Date, fill= logcount))+
#   geom_tile() +
#   scale_fill_gradient(low="white", high="black") +
#   theme_bw()+
#   #facet_wrap(~Month,ncol=1)+
#   #theme_bw()+
#   theme(panel.grid.major = element_line(color = "black", size = 3))+
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
#   xlab("Plant Species Common Name") +
#   ylab("Log Density")+
#   theme(axis.title.y=element_text(angle=0))+
#   #theme(axis.title.y=element_blank())+
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         panel.background = element_blank(), axis.line = element_line(colour = "black"))+
#   theme(axis.title.x=element_blank())+
#   theme(axis.text.x=element_blank())+
#   theme(axis.text.x = element_text(size=12))+
#   theme(axis.text.x=element_text(colour="black"))+
#   theme(axis.text.y = element_blank(),
#         axis.ticks = element_blank())+
#   #theme(axis.tick = element_blank())+
#   #theme(axis.text.y = element_text(size=12))+
#   #theme(axis.text.y=element_text(colour="black"))+
#   theme(plot.title=element_text(size=18))+
#   theme(axis.title = element_text(size = 14))+
#   theme(strip.text.x = element_text(size=13))+
#   labs(fill="Log # Blooms/100 m")+
#   theme(legend.direction = "horizontal")+
#   theme(legend.position="bottom")+
#   theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))+
#   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
#   ggtitle("a.")
# a1
# 
# #sig defined with chisquare and written into csv file
# b1<-ggplot(interact, aes(x=reorder (PlantSpecies,Order2), y=Count, width=.8))+
#   geom_bar(stat="identity", color="black",fill="grey",
#            position=position_dodge())+
#   #geom_point(data=interact, aes(y=Monarchs, x=reorder (PlantSpecies,-Order2)), size=2, color='black')+
#   #geom_line(data=interact, aes(y=Monarchs, x=reorder (PlantSpecies,-Order2)), color='black',size=0.5,group=1,na.rm=TRUE)+
#   ylab("Total\nFeeding\nBouts") +
#   #xlab("# Observed Feeding Bouts")+
#   theme_bw()+
#   #scale_fill_brewer(palette="YlGnBu")+
#   xlab("Plant Species Common Name") +
#   scale_y_continuous(expand=c(0,0), limits=c(0,30))+
#   #scale_y_continuous(name='Total Observed Feeding Bouts',
#   #                  sec.axis=sec_axis(~., name="Unique Monarchs Observed Feeding"),
#   #                 expand=c(0,0), limits=c(0,132))+
#   geom_text(aes(label=sig, y=(Count+3)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
#   #geom_text(aes(label=sigexit, y=(count+2)),colour="deepskyblue3",vjust=-1.5, size=5, position=position_dodge(.8),fontface="italic")+
#   #geom_text(aes(label=sigenter, y=(count+2)),colour="darkslategray",vjust=-1.5, size=5, position=position_dodge(.8),fontface="plain")+
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         panel.background = element_blank(), axis.line = element_line(colour = "black"))+
#   #theme(axis.text.x = element_text(size=12))+
#   #theme(axis.text.x=element_text(colour="black"))+
#   theme(axis.text.y = element_text(size=12))+
#   theme(axis.text.y=element_text(colour="black"))+
#   theme(axis.title.x=element_blank())+
#   theme(axis.text.x=element_blank())+
#   theme(axis.text.y = element_text(size=12))+
#   theme(axis.text.y=element_text(colour="black"))+
#   theme(axis.title.y=element_text(angle=0))+
#   #scale_y_discrete(labels=label_wrap_gen(width=10))+
#   theme(plot.title=element_text(size=18))+
#   theme(axis.title = element_text(size = 14))
#   #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
#   ggtitle("a.")
# b1
# 
# 
# library(cowplot)
# raw<-plot_grid(b1,a1,ncol=1,align="v")
# raw
# 
# 
# 
# setwd("C:/Users/kefisher/Box/Publications/Adult Monarch Feeding Behavior/Data Analysis/042022_glm")
# 
# 
# julyad<-read.csv("FeedByDay_July_withzeros_ad.csv", header=TRUE)
# names(julyad)
# 
# # speciesad<-glm(LogCount~PlantSpecies,data=julyad,family = gaussian(link = "identity"))
# # emm<-emmeans(speciesad,c("PlantSpecies"),type="response")
# # joint_tests(emm)
# # pairs(emm)
# # emm
# # cld(emm)
# # 
# # 
# # sse<-summarySE(julyad, measurevar="LogCount", groupvars=c("PlantSpecies","Order2"))
# # sse
# # sse$below<-c(0.20,0.02,0.11,0.11,0.02,0,0.04,0.32,0,0.02,0.07,0,0)
# # sse
# # sse$sig<-c("ab","b","ab","ab",
# #            "b","b","b","a","b",
# #            "b","ab","b","b")
# # 
# # 
# # a<-ggplot(sse, aes(x=reorder (PlantSpecies,Order2), y=LogCount, width=.8))+
# #   geom_bar(stat="identity", color="black",fill="grey",
# #            position=position_dodge())+
# #   xlab("Plant Species") +
# #   ylab("Log Count")+
# #   theme_bw()+
# #   #scale_fill_brewer(palette="YlGnBu")+
# #   scale_y_continuous(expand=c(0,0), limits=c(0,1))+
# #   geom_errorbar(aes(ymin=LogCount-below, ymax=LogCount+sd), width=.2, 
# #                 position=position_dodge(.8))+
# #   geom_text(aes(label=sig, y=(LogCount+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
# #   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
# #         panel.background = element_blank(), axis.line = element_line(colour = "black"))+
# #   theme(axis.text.x = element_text(size=12))+
# #   theme(axis.text.x=element_text(colour="black"))+
# #   theme(axis.text.y = element_text(size=12))+
# #   theme(axis.text.y=element_text(colour="black"))+
# #   #scale_y_discrete(labels=label_wrap_gen(width=10))+
# #   theme(plot.title=element_text(size=18))+
# #   theme(axis.title = element_text(size = 14))+
# #   theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
# #   ggtitle("a.")
# # #theme(aspect.ratio = 4.5/10)
# # #theme(legend.position = "bottom")+
# # #guides(fill=guide_legend(title="Habitat Class"))+
# # #theme(legend.text = element_text(size = 14))+
# # #theme(legend.title = element_text(size = 14))+
# # #theme(legend.box.background=element_rect(colour = "black"),
# # #legend.background = element_blank())
# # a
# 
# 
# 
# abunad<-glm(logabuncount1~PlantSpecies,data=julyad,family = gaussian(link = "identity"))
# emm<-emmeans(abunad,c("PlantSpecies"),type="response")
# joint_tests(emm)
# pairs(emm)
# emm
# cld(emm)
# 
# ase<-summarySE(julyad, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
# ase
# ase$below<-c(0.20,0.02,0.01,0.11,0.00,0,0.00,0.32,0,0.02,0.00,0,0)
# ase
# ase$sig<-c("ab","b","b","ab","b",
#            "b","b","a","b","b",
#            "b","b","b")
# 
# 
# b<-ggplot(ase, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
#   geom_bar(stat="identity", color="black",fill="grey",
#            position=position_dodge())+
#   ylab("Plant Species") +
#   xlab("Log Feeding Bouts / Day /\nFloral Density")+
#   theme_bw()+
#   #scale_fill_brewer(palette="YlGnBu")+
#   scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
#   geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
#                 position=position_dodge(.8))+
#   geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         panel.background = element_blank(), axis.line = element_line(colour = "black"))+
#   theme(axis.title.x=element_blank())+
#   #theme(axis.text.x=element_blank())+
#   theme(axis.text.x = element_text(size=12))+
#   theme(axis.text.x=element_text(colour="black"))+
#   theme(axis.text.y = element_text(size=12))+
#   theme(axis.text.y=element_text(colour="black"))+
#   #scale_y_discrete(labels=label_wrap_gen(width=10))+
#   theme(plot.title=element_text(size=18))+
#   theme(axis.title = element_text(size = 14))+
#   #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
# ggtitle("a.")
# #theme(aspect.ratio = 4.5/10)
# #theme(legend.position = "bottom")+
# #guides(fill=guide_legend(title="Habitat Class"))+
# #theme(legend.text = element_text(size = 14))+
# #theme(legend.title = element_text(size = 14))+
# #theme(legend.box.background=element_rect(colour = "black"),
# #legend.background = element_blank())
# b
# 
# plot_grid(b1,a1,b,ncol=1,align="v")
# 
# plot_grid(raw, b, align = "v", nrow = 2, rel_heights = c(4/6,2/6))
# 
# 
# 
# julyadc<-read.csv("FeedByDay_July_withzeros_ad_color.csv", header=TRUE)
# names(julyadc)
# 
# colorad<-glm(logcolorcountabun~Color,data=julyadc,family = gaussian(link = "identity"))
# emm<-emmeans(colorad,c("Color"),type="response")
# joint_tests(emm)
# pairs(emm)
# emm
# cld(emm)
# 
# cse<-summarySE(julyadc, measurevar="logcolorcountabun", groupvars=c("Color"))
# cse
# cse$below<-c(0.2075728,0.01732886,0.007,0.000001851371,0.0003178416)
# cse
# cse$sig<-c("a","b","b","b","b")
# 
# c<-ggplot(cse, aes(y=reorder(Color,logcolorcountabun), x=logcolorcountabun, width=.8))+
#   geom_bar(stat="identity", color="black",fill="grey",
#            position=position_dodge())+
#   ylab("Color") +
#   xlab("Log Feeding Bouts / Day /\nFloral Density")+
#   theme_bw()+
#   #scale_fill_brewer(palette="YlGnBu")+
#   scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
#   geom_errorbar(aes(xmin=logcolorcountabun-below, xmax=logcolorcountabun+sd), width=.2, 
#                 position=position_dodge(.8))+
#   geom_text(aes(label=sig, x=(logcolorcountabun+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         panel.background = element_blank(), axis.line = element_line(colour = "black"))+
#   theme(axis.title.x=element_blank())+
#   #theme(axis.text.x=element_blank())+
#   theme(axis.text.x = element_text(size=12))+
#   theme(axis.text.x=element_text(colour="black"))+
#   theme(axis.text.y = element_text(size=12))+
#   theme(axis.text.y=element_text(colour="black"))+
#   #scale_y_discrete(labels=label_wrap_gen(width=10))+
#   theme(plot.title=element_text(size=18))+
#   theme(axis.title = element_text(size = 14))+
# #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
# ggtitle("b.")
# #theme(aspect.ratio = 4.5/10)
# #theme(legend.position = "bottom")+
# #guides(fill=guide_legend(title="Habitat Class"))+
# #theme(legend.text = element_text(size = 14))+
# #theme(legend.title = element_text(size = 14))+
# #theme(legend.box.background=element_rect(colour = "black"),
# #legend.background = element_blank())
# c
# #grid.arrange(a,b,c)
# 
# 
# 
# julyadr<-read.csv("FeedByDay_July_withzeros_ad_range.csv", header=TRUE)
# names(julyadr)
# 
# 
# nativead<-glm(lograngecountabun1~Range,data=julyadr,family = gaussian(link = "identity"))
# emm<-emmeans(nativead,c("Range"),type="response")
# joint_tests(emm)
# pairs(emm)
# emm
# cld(emm)
# 
# nse<-summarySE(julyadr, measurevar="lograngecountabun1", groupvars=c("Range"))
# nse
# nse$below<-c(0.00250956,0.0)
# nse
# nse$sig<-c("a","b")
# 
# d<-ggplot(nse, aes(y=reorder(Range, lograngecountabun1), x=lograngecountabun1, width=.8))+
#   geom_bar(stat="identity", color="black",fill="grey",
#            position=position_dodge())+
#   ylab("Range") +
#   xlab("Log Feeding Bouts / Day /\nFloral Density")+
#   theme_bw()+
#   #scale_fill_brewer(palette="YlGnBu")+
#   scale_x_continuous(expand=c(0,0), limits=c(0,0.017))+
#   geom_errorbar(aes(xmin=lograngecountabun1-below, xmax=lograngecountabun1+sd), width=.2, 
#                 position=position_dodge(.8))+
#   geom_text(aes(label=sig, x=(lograngecountabun1+sd+0.001)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         panel.background = element_blank(), axis.line = element_line(colour = "black"))+
#   theme(axis.text.x = element_text(size=12))+
#   theme(axis.text.x=element_text(colour="black"))+
#   theme(axis.text.y = element_text(size=12))+
#   theme(axis.text.y=element_text(colour="black"))+
#   #scale_y_discrete(labels=label_wrap_gen(width=10))+
#   theme(plot.title=element_text(size=18))+
#   theme(axis.title = element_text(size = 14))+
#   #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
#   ggtitle("c.")
# d
# 
# grid.arrange(b,c,d,ncol=1)
# plot_grid(b,c,d,ncol=1,align="v",hjust=-1)
# 
# 
# # shapead<-glm(LogCount~ClusterType,data=julyad,family = gaussian(link = "identity"))
# # emm<-emmeans(shapead,c("ClusterType"),type="response")
# # joint_tests(emm)
# # pairs(emm)
# # emm
# # cld(emm)
# # 
# # kse<-summarySE(julyad, measurevar="LogCount", groupvars=c("ClusterType"))
# # kse
# # kse$below<-c(0,0.02,0.03,0.13,0.06,0)
# # kse
# # kse$sig<-c("a","a","a","a","a","a")
# # 
# # e<-ggplot(kse, aes(x=ClusterType, y=LogCount, width=.8))+
# #   geom_bar(stat="identity", color="black",fill="grey",
# #            position=position_dodge())+
# #   xlab("Flower Cluster Shape") +
# #   ylab("Log Count")+
# #   theme_bw()+
# #   #scale_fill_brewer(palette="YlGnBu")+
# #   scale_y_continuous(expand=c(0,0), limits=c(0,1))+
# #   geom_errorbar(aes(ymin=LogCount-below, ymax=LogCount+sd), width=.2, 
# #                 position=position_dodge(.8))+
# #   geom_text(aes(label=sig, y=(LogCount+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
# #   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
# #         panel.background = element_blank(), axis.line = element_line(colour = "black"))+
# #   theme(axis.text.x = element_text(size=12))+
# #   theme(axis.text.x=element_text(colour="black"))+
# #   theme(axis.text.y = element_text(size=12))+
# #   theme(axis.text.y=element_text(colour="black"))+
# #   #scale_y_discrete(labels=label_wrap_gen(width=10))+
# #   theme(plot.title=element_text(size=18))+
# #   theme(axis.title = element_text(size = 14))+
# #   #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
# #   ggtitle("e.")
# # e
# # 
# # 
# # x<-grid.arrange(b,c,d,e,nrow=2)
# # grid.arrange(a,x)




setwd("C:/Users/kefisher/Box/Publications/Adult Monarch Feeding Behavior/Data Analysis/042022_glm")

##raw data july august all sites
interact<-read.csv("floralsurvey_julyaugust.csv", header=TRUE)
names(interact)

ggplot(interact,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="black") +
  theme_bw()+
  #facet_wrap(~Month,ncol=1)+
  #theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log Density")+
  theme(axis.title.y=element_text(angle=0))+
  #theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
   #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="bottom")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))



a<-ggplot(interact, aes(x=reorder (PlantSpecies,Order2), y=Count, fill=Site2,width=.8))+
  geom_bar(position="stack",stat="identity")+
  #geom_point(data=interact, aes(y=Monarchs, x=reorder (PlantSpecies,-Order2)), size=2, color='black')+
  #geom_line(data=interact, aes(y=Monarchs, x=reorder (PlantSpecies,-Order2)), color='black',size=0.5,group=1,na.rm=TRUE)+
  ylab("Total\nFeeding Bouts") +
  #xlab("# Observed Feeding Bouts")+
  theme_bw()+
  scale_fill_brewer(palette="Dark2")+
  xlab("Plant Species Common Name") +
  scale_y_continuous(expand=c(0,0), limits=c(0,150.5))+
  #scale_y_continuous(name='Total Observed Feeding Bouts',
  #                  sec.axis=sec_axis(~., name="Unique Monarchs Observed Feeding"),
  #                 expand=c(0,0), limits=c(0,132))+
  geom_text(aes(label=sig, y=(sum+5)),colour="black",vjust=0.3, hjust=0.5,size=4, position=position_dodge(0),fontface="plain")+
  #geom_text(aes(label=sigexit, y=(count+2)),colour="deepskyblue3",vjust=-1.5, size=5, position=position_dodge(.8),fontface="italic")+
  #geom_text(aes(label=sigenter, y=(count+2)),colour="darkslategray",vjust=-1.5, size=5, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #theme(axis.title.y=element_text(angle=0))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(legend.position="null")
  ggtitle("a.")
#theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
a

names(interact)
site1<-subset(interact,Site2=="Site 1")
site2<-subset(interact,Site2=="Site 2")
site3<-subset(interact,Site2=="Site 3")
site4<-subset(interact,Site2=="Site 4")
site5<-subset(interact,Site2=="Site 5")
site6<-subset(interact,Site2=="Site 6")

s1<-ggplot(site1,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#1b9e77") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log Density")+
  theme(axis.title.y=element_text(angle=0))+
  theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
  ggtitle("b.")
 # theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

s1

s2<-ggplot(site2,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#d95f02") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log Density")+
  theme(axis.title.y=element_text(angle=0))+
  theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s2

s3<-ggplot(site3,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#7570b3") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Density\n ")+
  #theme(axis.title.y=element_text(angle=0))+
  #theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s3

s4<-ggplot(site4,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#e7298a") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log\n ")+
  #theme(axis.title.y=element_text(angle=0))+
  #theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s4

s5<-ggplot(site5,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#66a61e") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log Density")+
  theme(axis.title.y=element_text(angle=0))+
  theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s5

s6<-ggplot(site6,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#e6ab02") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log Density")+
  theme(axis.title.y=element_text(angle=0))+
  theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))+
 theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s6


plot_grid(s1,s2,s3,s4,s5,s6,ncol=1,align="v")
# heat<-plot_grid(s1,s2,s3,s4,s5,s6, align = "v", ncol = 1, rel_heights = c(0.7/8,0.5/8,0.5/8,0.5/8,0.5/8,1.8/8))
# heat
# plot_grid(a,heat, ncol=1,rel_heights=c(1/3,2/3))

plot_grid(a,s1,s2,s3,s4,s5,s6, align = "v", ncol = 1, rel_heights = c(2.5/8,0.5/8,0.5/8,0.5/8,0.5/8,0.5/8,1.9/8))



chisq.test(c(0,0.17,0.35,0.53,0.71,1.78,2.67,3.03,4.46,5.53,7.32,11.60,15.71,16.60,24.46))

chisq.test(c(0,0.17))
chisq.test(c(0,0.35))
chisq.test(c(0,0.53))
chisq.test(c(0,0.71))
chisq.test(c(0,1.78))
chisq.test(c(0,2.67))
chisq.test(c(0,3.03))
chisq.test(c(0,4.46))
chisq.test(c(0,5.53))
chisq.test(c(0,7.32))
chisq.test(c(0,11.60))
chisq.test(c(0,15.71))
#chisq.test(c(0,16.60))
#chisq.test(c(0,24.46))

chisq.test(c(0.17,0.35))
chisq.test(c(0.17,0.53))
chisq.test(c(0.17,0.71))
chisq.test(c(0.17,1.78))
chisq.test(c(0.17,2.67))
chisq.test(c(0.17,3.03))
chisq.test(c(0.17,4.46))
chisq.test(c(0.17,5.53))
chisq.test(c(0.17,7.32))
chisq.test(c(0.17,11.60))
chisq.test(c(0.17,15.71))
#chisq.test(c(0.17,16.60))
#chisq.test(c(0.17,24.46))

chisq.test(c(0.35,0.53))
chisq.test(c(0.35,0.71))
chisq.test(c(0.35,1.78))
chisq.test(c(0.35,2.67))
chisq.test(c(0.35,3.03))
chisq.test(c(0.35,4.46))
chisq.test(c(0.35,5.53))
chisq.test(c(0.35,7.32))
chisq.test(c(0.35,11.60))
chisq.test(c(0.35,15.71))
#chisq.test(c(0.35,16.60))
#chisq.test(c(0.35,24.46))

chisq.test(c(0.53,0.71))
chisq.test(c(0.53,1.78))
chisq.test(c(0.53,2.67))
chisq.test(c(0.53,3.03))
chisq.test(c(0.53,4.46))
chisq.test(c(0.53,5.53))
chisq.test(c(0.53,7.32))
chisq.test(c(0.53,11.60))
chisq.test(c(0.53,15.71))
#chisq.test(c(0.53,16.60))
#chisq.test(c(0.53,24.46))

chisq.test(c(0.71,1.78))
chisq.test(c(0.71,2.67))
chisq.test(c(0.71,3.03))
chisq.test(c(0.71,4.46))
chisq.test(c(0.71,5.53))
chisq.test(c(0.71,7.32))
chisq.test(c(0.71,11.60))
chisq.test(c(0.71,15.71))
#chisq.test(c(0.71,16.60))
#chisq.test(c(0.71,24.46))

chisq.test(c(1.78,2.67))
chisq.test(c(1.78,3.03))
chisq.test(c(1.78,4.46))
chisq.test(c(1.78,5.53))
chisq.test(c(1.78,7.32))
chisq.test(c(1.78,11.60))
chisq.test(c(1.78,15.71))
chisq.test(c(1.78,16.60))
chisq.test(c(1.78,24.46))

chisq.test(c(2.67,3.03))
chisq.test(c(2.67,4.46))
chisq.test(c(2.67,5.53))
chisq.test(c(2.67,7.32))
chisq.test(c(2.67,11.60))
chisq.test(c(2.67,15.71))
chisq.test(c(2.67,16.60))
chisq.test(c(2.67,24.46))

chisq.test(c(3.03,4.46))
chisq.test(c(3.03,5.53))
chisq.test(c(3.03,7.32))
chisq.test(c(3.03,11.60))
chisq.test(c(3.03,15.71))
chisq.test(c(3.03,16.60))
chisq.test(c(3.03,24.46))

chisq.test(c(4.46,5.53))
chisq.test(c(4.46,7.32))
chisq.test(c(4.46,11.60))
chisq.test(c(4.46,15.71))
chisq.test(c(4.46,16.60))
#chisq.test(c(4.46,24.46))

chisq.test(c(5.53,7.32))
chisq.test(c(5.53,11.60))
chisq.test(c(5.53,15.71))
chisq.test(c(5.53,16.60))
chisq.test(c(5.53,24.46))

chisq.test(c(7.32,11.60))
chisq.test(c(7.32,15.71))
chisq.test(c(7.32,16.60))
chisq.test(c(7.32,24.46))

chisq.test(c(11.60,15.71))
chisq.test(c(11.60,16.60))
chisq.test(c(11.60,24.46))

chisq.test(c(15.71,16.60))
chisq.test(c(15.71,24.46))

chisq.test(c(16.60,24.46))

0.05/105

chisq.test(c(67.4,32.6))

library(cowplot)
raw<-plot_grid(b1,a1,ncol=1,align="v")
raw


setwd("C:/Users/kefisher/Box/Publications/Adult Monarch Feeding Behavior/Data Analysis/042022_glm")


#all by abundance, color, and range
july<-read.csv("FeedByDay_julyaugust.csv", header=TRUE)
names(july)
head(july)

speciesad<-glm(logabuncount1~PlantSpecies+Site,data=july,family = gaussian(link = "identity"))
emm<-emmeans(speciesad,c("Site"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)


july1<-subset(july,Site2=='Site 1')
july2<-subset(july,Site2=='Site 2')
july3<-subset(july,Site2=='Site 3')
july4<-subset(july,Site2=='Site 4')
july5<-subset(july,Site2=='Site 5')
july6<-subset(july,Site2=='Site 6')


adabun1<-glm(logabuncount1~PlantSpecies,data=july1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(july1, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase1
ase1$below<-c(0.554,0,0,0.005,0.403,0,0,0,0.012,0.045)
ase1
ase1$sig<-c("ab","b","b","b","a",
           "b","b","b","b","b")

a<-ggplot(ase1, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #scale_y_discrete(labels=function(y) str_wrap(y,width=14))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("Site 1")
a


adabun2<-glm(logabuncount1~PlantSpecies,data=july2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(july2, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase2
ase2$below<-c(0,0.200,0.003,0.100,0,0,0,0,0,0)
ase2
ase2$sig<-c("a","a","a","a","a",
           "a","a","a","a","a")

b<-ggplot(ase2, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
 #scale_y_discrete(labels=function(y) str_wrap(y,width=14))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("Site 2")
b


adabun3<-glm(logabuncount1~PlantSpecies,data=july3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(july3, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase3
ase3$below<-c(0,0.202,0,0,0.079,0,0,0.050,0,0,0.048,0.010,0,0.001,0,0,0,0.012,0)
ase3
ase3$sig<-c("b","a","b","b","b",
           "b","b","b","b","b",
           "b","b","b","b","b",
           "b","b","b","b")

c<-ggplot(ase3, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #scale_y_discrete(labels=function(y) str_wrap(y,width=14))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("Site 3")
c


adabun4<-glm(logabuncount1~PlantSpecies,data=july4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(july4, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase4
ase4$below<-c(0,0.658,0.050,0.230,0,0,0.024,0.036,0,0.003,0.079,0,0.011)
ase4
ase4$sig<-c("b","a","b","b","b",
           "b","b","b","b","b",
           "b","b","b")

d<-ggplot(ase4, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #scale_y_discrete(labels=function(y) str_wrap(y,width=14))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("Site 4")
d


adabun5<-glm(logabuncount1~PlantSpecies,data=july5,family = gaussian(link = "identity"))
emm<-emmeans(adabun5,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase5<-summarySE(july5, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase5
ase5$below<-c(0.015,0,0.097,0.089,0,0,0,0.039,0,0,0.07,0,0.02,0.025,0,0,0.067,0,0.15,0,0.07,0.008,0,0.078)
ase5
#ase$sig<-c("ab","b","b","ab","b",
           #"b","b","a","b","b",
           #"b","b","b")


e<-ggplot(ase5, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#66a61e",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #scale_y_discrete(labels=function(y) str_wrap(y,width=14))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("Site 5")
e


adabun6<-glm(logabuncount1~PlantSpecies,data=july6,family = gaussian(link = "identity"))
emm<-emmeans(adabun6,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase6<-summarySE(july6, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase6
ase6$below<-c(0.207,0.027,0.017,0.114,0.0003,0,0.004,0.327,0,0.027,0,0,0)
ase6
ase6$sig<-c("ab","b","b","ab","b",
            "b","b","a","b","b",
            "b","b","b")

install.packages("stringr")
library(stringr)
f<-ggplot(ase6, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e6ab02",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #scale_y_discrete(labels=function(y) str_wrap(y,width=14))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("Site 6")
f


grid.arrange(a,b,c,d,e,f, nrow=2)

#all in one graph
july<-read.csv("FeedByDay_julyaugust.csv", header=TRUE)
names(july)
head(july)

adabun1<-glm(logabuncount1~PlantSpecies+Site,data=july,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)
emm2<-emmeans(adabun1,c("Site"),type="response")
joint_tests(emm2)
pairs(emm2)
emm2
cld(emm2)



#color
#all by abundance, color, and range
july<-read.csv("FeedByDay_julyaugust_color.csv", header=TRUE)
names(july)
head(july)

speciesad<-glm(logcolorabun1~Color+Site,data=july,family = gaussian(link = "identity"))
emm<-emmeans(speciesad,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

july1<-subset(july,Site2=='Site 1')
july2<-subset(july,Site2=='Site 2')
july3<-subset(july,Site2=='Site 3')
july4<-subset(july,Site2=='Site 4')
july5<-subset(july,Site2=='Site 5')
july6<-subset(july,Site2=='Site 6')


adabun1<-glm(logcolorabun1~Color,data=july1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(july1, measurevar="logcolorabun1", groupvars=c("Color"))
ase1
ase1$below<-c(0.323,0.088,0.007,0.0008)
ase1
#ase1$sig<-c("ab","b","b","b","a",
 #           "b","b","b","b","b")

a<-ggplot(ase1, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


adabun2<-glm(logcolorabun1~Color,data=july2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(july2, measurevar="logcolorabun1", groupvars=c("Color"))
ase2
ase2$below<-c(0.200,0.100,0.0006,0,0.0005)
ase2
#ase2$sig<-c("a","a","a","a","a",
 #           "a","a","a","a","a")

b<-ggplot(ase2, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("b.")
b


adabun3<-glm(logcolorabun1~Color,data=july3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(july3, measurevar="logcolorabun1", groupvars=c("Color"))
ase3
ase3$below<-c(0.202,0,0.005,0.001,0.006)
ase3
ase3$sig<-c("a","b","b","b","b")

c<-ggplot(ase3, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(logcolorabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("c.")
c


adabun4<-glm(logcolorabun1~Color,data=july4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(july4, measurevar="logcolorabun1", groupvars=c("Color"))
ase4
ase4$below<-c(0.050,0.230,0.121,0,0.0006)
ase4
#ase4$sig<-c("b","a","b","b","b",
#            "b","b","b","b","b",
 #           "b","b","b")

d<-ggplot(ase4, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("d.")
d


adabun5<-glm(logcolorabun1~Color,data=july5,family = gaussian(link = "identity"))
emm<-emmeans(adabun5,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase5<-summarySE(july5, measurevar="logcolorabun1", groupvars=c("Color"))
ase5
ase5$below<-c(0.089,0.033,0.007,0.012,0.002)
ase5
#ase$sig<-c("ab","b","b","ab","b",
#"b","b","a","b","b",
#"b","b","b")


e<-ggplot(ase5, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#66a61e",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("e.")
e


adabun6<-glm(logcolorabun1~Color,data=july6,family = gaussian(link = "identity"))
emm<-emmeans(adabun6,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase6<-summarySE(july6, measurevar="logcolorabun1", groupvars=c("Color"))
ase6
ase6$below<-c(0.207,0.013,0.007,0,0.0003)
ase6
ase6$sig<-c("a","b","b","b","b")


f<-ggplot(ase6, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e6ab02",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(logcolorabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("f.")
f


grid.arrange(a,b,c,d,e,f)


#color in one graph

july<-read.csv("FeedByDay_julyaugust_color.csv", header=TRUE)
names(july)
head(july)

adabun1<-glm(logcolorabun1~Color+Site,data=july,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)
emm2<-emmeans(adabun1,c("Site"),type="response")
joint_tests(emm2)
pairs(emm2)
emm2
cld(emm2)

ase1<-summarySE(july, measurevar="logcolorabun1", groupvars=c("Color"))
ase1
ase1$below<-c(0.14,0.07,0.03,0.004,0.002)
ase1
ase1$sig<-c("a","ab","b","b","b")

a<-ggplot(ase1, aes(x=Color, y=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="grey",
           position=position_dodge())+
  xlab("Floral Color") +
  ylab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_y_continuous(expand=c(0,0), limits=c(0,0.55))+
  geom_errorbar(aes(ymin=logcolorabun1-below, ymax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, y=(logcolorabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a





#range
#all by abundance, color, and range
july<-read.csv("FeedByDay_julyaugust_range.csv", header=TRUE)
names(july)
head(july)

july1<-subset(july,Site2=='Site 1')
july2<-subset(july,Site2=='Site 2')
july3<-subset(july,Site2=='Site 3')
july4<-subset(july,Site2=='Site 4')
july5<-subset(july,Site2=='Site 5')
july6<-subset(july,Site2=='Site 6')


adabun1<-glm(lograngeabun1~Range,data=july1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(july1, measurevar="lograngeabun1", groupvars=c("Range"))
ase1
ase1$below<-c(0.001,0)
ase1
ase1$sig<-c("a","b")

a<-ggplot(ase1, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(lograngeabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


adabun2<-glm(lograngeabun1~Range,data=july2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(july2, measurevar="lograngeabun1", groupvars=c("Range"))
ase2
ase2$below<-c(0.0006,0.001)
ase2
#ase2$sig<-c("a","a","a","a","a",
#           "a","a","a","a","a")

b<-ggplot(ase2, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("b.")
b


adabun3<-glm(lograngeabun1~Range,data=july3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(july3, measurevar="lograngeabun1", groupvars=c("Range"))
ase3
ase3$below<-c(0.008,0)
ase3
ase3$sig<-c("a","b")

c<-ggplot(ase3, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(lograngeabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("c.")
c


adabun4<-glm(lograngeabun1~Range,data=july4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(july4, measurevar="lograngeabun1", groupvars=c("Range"))
ase4
ase4$below<-c(0.002,0.658)
ase4
ase4$sig<-c("b","a")

d<-ggplot(ase4, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(lograngeabun1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("d.")
d


adabun5<-glm(lograngeabun1~Range,data=july5,family = gaussian(link = "identity"))
emm<-emmeans(adabun5,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase5<-summarySE(july5, measurevar="lograngeabun1", groupvars=c("Range"))
ase5
ase5$below<-c(0.007,0.01)
ase5
#ase$sig<-c("ab","b","b","ab","b",
#"b","b","a","b","b",
#"b","b","b")


e<-ggplot(ase5, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#66a61e",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("e.")
e


adabun6<-glm(lograngeabun1~Range,data=july6,family = gaussian(link = "identity"))
emm<-emmeans(adabun6,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase6<-summarySE(july6, measurevar="lograngeabun1", groupvars=c("Range"))
ase6
ase6$below<-c(0.002,0)
ase6
ase6$sig<-c("a","b")


f<-ggplot(ase6, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e6ab02",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(lograngeabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("f.")
f


grid.arrange(a,b,c,d,e,f)

#all range in one graph
july<-read.csv("FeedByDay_julyaugust_range.csv", header=TRUE)
names(july)
head(july)


adabun1<-glm(lograngeabun1~Range+Site,data=july,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)
emm2<-emmeans(adabun1,c("Site"),type="response")
joint_tests(emm2)
pairs(emm2)
emm2
cld(emm2)

ase1<-summarySE(july1, measurevar="lograngeabun1", groupvars=c("Range"))
ase1
ase1$below<-c(0.001,0)
ase1
ase1$sig<-c("a","b")

a<-ggplot(ase1, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  geom_text(aes(label=sig, x=(lograngeabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


##June
setwd("C:/Users/kefisher/Box/Publications/Adult Monarch Feeding Behavior/Data Analysis/042022_glm")

##raw data july august all sites
interact<-read.csv("floralsurvey_june.csv", header=TRUE)
names(interact)

a<-ggplot(interact, aes(x=reorder (PlantSpecies,Order2), y=Count, fill=Site2,width=.8))+
  geom_bar(position="stack",stat="identity")+
  #geom_point(data=interact, aes(y=Monarchs, x=reorder (PlantSpecies,-Order2)), size=2, color='black')+
  #geom_line(data=interact, aes(y=Monarchs, x=reorder (PlantSpecies,-Order2)), color='black',size=0.5,group=1,na.rm=TRUE)+
  ylab("Total\nFeeding Bouts") +
  #xlab("# Observed Feeding Bouts")+
  theme_bw()+
  scale_fill_brewer(palette="Dark2")+
  xlab("Plant Species Common Name") +
  scale_y_continuous(expand=c(0,0), limits=c(0,15.5))+
  #scale_y_continuous(name='Total Observed Feeding Bouts',
  #                  sec.axis=sec_axis(~., name="Unique Monarchs Observed Feeding"),
  #                 expand=c(0,0), limits=c(0,132))+
  geom_text(aes(label=sig, y=(sum+1)),colour="black",vjust=0.3, hjust=0.5,size=4, position=position_dodge(0),fontface="plain")+
  #geom_text(aes(label=sigexit, y=(count+2)),colour="deepskyblue3",vjust=-1.5, size=5, position=position_dodge(.8),fontface="italic")+
  #geom_text(aes(label=sigenter, y=(count+2)),colour="darkslategray",vjust=-1.5, size=5, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #theme(axis.title.y=element_text(angle=0))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(legend.position="null")
  ggtitle("a.")
#theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
a

names(interact)
site1<-subset(interact,Site2=="Site 1")
site2<-subset(interact,Site2=="Site 2")
site3<-subset(interact,Site2=="Site 3")
site4<-subset(interact,Site2=="Site 4")


s1<-ggplot(site1,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#1b9e77") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log Density")+
  theme(axis.title.y=element_text(angle=0))+
  theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
  ggtitle("b.")
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

s1

s2<-ggplot(site2,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#d95f02") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Density\n ")+
  #theme(axis.title.y=element_text(angle=0))+
  #theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s2

s3<-ggplot(site3,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#7570b3") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log\n ")+
  #theme(axis.title.y=element_text(angle=0))+
  #theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s3

s4<-ggplot(site4,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#e7298a") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log\n ")+
  theme(axis.title.y=element_text(angle=0))+
  theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s4


plot_grid(s1,s2,s3,s4,ncol=1,align="v")
# heat<-plot_grid(s1,s2,s3,s4,s5,s6, align = "v", ncol = 1, rel_heights = c(0.7/8,0.5/8,0.5/8,0.5/8,0.5/8,1.8/8))
# heat
# plot_grid(a,heat, ncol=1,rel_heights=c(1/3,2/3))

plot_grid(a,s1,s2,s3,s4, align = "v", ncol = 1, rel_heights = c(2.5/8,0.5/8,0.5/8,0.5/8,1.85/8))


chisq.test(c(43.3,20,10,6.67,0))

chisq.test(c(43.3,20))
chisq.test(c(43.3,10))
chisq.test(c(43.3,6.67))
chisq.test(c(43.3,0))

chisq.test(c(20,10))
chisq.test(c(20,6.67))
chisq.test(c(20,0))

chisq.test(c(10,6.67))
chisq.test(c(10,0))

chisq.test(c(0,6.67))

0.05/10


#june by abundance, color, and range
june<-read.csv("FeedByDay_june.csv", header=TRUE)
names(june)
head(june)

adabun1<-glm(logabuncount1~Site+PlantSpecies,data=june,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)


june1<-subset(june,Site2=='Site 1')
june2<-subset(june,Site2=='Site 2')
june3<-subset(june,Site2=='Site 3')
june4<-subset(june,Site2=='Site 4')
june5<-subset(june,Site2=='Site 5')
june6<-subset(june,Site2=='Site 6')


adabun1<-glm(logabuncount1~PlantSpecies,data=june1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(june1, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase1
#ase1$below<-c(0.554,0,0,0.005,0.403,0,0,0,0.012,0.045)
#ase1
#ase1$sig<-c("ab","b","b","b","a",
#            "b","b","b","b","b")

a<-ggplot(ase1, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
   #             position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


adabun2<-glm(logabuncount1~PlantSpecies,data=june2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(june2, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase2
#ase2$below<-c(0,0.200,0.003,0.100,0,0,0,0,0,0)
#ase2
#ase2$sig<-c("a","a","a","a","a",
#            "a","a","a","a","a")

b<-ggplot(ase2, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
   #             position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("b.")
b


adabun3<-glm(logabuncount1~PlantSpecies,data=june3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(june3, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase3
ase3$below<-c(0.28,0.15,0,0,0.003,0,0)
ase3
#ase3$sig<-c("b","a","b","b","b",
#            "b","b","b","b","b",
 #           "b","b","b","b","b",
  #          "b","b","b","b")

c<-ggplot(ase3, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("c.")
c


adabun4<-glm(logabuncount1~PlantSpecies,data=june4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(june4, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase4
ase4$below<-c(0.38,0,0.004,0,0,0)
ase4
#ase4$sig<-c("b","a","b","b","b",
 #           "b","b","b","b","b",
  #          "b","b","b")

d<-ggplot(ase4, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("d.")
d


grid.arrange(a,b,c,d)




#color
#all by abundance, color, and range
june<-read.csv("FeedByDay_june_color2.csv", header=TRUE)
names(june)
head(june)

adabun1<-glm(logabuncount1~Site+Color,data=june,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Site"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)



june1<-subset(june,Site2=='Site 1')
june2<-subset(june,Site2=='Site 2')
june3<-subset(june,Site2=='Site 3')
june4<-subset(june,Site2=='Site 4')


adabun1<-glm(logcolorabun1~Color,data=june1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(june1, measurevar="logcolorabun1", groupvars=c("Color"))
ase1
#ase1$below<-c(0.323,0.088,0.007,0.0008)
#ase1
#ase1$sig<-c("ab","b","b","b","a",
#           "b","b","b","b","b")

a<-ggplot(ase1, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  #geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
   #             position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


adabun2<-glm(logcolorabun1~Color,data=june2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(june2, measurevar="logcolorabun1", groupvars=c("Color"))
ase2
#ase2$below<-c(0.200,0.100,0.0006,0,0.0005)
#ase2
#ase2$sig<-c("a","a","a","a","a",
#           "a","a","a","a","a")

b<-ggplot(ase2, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
 # geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
  #              position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("b.")
b


adabun3<-glm(logcolorabun1~Color,data=june3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(june3, measurevar="logcolorabun1", groupvars=c("Color"))
ase3
ase3$below<-c(0.28,0.15,0.003,0,0)
ase3
#ase3$sig<-c("a","b","b","b","b")

c<-ggplot(ase3, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logcolorabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("c.")
c


adabun4<-glm(logcolorabun1~Color,data=june4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(june4, measurevar="logcolorabun1", groupvars=c("Color"))
ase4
ase4$below<-c(0,0.38,0.003,0)
ase4
#ase4$sig<-c("b","a","b","b","b",
#            "b","b","b","b","b",
#           "b","b","b")

d<-ggplot(ase4, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("d.")
d

grid.arrange(a,b,c,d)



#range
june<-read.csv("FeedByDay_june_range.csv", header=TRUE)
names(june)
head(june)

adabun1<-glm(lograngeabun1~Site+Range,data=june,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

june1<-subset(june,Site2=='Site 1')
june2<-subset(june,Site2=='Site 2')
june3<-subset(june,Site2=='Site 3')
june4<-subset(june,Site2=='Site 4')


adabun1<-glm(lograngeabun1~Range,data=june1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(june1, measurevar="lograngeabun1", groupvars=c("Range"))
ase1
#ase1$below<-c(0.001,0)
#ase1
#ase1$sig<-c("a","b")

a<-ggplot(ase1, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
   #             position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(lograngeabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


adabun2<-glm(lograngeabun1~Range,data=june2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(june2, measurevar="lograngeabun1", groupvars=c("Range"))
ase2
#ase2$below<-c(0.0006,0.001)
#ase2
#ase2$sig<-c("a","a","a","a","a",
#           "a","a","a","a","a")

b<-ggplot(ase2, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
   #             position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("b.")
b


adabun3<-glm(lograngeabun1~Range,data=june3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(june3, measurevar="lograngeabun1", groupvars=c("Range"))
ase3
ase3$below<-c(0.01,0.003)
ase3
#ase3$sig<-c("a","b")

c<-ggplot(ase3, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(lograngeabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("c.")
c


adabun4<-glm(lograngeabun1~Range,data=june4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(june4, measurevar="lograngeabun1", groupvars=c("Range"))
ase4
ase4$below<-c(0.003,0.013)
ase4
#ase4$sig<-c("b","a")

d<-ggplot(ase4, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
 # geom_text(aes(label=sig, x=(lograngeabun1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("d.")
d


grid.arrange(a,b,c,d)





##############September
setwd("C:/Users/kefisher/Box/Publications/Adult Monarch Feeding Behavior/Data Analysis/042022_glm")

##raw data july august all sites
interact<-read.csv("floralsurvey_september.csv", header=TRUE)
names(interact)

a<-ggplot(interact, aes(x=reorder (PlantSpecies,Order2), y=Count, fill=Site2,width=.8))+
  geom_bar(position="stack",stat="identity")+
  #geom_point(data=interact, aes(y=Monarchs, x=reorder (PlantSpecies,-Order2)), size=2, color='black')+
  #geom_line(data=interact, aes(y=Monarchs, x=reorder (PlantSpecies,-Order2)), color='black',size=0.5,group=1,na.rm=TRUE)+
  ylab("Total\nFeeding Bouts") +
  #xlab("# Observed Feeding Bouts")+
  theme_bw()+
  scale_fill_brewer(palette="Dark2")+
  xlab("Plant Species Common Name") +
  scale_y_continuous(expand=c(0,0), limits=c(0,150))+
  #scale_y_continuous(name='Total Observed Feeding Bouts',
  #                  sec.axis=sec_axis(~., name="Unique Monarchs Observed Feeding"),
  #                 expand=c(0,0), limits=c(0,132))+
  geom_text(aes(label=sig, y=(sum+5)),colour="black",vjust=0.3, hjust=0.5,size=4, position=position_dodge(0),fontface="plain")+
  #geom_text(aes(label=sigexit, y=(count+2)),colour="deepskyblue3",vjust=-1.5, size=5, position=position_dodge(.8),fontface="italic")+
  #geom_text(aes(label=sigenter, y=(count+2)),colour="darkslategray",vjust=-1.5, size=5, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #theme(axis.title.y=element_text(angle=0))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(legend.position="null")
  ggtitle("a.")
#theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
a

names(interact)
site1<-subset(interact,Site2=="Site 1")
site2<-subset(interact,Site2=="Site 2")
site3<-subset(interact,Site2=="Site 3")
site4<-subset(interact,Site2=="Site 4")


s1<-ggplot(site1,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#1b9e77") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log Density")+
  theme(axis.title.y=element_text(angle=0))+
  theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
  ggtitle("b.")
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

s1

s2<-ggplot(site2,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#d95f02") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Density\n ")+
  #theme(axis.title.y=element_text(angle=0))+
  #theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s2

s3<-ggplot(site3,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#7570b3") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log\n ")+
  #theme(axis.title.y=element_text(angle=0))+
  #theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x=element_blank())+
  theme(axis.text.x=element_blank())+
  #theme(axis.text.x = element_text(size=12))+
  #theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))
# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s3

s4<-ggplot(site4,aes(x=reorder(PlantSpecies,Order2), Site2, fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="grey", high="#e7298a") +
  #facet_wrap(~Month,ncol=1)+
  theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Log\n ")+
  theme(axis.title.y=element_text(angle=0))+
  theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
  #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log # Blooms/100 m")+
  theme(legend.direction = "horizontal")+
  theme(legend.position="null")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
s4


plot_grid(s1,s2,s3,s4,ncol=1,align="v")
# heat<-plot_grid(s1,s2,s3,s4,s5,s6, align = "v", ncol = 1, rel_heights = c(0.7/8,0.5/8,0.5/8,0.5/8,0.5/8,1.8/8))
# heat
# plot_grid(a,heat, ncol=1,rel_heights=c(1/3,2/3))

plot_grid(a,s1,s2,s3,s4, align = "v", ncol = 1, rel_heights = c(2.5/8,0.5/8,0.5/8,0.5/8,1.85/8))



chisq.test(c(41.0,24.2,13.5,12.9,2.6,2.3,1.6,1.0,0.3,0))

#chisq.test(c(41.0,24.2))
chisq.test(c(41.0,13.5))
chisq.test(c(41.0,12.9))
chisq.test(c(41.0,2.6))
chisq.test(c(41.0,2.3))
chisq.test(c(41.0,1.6))
chisq.test(c(41.0,1.0))
chisq.test(c(41.0,0.3))
chisq.test(c(41.0,0))

#chisq.test(c(24.2,13.5))
#chisq.test(c(24.2,12.9))
chisq.test(c(24.2,2.6))
chisq.test(c(24.2,2.3))
chisq.test(c(24.2,1.6))
chisq.test(c(24.2,1.0))
chisq.test(c(24.2,0.3))
chisq.test(c(24.2,0))

#chisq.test(c(13.5,12.9))
#chisq.test(c(13.5,2.6))
#chisq.test(c(13.5,2.3))
#chisq.test(c(13.5,1.6))
#chisq.test(c(13.5,1.0))
chisq.test(c(13.5,0.3))
chisq.test(c(13.5,0))

#chisq.test(c(12.9,2.6))
#chisq.test(c(12.9,2.3))
#chisq.test(c(12.9,1.6))
#chisq.test(c(12.9,1.0))
chisq.test(c(12.9,0.3))
chisq.test(c(12.9,0))

#chisq.test(c(2.6,2.3))
#chisq.test(c(2.6,1.6))
#chisq.test(c(2.6,1.0))
#chisq.test(c(2.6,0.3))
# #chisq.test(c(2.6,0))
# 
# chisq.test(c(2.3,1.6))
# chisq.test(c(2.3,1.0))
# chisq.test(c(2.3,0.3))
# chisq.test(c(2.3,0))
# 
# chisq.test(c(1.6,1.0))
# chisq.test(c(1.6,0.3))
# chisq.test(c(1.6,0))
# 
# chisq.test(c(1.0,0.3))
# chisq.test(c(1.0,0))
# 
# chisq.test(c(0.3,0))


0.05/45


#sept by abundance, color, and range
sept<-read.csv("FeedByDay_september.csv", header=TRUE)
names(sept)
head(sept)

adabun1<-glm(logabuncount1~Site+PlantSpecies,data=sept,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)


sept1<-subset(sept,Site2=='Site 1')
sept2<-subset(sept,Site2=='Site 2')
sept3<-subset(sept,Site2=='Site 3')
sept4<-subset(sept,Site2=='Site 4')


adabun1<-glm(logabuncount1~PlantSpecies,data=sept1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(sept1, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase1
#ase1$below<-c(0.554,0,0,0.005,0.403,0,0,0,0.012,0.045)
#ase1
#ase1$sig<-c("ab","b","b","b","a",
#            "b","b","b","b","b")

a<-ggplot(ase1, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
  #             position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


adabun2<-glm(logabuncount1~PlantSpecies,data=sept2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(sept2, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase2
ase2$below<-c(0.004,0,0,0.001,0,0.0003,0.003,0.01,0,0.13,0.01,0.005)
ase2
#ase2$sig<-c("a","a","a","a","a",
#            "a","a","a","a","a")

b<-ggplot(ase2, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
               position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("b.")
b


adabun3<-glm(logabuncount1~PlantSpecies,data=sept3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(sept3, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase3
ase3$below<-c(0,0,0,0.02,0.0005,0,0.15,0.12)
ase3
#ase3$sig<-c("b","a","b","b","b",
#            "b","b","b","b","b",
#           "b","b","b","b","b",
#          "b","b","b","b")

c<-ggplot(ase3, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("c.")
c


adabun4<-glm(logabuncount1~PlantSpecies,data=sept4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("PlantSpecies"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(sept4, measurevar="logabuncount1", groupvars=c("PlantSpecies","Order2"))
ase4
ase4$below<-c(0,0,0,0,0,0.0009,0)
ase4
#ase4$sig<-c("b","a","b","b","b",
#           "b","b","b","b","b",
#          "b","b","b")

d<-ggplot(ase4, aes(y=reorder(PlantSpecies,-Order2), x=logabuncount1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Plant Species") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=logabuncount1-below, xmax=logabuncount1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("d.")
d


grid.arrange(a,b,c,d)




#color
#all by abundance, color, and range
sept<-read.csv("FeedByDay_september_color.csv", header=TRUE)
names(sept)
head(sept)

adabun1<-glm(logcolorabun1~Site+Color,data=sept,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

sept1<-subset(sept,Site2=='Site 1')
sept2<-subset(sept,Site2=='Site 2')
sept3<-subset(sept,Site2=='Site 3')
sept4<-subset(sept,Site2=='Site 4')


adabun1<-glm(logcolorabun1~Color,data=sept1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(sept1, measurevar="logcolorabun1", groupvars=c("Color"))
ase1
#ase1$below<-c(0.323,0.088,0.007,0.0008)
#ase1
#ase1$sig<-c("ab","b","b","b","a",
#           "b","b","b","b","b")

a<-ggplot(ase1, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  #geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
  #             position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


adabun2<-glm(logcolorabun1~Color,data=sept2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(sept2, measurevar="logcolorabun1", groupvars=c("Color"))
ase2
ase2$below<-c(0.003,0.01,0.006)
#ase2
#ase2$sig<-c("a","a","a","a","a",
#           "a","a","a","a","a")

b<-ggplot(ase2, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
   geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("b.")
b


adabun3<-glm(logcolorabun1~Color,data=sept3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(sept3, measurevar="logcolorabun1", groupvars=c("Color"))
ase3
ase3$below<-c(0.12,0.026,0.0003)
ase3
#ase3$sig<-c("a","b","b","b","b")

c<-ggplot(ase3, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logcolorabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("c.")
c


adabun4<-glm(logcolorabun1~Color,data=sept4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("Color"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(sept4, measurevar="logcolorabun1", groupvars=c("Color"))
ase4
ase4$below<-c(0,0.0007,0)
ase4
#ase4$sig<-c("b","a","b","b","b",
#            "b","b","b","b","b",
#           "b","b","b")

d<-ggplot(ase4, aes(y=Color, x=logcolorabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Floral Color") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,1.05))+
  geom_errorbar(aes(xmin=logcolorabun1-below, xmax=logcolorabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("d.")
d

grid.arrange(a,b,c,d)



#range
sept<-read.csv("FeedByDay_september_range.csv", header=TRUE)
names(sept)
head(sept)

adabun1<-glm(lograngeabun1~Site+Range,data=sept,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

sept1<-subset(sept,Site2=='Site 1')
sept2<-subset(sept,Site2=='Site 2')
sept3<-subset(sept,Site2=='Site 3')
sept4<-subset(sept,Site2=='Site 4')


adabun1<-glm(lograngeabun1~Range,data=sept1,family = gaussian(link = "identity"))
emm<-emmeans(adabun1,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase1<-summarySE(sept1, measurevar="lograngeabun1", groupvars=c("Range"))
ase1
#ase1$below<-c(0.001,0)
#ase1
#ase1$sig<-c("a","b")

a<-ggplot(ase1, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#1b9e77",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  #geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
  #             position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(lograngeabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("a.")
a


adabun2<-glm(lograngeabun1~Range,data=sept2,family = gaussian(link = "identity"))
emm<-emmeans(adabun2,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase2<-summarySE(sept2, measurevar="lograngeabun1", groupvars=c("Range"))
ase2
ase2$below<-c(0.008,0.001)
#ase2
#ase2$sig<-c("a","a","a","a","a",
#           "a","a","a","a","a")

b<-ggplot(ase2, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#d95f02",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
               position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(logabuncount1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("b.")
b


adabun3<-glm(lograngeabun1~Range,data=sept3,family = gaussian(link = "identity"))
emm<-emmeans(adabun3,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase3<-summarySE(sept3, measurevar="lograngeabun1", groupvars=c("Range"))
ase3
ase3$below<-c(0.01,0.124)
ase3
#ase3$sig<-c("a","b")

c<-ggplot(ase3, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#7570b3",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  #geom_text(aes(label=sig, x=(lograngeabun1+sd+0.1)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("c.")
c


adabun4<-glm(lograngeabun1~Range,data=sept4,family = gaussian(link = "identity"))
emm<-emmeans(adabun4,c("Range"),type="response")
joint_tests(emm)
pairs(emm)
emm
cld(emm)

ase4<-summarySE(sept4, measurevar="lograngeabun1", groupvars=c("Range"))
ase4
ase4$below<-c(0.002,0)
ase4
#ase4$sig<-c("b","a")

d<-ggplot(ase4, aes(y=Range, x=lograngeabun1, width=.8))+
  geom_bar(stat="identity", color="black",fill="#e7298a",
           position=position_dodge())+
  ylab("Plant Species Range") +
  xlab("Log Feeding Bouts / Day /\nFloral Density")+
  theme_bw()+
  #scale_fill_brewer(palette="YlGnBu")+
  scale_x_continuous(expand=c(0,0), limits=c(0,2.05))+
  geom_errorbar(aes(xmin=lograngeabun1-below, xmax=lograngeabun1+sd), width=.2, 
                position=position_dodge(.8))+
  # geom_text(aes(label=sig, x=(lograngeabun1+sd+0.2)),colour="black",vjust=0.3, size=4, position=position_dodge(.8),fontface="plain")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  #theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  #scale_y_discrete(labels=label_wrap_gen(width=10))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  ggtitle("d.")
d


grid.arrange(a,b,c,d)


setwd("C:/Users/kefisher/Box/Publications/Adult Monarch Feeding Behavior/Data Analysis/042022_glm")

june<-read.csv("floralsurvey_june.csv", header=TRUE)
june$Season<-"Early-Season"
june$Order3<-1
july<-read.csv("floralsurvey_julyaugust.csv", header=TRUE)
july$Season<-"Mid-Season"
july$Order3<-2
sept<-read.csv("floralsurvey_september.csv", header=TRUE)
sept$Season<-"Late-Season"
sept$Order3<-3

all<-do.call("rbind",list(june,july,sept))
names(all)

ase<-summarySE(all, measurevar="LogBloom", groupvars=c("PlantSpecies","Order2","Season","Order3"))
ase




ggplot(ase,aes(x=reorder(PlantSpecies,Order2), y=reorder(Season,-Order3), fill= LogBloom))+
  geom_tile() +
  scale_fill_gradient(low="white", high="black") +
  theme_bw()+
  #facet_wrap(~Month,ncol=1)+
  #theme_bw()+
  theme(panel.grid.major = element_line(color = "black", size = 3))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  xlab("Plant Species Common Name") +
  ylab("Average\nLog Density")+
  #theme(axis.title.y=element_text(angle=0))+
  #theme(axis.title.y=element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
 # theme(axis.title.x=element_blank())+
  #theme(axis.text.x=element_blank())+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.x=element_text(colour="black"))+
  #theme(axis.text.y = element_blank(),
   #     axis.ticks = element_blank())+
  #theme(axis.tick = element_blank())+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.text.y=element_text(colour="black"))+
  theme(plot.title=element_text(size=18))+
  theme(axis.title = element_text(size = 14))+
  theme(strip.text.x = element_text(size=13))+
  labs(fill="Log\nDensity")+
  theme(legend.direction = "vertical")+
  theme(legend.position="right")+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))




