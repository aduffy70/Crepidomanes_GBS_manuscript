---
title: "Bad working title: population genetics of independent gametophytes using genotyping-by-sequencing"
author: Aaron M. Duffy, Don R. Farrar, Paul G. Wolf
---

ABSTRACT
========

INTRODUCTION
============
The "typical" fern lifecycle consists of alternating independent generations of diploid sporophytes and haploid gametophytes. The sporophyte is generally larger, longer-lived and has a more complex structure than the gametophyte [@Sheffield1994-jv] and their drastically different morphologies can result in different environmental or habitat requirements. However, in order for the entire lifecycle to occur, the same site must be suitable for the spore to germinate, the gametophyte to survive to produce gametes, the gametes to unite, and the sporophyte to survive to produce spores. All of these diverse processes must be supported in one location, though not necessarily at the same time [@Peck1990-th]. Some fern species are capable of asexual reproduction and subsequent dispersal in one or both generations, allowing individuals, clones, or colonies of either sporophytes or gametophytes to persist in places where the other cannot. This ability for gametophytes to survive and spread, even if the habitat in a particular time or place is not suitable for sporophytes may play an important role in long-distance fern dispersal and colonization [@Sato1982-uh; @Dassler2001-zv; @Ebihara2013-iq].

It is not noteworthy to observe sporophytes and not find gametophytes growing at the same site (since the gametophytes tend to be shorter-lived, more difficult to identify, and frequently overlooked), so examples demonstrating differences in habitat requirements between life stages are typically gametophyte colonies found growing independent of sporophytes. For example, sporophytes and gametophytes of _Callistopteris baueriana_ (Endl.) Copel. are found in wet, high altitude forests of the Hawaiian islands, whereas, only gametophytes are found at drier, lower locations [@Dassler1997-vo]. Several other species have gametophytes found over a larger geographic or environmental range than the sporophytes, including _Trichomanes speciosum_ Willd. (Hymenophyllaceae) in the British Isles, Europe and Canary Islands [@Ratcliffe1993-rx; @Rumsey1998-yx; @Rumsey1999-au; @Kingston2005-kn], _Hymenophyllum wrightii_ Bosch (Hymenophyllaceae) on the northwest coast of North America [@Persson1958-vl; @Iwatsuki1961-wa; @Taylor1967-au; @Duffy2015-ol], and _Crepidomanes schmidtianum_ (Zenker ex Taschner) K. Iwats. (Hymenophyllaceae) in Japan and Korea [@Lee2014-df]. All of these ferns have gametophytes that are long-lived and capable of clonal growth and asexual reproduction.

_Crepidomanes intricatum_ (Farrar) Ebihara & Weakley (Hymenophyllaceae), found as gametophytes throughout the Appalachian Mountains in eastern North America is a particularly interesting example of this phenomenon because no sporophytes have ever been found. The gametophytes are single-cell wide, branching filaments that produce asexual gemmae and grow in tangled clusters ranging from a few individuals to dense colonies covering several square meters (Figure 1).


  * What we know about Crepidomanes intricatum and other filmies in north america. Be sure to include something about how gametophytes found growing near sporophytes are assumed to be the same species as the sporophyte, whereas gametophytes found growing without sporophytes nearby are assumed to be _C.intricatum_ and individual patches are assumed to represent single clones.
  * Hypotheses for how Crepidomanes arrived at its current distribution
  * What we know about Crepidomanes genetics.
  * GBS
  * Goals of project:
    * Before we can look at population genetics of Crepidomanes we need to ensure we are not looking at a mix of different species.
    * Explore population structure of Crepidomanes independent gametophytes at different scales
    * Test hypotheses about how these populations were established and spread



METHODS
=======

## Sampling

50 suspected _C.intricatum_, _D. petersii_, or _V. boschiana_ gametophyte samples, one _D. petersii_ sporophyte sample, and three _V. boschiana_ sporophyte samples collected between 1965 and 2007 were selected to represent much of the known geographic range of _C.intricatum_. Samples included populations from previously glaciated areas, from multiple sites within some geographic regions, and from multiple patches within some sites. In addition, multiple DNA samples were extracted from some collections to look for variation within presumed clones (Table 1, Table 2).

## DNA extraction

