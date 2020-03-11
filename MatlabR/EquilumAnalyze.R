
library(lme4)
library(lmerTest)
library(nlme)



setwd("/Users/karen/Dropbox/Projects/ColorEmoEquilum/Analyses/MatlabR")

d <- read.csv('T_EquilumData.csv', sep = ",", header = TRUE)

d$HappySad_z = (d$HappySad - ave(d$HappySad))/sd(d$HappySad)
d$Angry_z = (d$Angry - ave(d$Angry))/sd(d$Angry)
d$Sat_z = (d$Sat - ave(d$Sat))/sd(d$Sat)
d$LD_z = (d$LD - ave(d$LD))/sd(d$LD)


d$Lz = (d$L - ave(d$L))/sd(d$L)
d$az = (d$a - ave(d$a))/sd(d$a)
d$bz = (d$b - ave(d$b))/sd(d$b)
d$Cz = (d$C - ave(d$C))/sd(d$C)

#pvalues for t-tests were fit Satterthwaite's method in 'lmerModLmerTest'

#Happy/sad
ModelHS = lmer(HappySad_z ~ 1 + Lz*Cz*az + Lz*Cz*bz + (1 +  (Lz*Cz*az + Lz*Cz*bz)||Subj), d, control=lmerControl(optimizer="bobyqa"))
summary(ModelHS)

#Angry
ModelA = lmer(Angry_z ~ 1 + Lz*Cz*az + Lz*Cz*bz + (1 +  (Lz*Cz*az + Lz*Cz*bz)||Subj), d, control=lmerControl(optimizer="bobyqa"))
summary(ModelA)

#Saturation ratings
ModelSat = lmer(Sat_z ~ 1 + Lz*Cz*az + Lz*Cz*bz + (1 +  (Lz*Cz*az + Lz*Cz*bz)||Subj), d, control=lmerControl(optimizer="bobyqa"))
summary(ModelSat)

#Light/dark ratings
ModelLD = lmer(LD_z ~ 1 + Lz*Cz*az + Lz*Cz*bz + (1 +  (Lz*Cz*az + Lz*Cz*bz)||Subj), d, control=lmerControl(optimizer="bobyqa"))
summary(ModelLD)


############ REPLICATION AND MATCHED ############ 

d2 <- read.csv('T_Equilum2Data.csv', sep = ",", header = TRUE)

#replication of expeirment 1 (chroma of 15 and 30)
d2$HappySad_z = (d2$HappySad_r - ave(d2$HappySad_r))/sd(d2$HappySad_r)
d2$Angry_z = (d2$Angry_r - ave(d2$Angry_r))/sd(d2$Angry_r)
d2$Sat_z = (d2$Sat_r - ave(d2$Sat_r))/sd(d2$Sat_r)
d2$LD_z = (d2$LD_r - ave(d2$LD_r))/sd(d2$LD_r)


d2$Lz = (d2$L_r - ave(d2$L_r))/sd(d2$L_r)
d2$az = (d2$a_r - ave(d2$a_r))/sd(d2$a_r)
d2$bz = (d2$b_r - ave(d2$b_r))/sd(d2$b_r)
d2$Cz = (d2$C_r - ave(d2$C_r))/sd(d2$C_r)

#chroma of 20 and 20-match
d2$HappySad_m_z = (d2$HappySad_m - ave(d2$HappySad_m))/sd(d2$HappySad_m)
d2$Angry_m_z = (d2$Angry_m - ave(d2$Angry_m))/sd(d2$Angry_m)
d2$Sat_m_z = (d2$Sat_m - ave(d2$Sat_m))/sd(d2$Sat_m)
d2$LD_m_z = (d2$LD_m - ave(d2$LD_m))/sd(d2$LD_m)

d2$a_m_z  = (d2$a_m  - ave(d2$a_m ))/sd(d2$a_m)
d2$b_m_z  = (d2$b_m  - ave(d2$b_m ))/sd(d2$b_m)
d2$L_m_z = (d2$L_m - ave(d2$L_m))/sd(d2$L_m)
#(C_m doesn't get z-scored because it is just coding -1 vs. +1)

