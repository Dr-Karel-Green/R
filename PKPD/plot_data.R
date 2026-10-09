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