Because of the small size of individual gametophytes and their tangled filamentous growth, each sample represents many individuals that were growing in close contact with each other (presumably clones) in <1 square-cm of silica-dried gametophyte mat. Bryophytes, lichen, sand, and other contaminants were manually separated from the gametophyte tissue under 20X magnification. DNA was extracted from 2--70 mg of cleaned tissue using a CTAB protocol [@Doyle1987-dp] with the following modifications to the cell disruption process. Samples were ground in CTAB buffer in 1.5mL tubes using a pestle attached to an electric drill on its slowest speed setting. While grinding, the tube was bathed in ice and pressure on the drill was applied in 1 second pulses to avoid heating the sample. For samples with less than 10 mg of tissue, 10--50 mg of autoclaved sand was added to improve grinding. Each sample was ground in three rounds of approximately 100 pulses with 100 uL of CTAB buffer in the first round and an additional 200uL added in subsequent rounds (500 uL total). After extraction the DNA was quantified using a Qubit fluorometer (Invitrogen, Carlsbad, California, USA).

## Library preparation and Illumina sequencing

The GBS library was prepared according to an established double-digest restriction site-assiciated DNA sequencing (ddRADseq) protocol [@Gompert2012-ir; @Parchman2012-qm] using restriction enzymes EcoR1 and Mse1. PCR amplification steps were performed using iproof high-fidelity DNA polymerase (New England Biolabs) to minimize PCR error. To maximize the number of homogeneous loci acrossed samples, pooled samples were size selected using Blue Pippen (Sage Science, Beverly, Massachusetts, USA), retaining loci between 250--350 bp. Samples were run on a single lane of Illumina HiSeq with 100 bp single-end sequencing at the University of Utah DNA Sequencing Core facility.

## Identifying loci and calling genotypes

Raw illumina reads were inspected for quality using fastQC [@Andrews2010-yx] and analyzed with ipyRAD v.0.7.1 [@Eaton2014-rr] using default settings except as noted below. Reads were sorted by barcode allowing up to two mismatched bases in the barcode sequence, filtered to remove low quality bases and reads with excessive low quality bases, and trimmed to remove Illumina adapter sequences.

To determine the appropriate clustering threshold for _de novo_ assembly of loci, clustering was performed over a range of threshold values from 0.95 down to 0.80. Higher values risk splitting alleles of a single locus into separate clusters, whereas lower values risk combining paralogs into single clusters. At higher threshold values the average number of clusters in _V. boschiana_ sporophyte samples is higher than in suspected _V. boschiana_ gametophyte samples, as would be expected if the ploidy level of the sporophytes is greater than the gametophytes. As the threshold values decrease the average number of clusters in sporophyte and gametophyte samples become similar, suggesting that multiple alleles in the sporophyte samples are being combined into loci. A threshold value of 0.85 was selected as the highest value where the number of clusters in _V. boschiana_ sporophyte and gametophyte samples are similar (Figure 2).

Because allozyme studies suggest that _C.intricatum_ gametophytes are diploid [@Farrar1985-ht], samples were treated as diploid for estimating heterozygosity and error rates, and genotype calling in ipyRAD.

Each 35--100 bp locus identified by ipyRAD may contain multiple SNPs. To avoid using tightly linked SNPs, ipyRAD provides output files with genotypes from 1 randomly selected SNP per locus (.ustr format). However, this random sampling takes place after loci have been filtered for minimum sample coverage, so some SNPs may not have the requested minimum sample coverage even though the locus they are within does, resulting in higher than expected levels of missing data. Also, because the SNP from each locus is selected randomly at the time the output file is generated, multiple ipyRAD datasets from runs with increasing minimum sample coverage values may result in datasets that are not subsets of each other. To ensure that all the analyses in this study were based on subsets of the same data and only included SNPs with the desired minimum sample coverage, we used ipyRAD to generate a dataset of loci with coverage in six samples and filtered that "base ipyRAD dataset" to the desired minimum sample coverages using a custom python script.

## Separating samples by species