## REPLICATION OF EXP 2
#Happy/sad 
ModelHS2 = lmer(HappySad_z ~ 1 + Lz*Cz*az + Lz*Cz*bz + (1 +  (Lz*Cz*az + Lz*Cz*bz)||Subj), d2, control=lmerControl(optimizer="bobyqa"))
summary(ModelHS2)

#Angry
ModelA2 = lmer(Angry_z ~ 1 + Lz*Cz*az + Lz*Cz*bz + (1 +  (Lz*Cz*az + Lz*Cz*bz)||Subj), d2, control=lmerControl(optimizer="bobyqa"))
summary(ModelA2)

#Saturation ratings
ModelSat2 = lmer(Sat_z ~ 1 + Lz*Cz*az + Lz*Cz*bz + (1 +  (Lz*Cz*az + Lz*Cz*bz)||Subj), d2, control=lmerControl(optimizer="bobyqa"))
summary(ModelSat2)

#Light/dark ratings
ModelLD2 = lmer(LD_z ~ 1 + Lz*Cz*az + Lz*Cz*bz + (1 +  (Lz*Cz*az + Lz*Cz*bz)||Subj), d2, control=lmerControl(optimizer="bobyqa"))
summary(ModelLD2)




## SATURATION MATCHED COLORS 

#Happy/sad 
ModelHS2_m = lmer(HappySad_m_z ~ 1 + L_m_z*C_m*a_m_z + L_m_z*C_m*b_m_z + (1 +  (L_m_z*C_m*a_m_z + L_m_z*C_m*b_m_z)||Subj), d2, control=lmerControl(optimizer="bobyqa"))
summary(ModelHS2_m)

#Angry
ModelA2_m = lmer(Angry_m_z ~ 1 + L_m_z*C_m*a_m_z + L_m_z*C_m*b_m_z + (1 +  (L_m_z*C_m*a_m_z + L_m_z*C_m*b_m_z)||Subj), d2, control=lmerControl(optimizer="bobyqa"))
summary(ModelA2_m)

#Saturation ratings
ModelSat2_m = lmer(Sat_m_z ~ 1 + L_m_z*C_m*a_m_z + L_m_z*C_m*b_m_z + (1 +  (L_m_z*C_m*a_m_z + L_m_z*C_m*b_m_z)||Subj), d2, control=lmerControl(optimizer="bobyqa"))
summary(ModelSat2_m)

#Light/dark ratings
ModelLD2_m = lmer(LD_m_z ~ 1 + L_m_z*C_m*a_m_z + L_m_z*C_m*b_m_z + (1 +  (L_m_z*C_m*a_m_z + L_m_z*C_m*b_m_z)||Subj), d2, control=lmerControl(optimizer="bobyqa"))
summary(ModelLD2_m)





#Happy/sad (match)
ModelHS_E2m = lmer(HappySad20M_z ~ 1 + L*C2020m*a20M + L*C2020m*b20M + (1 +  (L*C2020m*a20M + L*C2020m*b20M)|Subj), d2, control=lmerControl(optimizer="bobyqa", optCtrl=list(maxfun=1000000)))
summary(ModelHS_E2m)

#Angry (match)
ModelA_E2m = lmer(Angry20M_z ~ 1 + L*C2020m*a20M + L*C2020m*b20M + (1 +  (L*C2020m*a20M + L*C2020m*b20M)|Subj), d2, control=lmerControl(optimizer="bobyqa", optCtrl=list(maxfun=1000000)))
summary(ModelA_E2m)

#Saturation (match)
ModelSat_E2m = lmer(Sat20M_z ~ 1 + L*C2020m*a20M + L*C2020m*b20M + (1 +  (L*C2020m*a20M + L*C2020m*b20M)|Subj), d2, control=lmerControl(optimizer="bobyqa", optCtrl=list(maxfun=1000000)))
summary(ModelSat_E2m)

#Light/Dark (match)
ModelLD_E2m = lmer(LD20M_z ~ 1 + L*C2020m*a20M + L*C2020m*b20M + (1 +  (L*C2020m*a20M + L*C2020m*b20M)|Subj), d2, control=lmerControl(optimizer="bobyqa", optCtrl=list(maxfun=1000000)))
summary(ModelLD_E2m)






