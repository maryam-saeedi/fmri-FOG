features <- read.csv("/home/maryam/research/fmri/dcp/feature_pool_chunked7.csv")

library(fpc)
library(plotrix)


graphics.off()
cls <- features[,79]
data <- features[,2:78]

# dp <- discrcoord(data, cls)
dp <- adcoord(data, cls, clnum=0)

#write.csv(dp$unit, 'units_train_adc0.csv')

print(dp$ev)
print(dp$unit[,1:2])
print(dp$proj[1,])
# print(dp$proj[,1:2])
# print(dp$proj[1:2,])

names <- c('Left-Thalamus-Proper-Energy', 'Right-Thalamus-Proper-Energy', 'Left-Caudate-Energy', 'Right-Caudate-Energy', 'Left-Putamen-Energy', 'Right-Putamen-Energy', 'Brain-Stem-Energy', 'ctx_lh_G_parietal_sup-Energy', 'ctx_lh_G_precentral-Energy', 'ctx_rh_G_parietal_sup-Energy', 'ctx_rh_G_precentral-Energy',
                'Left-Thalamus-Proper-Mean', 'Right-Thalamus-Proper-Mean', 'Left-Caudate-Mean', 'Right-Caudate-Mean', 'Left-Putamen-Mean', 'Right-Putamen-Mean', 'Brain-Stem-Mean', 'ctx_lh_G_parietal_sup-Mean', 'ctx_lh_G_precentral-Mean','ctx_rh_G_parietal_sup-Mean', 'ctx_rh_G_precentral-Mean',
                'Left-Thalamus-Proper-Var', 'Right-Thalamus-Proper-Var', 'Left-Caudate-Var', 'Right-Caudate-Var', 'Left-Putamen-Var', 'Right-Putamen-Var', 'Brain-Stem-Var', 'ctx_lh_G_parietal_sup-Var', 'ctx_lh_G_precentral-Var', 'ctx_rh_G_parietal_sup-Var', 'ctx_rh_G_precentral-Var',
                'Left-Thalamus-Proper-ssc', 'Right-Thalamus-Proper-ssc', 'Left-Caudate-ssc', 'Right-Caudate-ssc', 'Left-Putamen-ssc', 'Right-Putamen-ssc', 'Brain-Stem-ssc', 'ctx_lh_G_parietal_sup-ssc', 'ctx_lh_G_precentral-ssc', 'ctx_rh_G_parietal_sup-ssc', 'ctx_rh_G_precentral-ssc',
                'Left-Thalamus-Proper-wavwLen', 'Right-Thalamus-Proper-wavwLen', 'Left-Caudate-wavwLen', 'Right-Caudate-wavwLen', 'Left-Putamen-wavwLen', 'Right-Putamen-wavwLen', 'Brain-Stem-wavwLen', 'ctx_lh_G_parietal_sup-wavwLen', 'ctx_lh_G_precentral-wavwLen', 'ctx_rh_G_parietal_sup-wavwLen', 'ctx_rh_G_precentral-wavwLen',
                'Left-Thalamus-Proper-AmpMax', 'Right-Thalamus-Proper-AmpMax', 'Left-Caudate-AmpMax', 'Right-Caudate-AmpMax', 'Left-Putamen-AmpMax', 'Right-Putamen-AmpMax', 'Brain-Stem-AmpMax', 'ctx_lh_G_parietal_sup-AmpMax', 'ctx_lh_G_precentral-AmpMax', 'ctx_rh_G_parietal_sup-AmpMax', 'ctx_rh_G_precentral-AmpMax',
                'Left-Thalamus-Proper-Amp', 'Right-Thalamus-Proper-Amp', 'Left-Caudate-Amp', 'Right-Caudate-Amp', 'Left-Putamen-Amp', 'Right-Putamen-Amp', 'Brain-Stem-Amp', 'ctx_lh_G_parietal_sup-Amp', 'ctx_lh_G_precentral-Amp', 'ctx_rh_G_parietal_sup-Amp', 'ctx_rh_G_precentral-Amp')
                
# jpeg(file="saving_plot1.jpeg")
mar.default <- c(15,5,2,2) + 0.1
par(mar = mar.default) 
barplot(height=dp$units[,2], names=names, cex.names=0.5, las=2, ylim=c(-.2,.2), main="Loading for adc2")
# dev.off()


x11()
plotcluster(data,clvecd=cls, clnum=0, method="dc")#, ylim=c(-440,-430), xlim=c(-2500,-2490))
legend(x="topleft",c("FOG+","FOG-"),cex=.8,col=c("red","black"),pch=c("1", "0"))

# x11()
# plot(dp$proj, col=1+cls)#, ylim=c(38500, 39500))