To group samples by species, we generated three datasets from the base ipyRAD dataset including all 54 samples and SNPs present in at least 33%, 50%, and 66% of samples, to balance the risks of using large numbers of loci with much missing data against the risks of using very few loci with high sample coverage (Table 3). Each dataset was analyzed using Structure [@Pritchard2000-ek] with 3 clusters to determine whether each gametophyte sample:
  1. was consistently assigned to a cluster with the _V. boschiana_ sporophytes or _D. petersii_ sporophyte (suggesting that it is likely a gametophyte of one of those species),
  2. was consistently assigned to a cluster without sporophytes (suggesting that it is likely a gametophyte of _C.intricatum_), or
  3. was not consistently assigned to any one cluster (suggesting that it may include a mixture of more than one species of gametophyte, that it may contain hybrid gametophytes, or that there is not sufficient genetic signal to consistently make an assignment).

To further confirm species assignments from Structure, neighbor-joining Euclidean distance trees were generated with the adagenet package in R [@Jombart2008-sq; @Jombart2011-zo] with bootstrap values calculated using the poppr R package in R [@Kamvar2014-de].

Mean observed heterozygosity levels in each species were compared using ANOVA with Tukey HSD post hoc comparisons, and loci were tested for deviation from Hardy Weinberg equilibrium in each species in R.

## Investigating genetic variation in _C. intricatum_

To explore genetic variation in _C. intricatum_, gametophyte samples assigned as _C.intricatum_ and gametophytes assigned as _C. intricatum_ or mixed/unknown were further analyzed separately. Nine samples with low read counts (fewer than 1 million cleaned and quality filtered reads) were removed from the analysis to reduce the level of missing data and risk of mis-called genotypes due to missing alleles.

To see if the genetic signal from _V. boschiana_ and _D. petersii_ in the potentially mixed samples could be removed bioinformatically, allowing the _C. intricatum_ genetic signal to be analyzed, loci were identified as "_Crepidomanes_ loci" or "Non-_Crepidomanes_ loci" based on whether they were present in any sample assigned as _D. petersii_ or _V. boschiana_. We hypothesized that removing these non-_Crepidomanes_ loci from a sample with mixed genetic signal would remove loci specific to _D. petersii_ or _V. boschiana_ as well as loci shared between those species and _C. intricatum_, leaving mostly loci unique to _C. intricatum_. Four _C. intricatum_ subsets of the data were generated from the base dataset, with and without mixed/unknown samples, and with and without non-_Crepidomanes_ loci, each using a minimum sample coverage cutoff of 50% (Table 3). Patterns of genetic variation were analyzed using Structure, neighbor-joining Euclidean distance trees, and minimum spanning networks. Isolation by distance was tested using Mantel tests and Pearson's product-moment correlation with adagenet in R, and genetic distances were compared at different geographic scales and between glaciated and non-glaciated sites.

RESULTS
=======

## Illumina sequencing data

The sequenced dataset consisted of approximately 278 million reads. An analysis of the raw reads using fastQC [@Andrews2010-yx] raised no significant quality issues. Quality score ranges per base and per sequence were high and the N content (ambiguously called bases) was low over the length of the reads. Mean GC content was 42% and was consistent over the non-barcode portion of the reads. 85% of reads matched one of the expected barcodes (allowing up to 2 mismatches) with 4.4 million mean reads per barcode. Reads per sample ranged from 120000--11000000 (Table or figure of read-depths?).

## Separating samples by species

Structure runs using the All-33, All-50, and All-66 datasets with three clusters (K=3, best of 20 replicate runs on each dataset) resulted in similar sample groupings despite the large differences in numbers of loci and levels of missing data in each dataset. Gametophyte samples that were consistently assigned to the group without sporophytes (probability of assignment >= 0.900 and lower bound of the confidence interval >= 0.800) in all three Structure analyses were classified as _C. intricatum_ (29 samples) for subsequent analyses. Gametophyte samples consistently assigned to a group containing sporophytes (probability of assignment >= 0.100) in all three datasets were assigned to the species of the sporophytes with which they grouped (6 _V. boschiana_, 3 _D. petersii_). All remaining gametophyte samples were assigned as "Unknown" (12 samples)(Table 1, Figure 5). Several of the Unknown samples have low numbers of reads or loci, which may be causing them to be inconsistently assigned in the three structure runs. However two samples with large numbers of reads consistently had large proportions of their ancestry assigned to both _C. intricatum_ and _V. boschiana_, and two had large proportions assigned to both _C intricatum_ and _D. petersii_, suggesting that at least some of the Unknown samples might contain a mixture of gametophyte species or gametophytes produced by hybrid sporophytes.

