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

50 suspected _C.intricatum_, _D. petersii_, or _V. boschiana_ gametophyte samples, one _D. petersii_ sporophyte sample, and three _V. boschiana_ sporophyte samples collected between 1965 and 2007 were selected to represent much of the known geographic range of _C.intricatum_. Samples included populations from previously glaciated areas, from multiple sites within some geographic regions, and from multiple patches within some sites. In addition, multiple DNA samples were taken from some collections to look for variation within presumed clones (Table 1, Figure 2).

## DNA extraction

Because of the small size of individual gametophytes and their tangled filamentous growth, each sample represents many separate individuals (presumably clones) in close contact with each other in <1 square-cm of silica-dried gametophyte mat. Bryophytes, lichen, sand, and other contaminants were manually separated from the gametophyte tissue under 20X magnification. DNA was extracted from 2--70 mg of cleaned tissue using a CTAB protocol [@Doyle1987-dp] with the following modifications to the cell disruption process. Samples were ground in CTAB buffer in 1.5mL tubes using a pestle attached to an electric drill on its slowest speed setting. While grinding, the tube was bathed in ice and pressure on the drill was applied in 1 second pulses to avoid heating the sample. For samples with less than 10 mg of tissue, 10--50 mg of autoclaved sand was added to improve grinding. Each sample was ground in three rounds of approximately 100 pulses with 100 uL of CTAB buffer in the first round and an additional 200uL added in subsequent rounds (500 uL total). After extraction the DNA was quantified using a Qubit fluorometer (Invitrogen, Carlsbad, California, USA).

## Library preparation and Illumina sequencing

The GBS library was prepared according to an established double-digest restriction site-assiciated DNA sequencing (ddRADseq) protocol [@Gompert2012-ir; @Parchman2012-qm] using restriction enzymes EcoR1 and Mse1. PCR amplification steps were performed using iproof high-fidelity DNA polymerase (New England Biolabs) to minimize PCR error. To maximize the number of homogeneous loci acrossed samples, pooled samples were size selected using Blue Pippen (Sage Science, Beverly, Massachusetts, USA), retaining loci between 250--350 bp. Samples were run on a single lane of Illumina HiSeq with 100 bp single-end sequencing at the University of Utah DNA Sequencing Core facility.

## Identifying loci and calling genotypes

Raw illumina reads were inspected for quality using fastQC [@Andrews2010-yx] and analyzed with ipyRAD v.0.7.1 [@Eaton2014-rr] using default settings except as noted below. Reads were sorted by barcode allowing up to two mismatched bases in the barcode sequence, filtered to remove low quality bases and reads with excessive low quality bases, and trimmed to remove Illumina adapter sequences.

To determine the appropriate clustering threshold for _de novo_ assembly of loci, clustering was performed over a range of threshold values from 0.95 down to 0.80. Higher values risk splitting alleles of a single locus into separate clusters, whereas lower values risk combining paralogs into single clusters. At higher threshold values the average number of clusters in _V. boschiana_ sporophyte samples is higher than in suspected _V. boschiana_ gametophyte samples, as would be expected if the ploidy level of the sporophytes is greater than the gametophytes. As the threshold values decrease the average number of clusters in sporophyte and gametophyte samples become similar, suggesting that multiple alleles in the sporophyte samples are being combined into loci. A threshold value of 0.85 was selected because the number of clusters in _V. boschiana_ sporophyte and gametophyte samples are similar (Figure 2).

Because allozyme studies suggest that _C.intricatum_ gametophytes are diploid [@Farrar1985-ht], samples were treated as diploid for estimating heterozygosity and error rates, and genotype calling in ipyRAD.

Each 35--100 bp locus identified by ipyRAD may contain multiple SNPs. To avoid using tightly linked SNPs, ipyRAD provides output files with genotypes from 1 randomly selected SNP per locus (.stru format). However, this random sampling takes place after loci have been filtered for minimum sample coverage, so some SNPs may not have the requested minimum sample coverage even though the locus they are within does, resulting in higher than expected levels of missing data. Also, because the SNP from each locus is selected randomly at the time the output file is generated, multiple ipyRAD datasets from runs with increasing minimum sample coverage values may result in datasets that are not subsets of each other. To ensure that all the analyses in this study were based on subsets of the same data and only included SNPs with the desired minimum sample coverage, we used ipyRAD to generate a dataset of loci with coverage in six samples and filtered that "base ipyRAD dataset" to the desired minimum sample coverages using a custom python script.

## Separating samples by species

