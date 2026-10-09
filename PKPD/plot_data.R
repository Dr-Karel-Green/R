#Purpose: read in and plot PK data
setwd("/Volumes/Cherry/R/PKPD")
rm(list = ls())
options(scipen = 999)
#libraries----
library(dplyr)
library(zoo)
library(units)
#data----
df <- read.csv("Data/Single_Ascending_Dose_Dataset2.csv")

#dose corrected conc----
df$DOSE <- set_units(df$DOSE, "mg")
df$DOSE <- set_units(df$DOSE, "ng")

df$LIDV <- set_units(df$LIDV, "ng/mL")
df$dv_dose <- df$LIDV/df$DOSE

df$dv_dose <- set_units(df$dv_dose, "1/ML")

df$LIDV <- drop_units(df$LIDV)
df$dv_dose <- drop_units(df$dv_dose)

# df$TIME <- set_units(df$TIME, "h")

#plotting limits----
conc <- df$EVID == 0 & df$CMT == 2 & df$TIME > 0

save_plots=FALSE

#linear----
xlims <- range(df$TIME[conc]/24, na.rm = TRUE)
ylims <- range(df$LIDV[conc], na.rm = TRUE)
for (i in unique(df$ID)){
  if (save_plots==TRUE){
    png(sprintf("plots/conc_time/linear/dv/ID=%s.png", i), width = 600, height = 400)
  }

  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  plot(data$TIME[conc]/24, data$LIDV[conc],
       xlab="Time (Days)", ylab="Concentration (ng/mL)",
       xlim = xlims, ylim = ylims)
  title(sprintf("ID = %s", i), adj=0)
  if (save_plots==TRUE){
    dev.off()
    }
}

ylims <- range(df$dv_dose[conc], na.rm = TRUE)
for (i in unique(df$ID)){
  if (save_plots==TRUE){
    png(sprintf("plots/conc_time/linear/dv_dose/ID=%s.png", i), width = 600, height = 400)
  }
  
  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  plot(data$TIME[conc]/24, data$dv_dose[conc],
       xlab="Time (Days)", ylab="Dose-Corrected Concentration (1/ML)",
       xlim = xlims, ylim = ylims)
  title(sprintf("ID = %s", i), adj=0)
  if (save_plots==TRUE){     
    dev.off()
    }
}

#logy----
ylims <- range(df$LIDV[conc], na.rm = TRUE)

for (i in unique(df$ID)){
  if (save_plots==TRUE){
    png(sprintf("plots/conc_time/logy/dv/ID=%s.png", i), width = 600, height = 400)
  }

  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  plot(data$TIME[conc], data$LIDV[conc], log="y",
       xlab="Time (Days)", ylab="Concentration (ng/mL)",
       xlim = xlims, ylim = ylims)
  title(sprintf("ID = %s", i), adj=0)
  if (save_plots==TRUE){     
    dev.off()
    }
}

ylims <- range(df$dv_dose[conc], na.rm = TRUE)
for (i in unique(df$ID)){
  if (save_plots==TRUE){
    png(sprintf("plots/conc_time/logy/dv_dose/ID=%s.png", i), width = 600, height = 400)
  }

  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  plot(data$TIME[conc]/24, data$dv_dose[conc], log="y",
       xlab="Time (Days)", ylab="Dose-Corrected Concentration (1/ML)",
       xlim = xlims, ylim = ylims)
  title(sprintf("ID = %s", i), adj=0)
  if (save_plots==TRUE){     
    dev.off()
    }
}

#all----
if (save_plots==TRUE){
  png("plots/conc_time/logy/dv_dose/all.png", width = 600, height = 400)
}
avg_data <- df %>% filter(EVID==0, CMT==2) %>% group_by(NOMTIME) %>% 
  mutate(avg_conc=mean(LIDV, na.rm=TRUE),
         err=sd(LIDV, na.rm=TRUE),
         avg_time=mean(NOMTIME, na.rm=TRUE))

plot(avg_data$avg_time/24, avg_data$avg_conc,
     xlab="Time (Days)", ylab="Dose-Corrected Concentration (1/ML)",
     xlim = xlims, ylim = ylims, log="y", pch=20, cex=2)