Neighbor-joining Euclidean distance trees generally support the gametophyte assignments based on Structure, with samples for each species grouped together (Figure 6). There is also some support for the subgroupings of Unknown samples. One clade includes all of the _D. petersii_ samples and the two Unknown samples suspected to be mixed _C. intricatum_ + _D. petersii_, and another clade contains all of the _V. boschiana_ samples, both of the samples suspected to be _C. intricatum_ + _V. boschiana_, and all but one of the remaining Unknown samples.

Analyses of observed heterozygosity levels and deviation from Hardy Weinberg equilibrium support differences between samples classified as different species as well. Approximately 28% of loci in _C. intricatum_ samples and 4% of loci in Unknown samples were not in Hardy Weinberg equilibrium, whereas none of the loci in _D. petersii_ or _V. boschiana_ samples were identified as deviating from HWE. Mean observed heterozygosity was higher in _C. intricatum_ samples (29%) than  _D. petersii_ (12%), _V. boschiana_ (8%), or Unknown samples 12%), and this difference was statistically significant (F=33.91, df=3, p<2e-16).

HERE OR DISCUSSION? Seven samples were apparently a different species than what was suspected based on geographic location or proximity to sporophytes. Four suspected C. intricatum samples appear to be V. boschiana samples, one suspected D. petersii is C. intricatum, and two suspected V. boschiana samples are D. petersii. In addition, four samples may contain mixtures of more than one species of gametophyte or hybrid gametophytes including S20, that was suspected to be V. boschiana but consistently groups with either C. intricatum gametophytes or D. petersii sporophytes, but never with V. boschiana sporophytes. MORE DETAIL ABOUT WHY EACH SAMPLE WAS ORIGINALLY SUSPECTED? DISCUSS WHAT THIS MEANS ABOUT OUR ABILITY TO ID GAMETOPHYTES BASED ON PRESENCE/ABSENCE OF SPOROPHYTES

## Investigating genetic variation in _C. intricatum_

Removing the non-_Crepidomanes_ loci did not have a large effect on the total number of loci in the Unknown-filtered dataset relative to the Unknown-unfiltered dataset (5% of total loci filtered; Table 3), likely because even a non-_Crepidomanes_ locus present in all of the Unknown samples would not meet the 50% minimum sample coverage cutoff. Individual samples differed in the proportion of loci with signal (not missing data) that were lost (Table 4), but Unknown samples lost an average of 20% of their loci with signal, whereas _C. intricatum_ samples only lost an average of 4%, and this difference is statistically significant (t=3.49, df=6.13, p-value = 0.012). As expected, removing the non-_Crepidomanes_ loci had even less effect on the total number of loci in the _C. intricatum_ filtered dataset relative to the _C. intricatum_ unfiltered dataset, with only 2% of total loci filtered (Table 3; Table 4).

Structure runs using the Unknown-unfiltered subset of the data suggest that most of the Unknown samples cluster separately from the _C. intricatum_ samples (Figure 7a USE K2 FROM EACH). Most of the _C. intricatum_ samples have tye majority of their ancestry assigned to one cluster, whereas five of the seven Unknown samples have the majority of their ancestry assigned to the other cluster.  After filtering non-_Crepidomanes_ loci (Figure 7b) this apparent difference between _C. intricatum_ and Unknown samples remains.





It is possible that these two samples are actually mixed samples and the other 13 just appeared to be mixed due to insufficient genetic signal. However, it is also possible that the attempt to bioinformatically remove non-_Crepidomanes_ genetic signal was not successful and that removing the loci present in the _V. boschiana_ and _D. petersii_ samples did not remove a large enough proportion of the non-_Crepidomanes_ loci. In either case, because we could not determine whether the mixed/unknown samples cluster separately because of variation in _C. intricatum_ genetic signal or because of genetic signal from other species, the remaining analyses focused only on the 26 _C. intricatum_ samples. The results for unfiltered and filtered _C. intricatum_ datasets were similar to each other and yielded identical inferences, so only results for the _C. intricatum_-filtered dataset are presented.

