#Plot the distribution of pairwise genetic distances for simulated clones vs expected clones (within-collection samples)

# Start with a clean R environment
rm(list=ls())

library("adegenet")
library("poppr")
library("ape")
library("ggplot2")
library("gridExtra")

# Setup output files
now <- Sys.Date()
options(width=200)
options(max.print=999999)

##########################################################################################
# Print both distribution plots for manuscript:
pdf(paste("Outputs/Plot_genetic_distance-clones_", now, ".pdf", sep=""))
sink(paste("Outputs/Plot_genetic_distance-clones_", now, ".txt", sep=""))

# Make plot for the Rawdata (original pairwise distances between within-collection samples)
filename <- "Inputs/Crep_25_unfiltered.stru"
structure_data <- read.structure(filename, n.ind=25, n.loc=2127, col.lab=1, col.pop=0, col.others=0, row.marknames=0, onerowperind=FALSE)
div <- summary(structure_data)
#Still have a handful of loci with >2 alleles??
length(div$loc.n.all[div$loc.n.all>2])
loci_to_keep <- names(div$loc.n.all[div$loc.n.all==2])
structure_data1 <- structure_data[loc=loci_to_keep]
structure_data1

#How distant are the non-clone (not from the same collection) samples?
distobj <- dist(structure_data1)
distobj <- round(distobj, digits=3)
distmatrix <- as.matrix(distobj)
alldist<- as.dist(distmatrix)
alldistances <- sort(alldist[1:length(alldist)])
nonclones <- distmatrix[c(1,4,7,8,11,12,13,14,15,18,19,20),c(1,4,7,8,11,12,13,14,15,18,19,20)]
nonclonedist <- as.dist(nonclones)
nonclonedistances <-  sort(nonclonedist[1:length(nonclonedist)])

#Grab the distances for the clones
clone1dist <- as.dist(distmatrix[2:3, 2:3])[1]
clone2dist <- as.dist(distmatrix[5:6, 5:6])[1]
clone3dist <- as.dist(distmatrix[9:10, 9:10])[1]
clone4dist <- as.dist(distmatrix[16:17, 16:17])[1]
clone5dist <- as.dist(distmatrix[21:25, 21:25])[1:10]

#Do it prettier with ggplot
nonclonedistances <- as.data.frame(nonclonedistances)
alldistances <- as.data.frame(alldistances)
clone5frame <- as.data.frame(clone5dist)

rawdata_distribution_plot <- ggplot() + 
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + 
  xlab("Pairwise distance") + 
  ggtitle("a)") + 
  geom_density(data=alldistances, aes(x=alldistances)) +
  scale_x_continuous(limits=c(0,75), expand=c(0,0)) + 
  scale_y_continuous(limits=c(0,0.05), expand=c(0,0)) + 
  geom_segment(data=clone5frame, aes(x=clone5dist, xend=clone5dist), y=0, yend=0.03, col="orange") +
  geom_segment(aes(x=clone1dist, xend=clone1dist), y=0, yend=0.03, col="red") +
  geom_segment(aes(x=clone2dist, xend=clone2dist), y=0, yend=0.03, col="green3") +
  geom_segment(aes(x=clone3dist, xend=clone3dist), y=0, yend=0.03, col="blue") +
  geom_segment(aes(x=clone4dist, xend=clone4dist), y=0, yend=0.03, col="cyan")
#plot(rawdata_distribution_plot)

#Make a plot for the resampled simulated clones
#Read in data
filename <- "Inputs/Crep_25_unfiltered-resampled_all_clones.stru"
structure_data <- read.structure(filename, n.ind=25, n.loc=2917, col.lab=1, col.pop=0, col.others=0, row.marknames=0, onerowperind=FALSE)
div <- summary(structure_data)
#Still have a handful of loci with >2 alleles??
length(div$loc.n.all[div$loc.n.all>2])
loci_to_keep <- names(div$loc.n.all[div$loc.n.all==2])
structure_data1 <- structure_data[loc=loci_to_keep]
structure_data1

#How distant are the non-clone (not from the same collection) samples?
distobj <- dist(structure_data1)
distobj <- round(distobj, digits=3)
distmatrix <- as.matrix(distobj)
alldist<- as.dist(distmatrix)
alldistances <- sort(alldist[1:length(alldist)])
nonclones <- distmatrix[c(1,4,7,8,11,12,13,14,15,18,19,20),c(1,4,7,8,11,12,13,14,15,18,19,20)]
nonclonedist <- as.dist(nonclones)
rnonclonedistances <-  sort(nonclonedist[1:length(nonclonedist)])

#Grab the distances for the clones
rclone1dist <- as.dist(distmatrix[2:3, 2:3])[1]
rclone2dist <- as.dist(distmatrix[5:6, 5:6])[1]
rclone3dist <- as.dist(distmatrix[9:10, 9:10])[1]
rclone4dist <- as.dist(distmatrix[16:17, 16:17])[1]
rclone5dist <- as.dist(distmatrix[21:25, 21:25])[1:10]

#Do it prettier with ggplot
rnonclonedistances <- as.data.frame(rnonclonedistances)
alldistances <- as.data.frame(alldistances)
rclone5frame <- as.data.frame(rclone5dist)

resampleddata_distribution_plot <- ggplot() + 
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + 
  xlab("Pairwise distance") + 
  ggtitle("b)") + 
  geom_density(data=alldistances, aes(x=alldistances)) +
  scale_x_continuous(limits=c(0,75), expand=c(0,0)) + 
  scale_y_continuous(limits=c(0,0.05), expand=c(0,0)) + 
  geom_vline(xintercept=29.621, lwd=0.5, lty=2) + 
  geom_segment(data=rclone5frame, aes(x=rclone5dist, xend=rclone5dist), y=0, yend=0.03, col="orange") +
  geom_segment(aes(x=rclone1dist, xend=rclone1dist), y=0, yend=0.03, col="red") +
  geom_segment(aes(x=rclone2dist, xend=rclone2dist), y=0, yend=0.03, col="green3") +
  geom_segment(aes(x=rclone3dist, xend=rclone3dist), y=0, yend=0.03, col="blue") +
  geom_segment(aes(x=rclone4dist, xend=rclone4dist), y=0, yend=0.03, col="cyan") +
  annotate("text", x=24, y=0.045, label="Lowest 6%")
#plot(resampleddata_distribution_plot)

grid.arrange(rawdata_distribution_plot, resampleddata_distribution_plot, ncol=1, nrow=2)

sink()
dev.off()