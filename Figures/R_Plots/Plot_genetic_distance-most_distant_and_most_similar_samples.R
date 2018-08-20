#Draw the density curve of pairwise distances for all samples with overlapping histograms for
# 1- comparisons involving 2 of the 8 most similar samples
# 2- comparisons involving the 4 most distant samples (compared to each other and to everything else), and
# 3- all other comparisons

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

#################################################################################
# Crep_unfiltered (Crep samples with all loci, since this is what I'm using in the manuscript)

pdf(paste("Outputs/Plot_genetic_distance-most_similar_and_most_distant_samples_", now, ".pdf", sep=""))
sink(paste("Outputs/Plot_genetic_distance-most_similar_and_most_distant_samples_", now, ".txt", sep=""))

#Read in data
filename <- "Inputs/Crep_25_unfiltered.stru"
structure_data <- read.structure(filename, n.ind=25, n.loc=2127, col.lab=1, col.pop=0, col.others=0, row.marknames=0, onerowperind=FALSE)
div <- summary(structure_data)
#Still have a handful of loci with >2 alleles?
loci_to_keep <- names(div$loc.n.all[div$loc.n.all==2])
structure_data1 <- structure_data[loc=loci_to_keep]

#Read in sample to species table
sample_data <- read.table("Inputs/sample_attributes_table.csv", header=TRUE, sep=",", dec=".")
sample_data <- sample_data[sample_data$structure_id=="Crepidomanes" & sample_data$low_reads==FALSE,]
sample_data <- droplevels(sample_data)
#Make sure factors with sort orders that might matter are sorted intelligently
sample_data$sample <- factor(sample_data$sample, ordered = TRUE)
sample_data$long_sample_id <- factor(sample_data$long_sample_id, ordered = TRUE)

# Plot density curves: total, Pairwise comparisons between 8 "clones", Pairwise comparisons between 4 oddballs and each other, Pairwise comparisons between oddballs and anything else, Pairwise comparisons between non-clones/non-oddballs
distobj <- dist(structure_data1)
distobj <- round(distobj, digits=3)
distmatrix <- as.matrix(distobj)
overall_mean_distance <- mean(distobj)

# Get the distances involving the 4 most different samples (oddballs)
oddballs_v_others <- distmatrix[c(10,14,15,17),c(1,2,3,4,5,6,7,8,9,11,12,13,16,18,19,20,21,22,23,24,25)]
oddballs_v_othersdistances <- sort(oddballs_v_others[1:length(oddballs_v_others)])
oddballs_v_oddballs <- distmatrix[c(10,14,15,17), c(10,14,15,17)]
oddballs_v_oddballsdist <- as.dist(oddballs_v_oddballs)
oddballs_v_oddballsdistances <- sort(oddballs_v_oddballsdist[1:length(oddballs_v_oddballsdist)])
all_oddballsdistances <- c(oddballs_v_othersdistances, oddballs_v_oddballsdistances)
all_oddballsdistances <- sort(all_oddballsdistances)

# Get the distances for comparisons between the 8 most similar samples ("clones")
clones <- distmatrix[c(5,6,8,9,21,23,24,25),c(5,6,8,9,21,23,24,25)]
clonedist <- as.dist(clones)
clonedistances <-  sort(clonedist[1:length(clonedist)])

# Get all the other distances (typical samples vs typical samples and clones vs typical samples)
typicals_vs_typicals <- distmatrix[c(1,2,3,4,7,11,12,13,16,18,19,20,22), c(1,2,3,4,7,11,12,13,16,18,19,20,22)]
typicals_v_typicalsdist <- as.dist(typicals_vs_typicals)
typicals_v_typicalsdistances <- sort(typicals_v_typicalsdist[1:length(typicals_v_typicalsdist)])
clones_v_typicalsdistances <- distmatrix[c(5,6,8,9,21,23,24,25), c(1,2,3,4,7,11,12,13,16,18,19,20,22)]
clones_v_typicalsdistances <- sort(clones_v_typicalsdistances[1:length(clones_v_typicalsdistances)])
all_typicalsdistances <- c(typicals_v_typicalsdistances, clones_v_typicalsdistances)

# Draw the figure
hist1 <- hist(clonedistances, plot=FALSE, breaks=seq(20,70,0.5))
hist2 <- hist(all_typicalsdistances, plot=FALSE, breaks=seq(20,70,0.5))
hist3 <- hist(all_oddballsdistances, plot=FALSE, breaks=seq(20,70,0.5))
plot(hist1, col=4, density=30, angle=135, xlim=c(20,70), ylim=c(0,10), main = "", xlab="genetic distance")
plot(hist2, col=1, density=20, angle=45, xlim=c(20,70), ylim=c(0,10), add=TRUE)
plot(hist3, col=2, density=20, angle=135, xlim=c(20,70), ylim=c(0,10), add=TRUE)
abline(v=overall_mean_distance, lty=2, lwd=0.5) #Show the overall mean pairwise distance
text("Mean genetic distance", x=44, y=9.5, adj=c(0,0))
abline(v=30.508, lty=2, lwd=0.5) # Show the 6% lowest pairwise distance
text("Lowest 6%", x=22, y=9.5, adj=c(0,0))
par(new=TRUE)
plot(density(distobj, na.rm=TRUE, adjust=1), xlim=c(20,70), ylim=c(0,0.04), xlab="", ylab="", main="", axes=FALSE)

sink()
dev.off()