To group samples by species, we generated three datasets from the base ipyRAD dataset including all 54 samples and SNPs present in at least 33%, 50%, and 66% of samples, to balance the risks of using large numbers of loci with much missing data against the risks of using very few loci with high sample coverage (Table 3). Each dataset was analyzed using Structure [@Pritchard2000-ek] with 3 clusters to determine whether each gametophyte sample:
  1. was consistently assigned to a cluster with the _V. boschiana_ sporophytes or _D. petersii_ sporophyte (suggesting that it is likely a gametophyte of one of those species),
  2. was consistently assigned to a cluster without sporophytes (suggesting that it is likely a gametophyte of _C.intricatum_), or
  3. was not consistently assigned to any one cluster (suggesting that it may include a mixture of more than one species of gametophyte, that it may contain hybrid gametophytes, or that there is not sufficient genetic signal to consistently make an assignment).

To further confirm species assignments from Structure, neighbor-joining Euclidean distance trees were generated with the adagenet package in R [@Jombart2008-sq; @Jombart2011-zo] with bootstrap values calculated using the poppr R package in R [@Kamvar2014-de].

Mean observed heterozygosity levels in each species were compared using ANOVA with Tukey HSD post hoc comparisons, and loci were tested for deviation from Hardy Weinberg equilibrium in each species in R.

## Removing non-_Crepidomanes_ genetic signal and investigating genetic variation in _C. intricatum_

To explore genetic variation in _C. intricatum_, gametophyte samples assigned as _C.intricatum_ and gametophytes assigned as _C. intricatum_ or mixed/unknown were further analyzed separately. To see if the genetic signal from _V. boschiana_ and _D. petersii_ in the potentially mixed samples could be removed bioinformatically allowing the _C. intricatum_ genetic signal to be analyzed, loci were identified as "_Crepidomanes_ loci" or "Non-_Crepidomanes_ loci" based on whether they were present in any sample assigned as _D. petersii_ or _V. boschiana_. We hypothesized that removing these non-_Crepidomanes_ loci from a sample with mixed genetic signal would remove loci specific to _D. petersii_ or _V. boschiana_ as well as loci shared between those species and _C. intricatum_, leaving mostly loci unique to _C. intricatum_. Four _C. intricatum_ subsets of the data were generated from the base dataset, with and without mixed/unknown samples, and with and without non-_Crepidomanes_ loci, each using a minimum sample coverage cutoff of 50% (Table 3). Patterns of genetic variation were analyzed using Structure, neighbor-joining Euclidean distance trees, and minimum spanning networks. Isolation by distance was tested using Mantel tests and Pearson's product-moment correlation with adagenet in R, and genetic distances were compared at different geographic scales and between glaciated and non-glaciated sites.

NOTE- WHAT ABOUT basic descriptive population genetic stats (AMOVA, pairwise Fst, obs vs exp het, allelic richness, etc.)? I think most will require grouping samples by region since many sites have only a single sample. How can I actually quantify the amount of variation in my samples? In other words, do I have evidence that Crepidomanes has low levels of genetic variation over its range? Can I get an Fst for all three species? Are there published Fst values for other filmies for comparison?

NOTE- Evanno deltaK? Won't help for Crep-only datasets because it can't tell you if the optimum K=1. Run it on other datasets just so I can say I did it. In the end we will use K=3 on the all species runs because that is the clustering that makes sense for 3 species. On the Crep+Mixed we can use just about any K to show that the mixed samples group separately from the Crep samples. On the Crep-only, pretty much any K will show that the groupings don't make geographic sense and the samples that look the most different also happen to be the samples with lowest locus counts.


RESULTS
=======

## Illumina sequencing data

The sequenced dataset consisted of approximately 278 million reads. An analysis of the raw reads using fastQC [@Andrews2010-yx] raised no significant quality issues. Quality score ranges per base and per sequence were high and the N content (ambiguously called bases) was low over the length of the reads. Mean GC content was 42% and was consistent over the non-barcode portion of the reads. 85% of reads matched one of the expected barcodes (allowing up to 2 mismatches) with 4.4 million mean reads per barcode. All samples had >120000 reads (Table or figure of read-depths?).

## Separating samples by species

