install.packages("Lahman")
library(Lahman)
library(tidyverse)
library(ggplot2)
library(ggrepel)

# Intro: Fascinated by Adam Duvall. Around league average in terms of OPS+ yet put up 
# insane counting stats that are adored by those who prioritize traditional stats 

Master %>%
  filter(nameLast == "Duvall") -> duvy

Batting %>%
  filter(playerID == "duvalad01", yearID == 2019) -> duvall_19

duvall['BA'] <- round(duvall["H"] / duvall["AB"], digits = 3)

# 2021
OBP_plus_duvy21 = round((.281/.317) * 100) # 89 OBP+
SLG_plus_duvy21 = round((.491/.411) * 100) # 119 SLG+



# Goal: Analyze the variance among league avg. hitters
####### Finding Average Hitters 2015-2019

average_hitters = read.csv(file.choose())
average_hitters = subset(average_hitters, wRC. >= 95 & wRC. <= 105)

####
average_hitters$HardHit. = as.character(average_hitters$HardHit.)
average_hitters$HardHit. = gsub("%", "", as.character(average_hitters$HardHit.))
average_hitters$HardHit. = as.numeric(average_hitters$HardHit.)

average_hitters$Barrel. = as.character(average_hitters$Barrel.)
average_hitters$Barrel. = gsub("%", "", as.character(average_hitters$Barrel.))
average_hitters$Barrel. = as.numeric(average_hitters$Barrel.)

average_hitters$K. = as.character(average_hitters$K.)
average_hitters$K. = gsub("%", "", as.character(average_hitters$K.))
average_hitters$K. = as.numeric(average_hitters$K.)

average_hitters$BB. = as.character(average_hitters$BB.)
average_hitters$BB. = gsub("%", "", as.character(average_hitters$BB.))
average_hitters$BB. = as.numeric(average_hitters$BB.)

average_hitters$SwStr. = as.character(average_hitters$SwStr.)
average_hitters$SwStr. = gsub("%", "", as.character(average_hitters$SwStr.))
average_hitters$SwStr. = as.numeric(average_hitters$SwStr.)
####


ggplot(average_hitters, aes(wRC., SwStr.)) + geom_point() + geom_smooth()


ggplot(average_hitters, aes(wRC., ISO)) + geom_point() + geom_smooth()


ggplot(average_hitters, aes(wRC., maxEV)) + geom_point() + geom_smooth()


ggplot(average_hitters, aes(wRC., HardHit.)) + geom_point() + geom_smooth()