for (i in unique(df$ID)){
  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  lines(data$TIME[conc]/24, data$dv_dose[conc], type="b", col="grey80")
}

points(avg_data$avg_time/24, avg_data$avg_conc,
       pch = 20, cex = 2, col = "black")
legend("topright",
       legend = c("Mean", "Individuals"),
       col = c("black", "grey80"),
       pch = c(20, 1),
       lty = c(NA, 1),
       pt.cex = c(2,1),
       bty = "n")

if (save_plots==TRUE){     
  dev.off()
}

# avg_data <- df %>% filter(EVID==0, CMT==2) %>% group_by(NOMTIME) %>% 
#   mutate(avg_conc=mean(LIDV, na.rm=TRUE),
#          err=sd(LIDV, na.rm=TRUE),
#          avg_time=mean(NOMTIME, na.rm=TRUE))
# 
# plot(avg_data$avg_time/24, avg_data$avg_conc,
#      xlab="Time (Days)", ylab="Dose-Corrected Concentration (1/ML)",
#      xlim = xlims, ylim = ylims, log="y")
# arrows(avg_data$avg_time/24,
#        avg_data$avg_conc - avg_data$err,
#        avg_data$avg_time/24,
#        avg_data$avg_conc + avg_data$err,
#        angle = 90, code = 3, length = 0.05)
# arrows(avg_data$avg_time/24,
#        pmax(avg_data$avg_conc - avg_data$err, min(ylims[ylims > 0])),
#        avg_data$avg_time/24,
#        avg_data$avg_conc + avg_data$err,
#        angle = 90, code = 3, length = 0.05)

#logx----
ylims <- range(df$LIDV[conc], na.rm = TRUE)

for (i in unique(df$ID)){
  if (save_plots==TRUE){
    png(sprintf("plots/conc_time/logx/dv/ID=%s.png", i), width = 600, height = 400)
  }

  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  plot(data$TIME[conc]/24, data$LIDV[conc], log="x",
       xlab="Time (Days)", ylab="Concentration (ng/mL)",
       xlim = xlims, ylim = ylims)
  title(sprintf("ID = %s", i), adj=0)
  if (save_plots==TRUE){     
    dev.off()
    }
}

ylims <- range(df$dv_dose[conc], na.rm = TRUE)
for (i in unique(df$ID)){
  if (save_plots==TRUE){
    png(sprintf("plots/conc_time/logx/dv_dose/ID=%s.png", i), width = 600, height = 400)
  }
  
  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  plot(data$TIME[conc]/24, data$dv_dose[conc], log="x",
       xlab="Time (Days)", ylab="Dose-Corrected Concentration (1/ML)",
       xlim = xlims, ylim = ylims)
  title(sprintf("ID = %s", i), adj=0)
  if (save_plots==TRUE){     
    dev.off()
    }
}

#logyx----
ylims <- range(df$LIDV[conc], na.rm = TRUE)

for (i in unique(df$ID)){
  if (save_plots==TRUE){
    png(sprintf("plots/conc_time/log_xy/dv/ID=%s.png", i), width = 600, height = 400)
  }

  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  plot(data$TIME[conc]/24, data$LIDV[conc], log="xy",
       xlab="Time (Days)", ylab="Concentration (ng/mL)",
       xlim = xlims, ylim = ylims)
  title(sprintf("ID = %s", i), adj=0)
  if (save_plots==TRUE){     
    dev.off()
    }
}

ylims <- range(df$dv_dose[conc], na.rm = TRUE)
for (i in unique(df$ID)){
  if (save_plots==TRUE){
    png(sprintf("plots/conc_time/log_xy/dv_dose/ID=%s.png", i), width = 600, height = 400)
  }

  data <- df %>% filter(ID==i)
  
  conc <- data$EVID==0 & data$CMT==2
  plot(data$TIME[conc]/24, data$dv_dose[conc], log="xy",
       xlab="Time (Days)", ylab="Dose-Corrected Concentration (1/ML)",
       xlim = xlims, ylim = ylims)
  title(sprintf("ID = %s", i), adj=0)
  if (save_plots==TRUE){     
    dev.off()
    }
}