Structure runs using the All-33, All-50, and All-66 datasets with three clusters (K=3, best of 20 replicate runs on each dataset) resulted in similar sample groupings despite the large differences in numbers of loci in each dataset. Gametophyte samples that were consistently assigned to the group without sporophytes (probability of assignment and confidence interval >= 0.900 in all three datasets) were classified as _C. intricatum_ (26 samples) for subsequent analyses. Gametophyte samples consistently not assigned to the non-sporophyte group (probability of assignment <=0.100 in all three datasets) were classified as "Not _C. intricatum_" (9 samples) and further assigned to the species of the sporophytes with which they grouped (6 _V. boschiana_, 3 _D. petersii_). All remaining gametophyte samples were classified as "Mixed/unknown" (15 samples), and further assigned as "_C. intricatum_ + _V. boschiana_" (9 samples), "_C. intricatum_ + _D. petersii_" (5 samples), or "_C. intricatum_ + _V. boschiana_ + _D. petersii_" (1 sample) based on which sporophyte cluster they were assigned with highest probability (Table 1, Figure 5). However, it should be noted that because these mixed/unknown samples may not actually represent mixed or hybrid gametophytes, subgroupings within the mixed/unknown samples are speculative.

Neighbor-joining Euclidean distance trees generally support the gametophyte assignments based on Structure, with most samples for each species grouped together and mixed/unknown samples between the groups (Figure 6). There is even some support for many of the subgroupings of mixed/unknown samples. One clade includes all of the _D. petersii_ samples and two of the five suspected mixed _C. intricatum_ + _D. petersii_ samples, and another clade contains all of the _V. boschiana_ samples and seven of the nine suspected mixed _C. intricatum_ + _V. boschiana_ samples.

Analyses of observed heterozygosity levels and deviation from Hardy Weinberg equilibrium support differences between samples classified as different species as well. Approximately 30% of loci in _C. intricatum_ samples and 8% of loci in mixed/unknown samples were not in Hardy Weinberg equilibrium, whereas none of the loci in _D. petersii_ or _V. boschiana_ samples were identified as deviating from HWE. Mean observed heterozygosity was higher in _C. intricatum_ samples (30%) compared to _D. petersii_ (12%), _V. boschiana_ (8%), or mixed/unknown samples 13%), and this difference was statistically significant (F=34.88, df=3, p<2e-16).

## Removing non-_Crepidomanes_ genetic signal

Removing the non-_Crepidomanes_ loci did not have a large effect on the total number of loci in the Mixed-filtered dataset relative to the Mixed-unfiltered dataset (6% of total loci filtered; Table 3), likely because even a non-_Crepidomanes_ locus present in all 15 of the mixed/unknown samples would not meet the 50% minimum sample coverage cutoff. Individual samples differed in the proportion of loci with signal (not missing data) that were lost (Table 4), but mixed/unknown samples lost an average of 19% of their loci with signal, whereas _C. intricatum_ samples only lost an average of 6%, and this difference is statistically significant (t=4.48, df=15.4, p=0.0004). As expected, removing the non-_Crepidomanes_ loci had even less effect on the total number of loci in the _C. intricatum_ filtered dataset relative to the _C. intricatum_ unfiltered dataset, with only 2% of total loci filtered (Table 3; Table 4).

## Investigating genetic variation in _C. intricatum_

Structure runs using the Mixed-unfiltered subset of the data suggest that the mixed/unknown samples cluster separately from the _C. intricatum_ samples (Figure 7a). _C. intricatum_ samples all have most (>90%) of their ancestry assigned to clusters c1 and c2, whereas 12 of the 15 mixed/unknown samples have the majority of their ancestry assigned to other clusters and all 15 have over 10% of their ancestry assigned to other clusters.  After filtering non-_Crepidomanes_ loci (Figure 7b) this apparent difference between _C. intricatum_ and mixed/unknown samples remains, with only two mixed/unknown samples (S07 and S49) losing their ancestry assignments to the other clusters. It is possible that these two sample are actually mixed samples and the other 13 just appear to be mixed due to insufficient genetic signal. However, it is also possible that the attempt to bioinformatically removing non-_Crepidomanes_ genetic signal was not successful and that removing the loci present in the _V. boschiana_ and _D. petersii_ samples did not remove a large enough proportion of the non-_Crepidomanes_ loci. In either case, because we cannot determine whether the mixed/unknown samples cluster separately because of variation in _C. intricatum_ genetic signal or because of genetic signal from other species, the remaining analyses focused only on the 26 _C. intricatum_ samples.

Results using the _C. intricatum_-unfiltered and _C. intricatum_-filtered datasets were similar and analyses using the unfiltered and filtered _C. intricatum_ datasets yielded identical inferences, so only results for the _C. intricatum_-filtered dataset are shown.

 NOTE- IBD:
   * There appears to be slight isolation by distance, but upon closer examination, it appears to be due to the lower genetic distance in within-collection comparisons. Genetic distance is similar for within-site, within-region, and between region comparisons. So, there is evidence of IBD but only at very small geographic distances.

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


REFERENCES
==========