Analysis of K-means and Evanno's delta-K for the C. intricatum + mixed/unknown data subsets suggested that the samples cluster optimally into 2--6 groups (Figure 9; Figure 11), but for the _C. intricatum_ samples the optimal number of clusters appears to be just one (Figure 10; Figure 11). Structure results using K=2 divide the ancestry for every sample between two clusters with no clear geographic pattern (Figure 8).

Mantel tests failed to find evidence of isolation by distance (r~m~=0.129, p=0.099 with 999 permutations). Using Pearson's product-moment correlation, geographic and genetic distance are weakly correlated (r=0.129) and this correlation is statistically significantly different from zero (t = 2.349, df = 323, p=0.01943), but examination of genetic distance at different geographic scales suggests that the correlation is due to lower genetic distances in within-collection comparisons (Figure 14). The distribution of genetic distances is similar for within-site, within-region, and between region comparisons and the correlation between geographic and genetic distance (r=0.081) is not statistically significant when only including comparisons at these scales (t = 1.4177, df = 305, p-value = 0.1573).

The Neighbor-joining Euclidean distance tree (Figure 12) and the Minimum spanning network (Figure 13) support the lack of genetic structure identified by Structure and the apparent lack of isolation by distance. Tip branch lengths are long relative to internal branches and samples from the same site or even the same collection do not consistently form monophyletic groups or distinct clusters.

Comparison of "expected clones" (samples from the same collection)? Pairwise distance between samples from the same collection are not zero. They range from some of the lowest pairwise distances to some in the XXth percentile of ranked pairwise distances. Is this due to actual genetic variation between these samples (i.e., they are NOT identical clones) or due to noise/error in the GBS process? To test this we sampled cleaned/filtered reads from a single sample to make multiple new "artificial clone samples" with the same number of reads as the original sampes. We then replaced the reads from the original samples with the artificial clone samples and ran the dataset through the ipyrad pipeline. The genetic distances between the artificial clone samples ranged from XXX to XXX or the XXth to XXth percentile of ranked distances.

NOTE-Reasons not to use the Crep+Mixed analysis:
  In the Genetic distance vs Geographic distance plot, it is clear that Mixed vs Mixed and Crep vs Mixed pairwise comparisons are higher than Crep vs Crep, suggesting that the Mixed samples are more distant.
  In NJ trees for the Mixed datasets, the branch lengths on Mixed samples are longer than Crep samples. And Mixed samples tend to group together: S20 & S21, S12 & S13 (& almost S25)
  Structure assignments and NJ trees are very similar for filtered and unfiltered datasets, suggesting removing Non-Crep loci had little effect.

DISCUSSION
==========
NOTE- Primary focus on the 3 species story. Secondary focus on the lack of genetic structure and variation(?) and what that means for our ability to distinguish between hypotheses.

NOTE- on hypotheses:

Every population of gametophytes was established recently or anciently by dispersal:
  - spores
    - from nearby sporophytes
    - from far away sporophytes
  - gemmae
    - from nearby gametophytes
    - from far away gametophytes

Every population is maintained by:
  * reproduction
    - asexual gametophyte reproduction (clonal growth)
    - sexual reproduction (cryptic sporophytes)
  * dispersal:
    - spores
      - from nearby sporophytes
      - from far away sporophytes
    - gemmae
      - from nearby gametophytes
      - from far away gametophytes

The different hypotheses for how these populations were established and maintained are just based on different combinations of these. Some are more likely than others. Some are very likely explanations for many populations but are not possible for populations in glaciated areas or for the first population. When considering the first population, does liklihood of an establishment hypothesis even matter? It just had to happen once.

NOTE- Compare to Devil's Hole Pupfish system. Similar questions about establishment with similar possible timeframes. Well funded and researched due to high conservation interest, no issues with ploidy, no issues with asexual reproduction, potential source populations are nearby... but they still can't reach a consensus.

QUESTIONS- If I had 2 samples that really were genetically identical clones, how big would the genetic distance between them be just due to PCR/sequencing errors, allele sampling, and missing data? Because I don't have any true replicates (the same DNA extraction run twice in the library) I don't have a reference for this so I don't know if the differences between my samples represent "real" genetic differences or GBS noise.

ACKNOWLEDGEMENTS
================
NOTE- U of U CHPC for computing resources, Zach Gompert for guidance on library prep


REFERENCES
==========
