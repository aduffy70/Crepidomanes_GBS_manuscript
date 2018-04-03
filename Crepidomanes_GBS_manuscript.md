---
title: "Bad working title: population genetics of independent gametophytes using genotyping-by-sequencing"
author: Aaron M. Duffy, Don R. Farrar, Paul G. Wolf
---

ABSTRACT
========

INTRODUCTION
============
The "typical" fern lifecycle consists of alternating independent generations of diploid sporophytes and haploid gametophytes. The sporophyte is generally larger, longer-lived and has a more complex structure than the gametophyte [@Sheffield1994-jv] and their drastically different morphologies can result in different environmental or habitat requirements. However, in order for the entire lifecycle to occur, the same site must be suitable for the spore to germinate, the gametophyte to survive to produce gametes, the gametes to unite, and the sporophyte to survive to produce spores. All of these diverse processes must be supported in one location, though not necessarily at the same time [@Peck1990-th]. Some fern species are capable of asexual reproduction and subsequent dispersal in one or both generations, allowing individuals, clones, or colonies of either sporophytes or gametophytes to persist in places where the other cannot. This ability for gametophytes to survive and spread, even if the habitat in a particular time or place is not suitable for sporophytes may play an important role in long-distance fern dispersal and colonization [@Sato1982-uh; @Dassler2001-zv; @Ebihara2013-iq].

It is not noteworthy to observe sporophytes and not find gametophytes growing at the same site (since the gametophytes tend to be shorter-lived and more difficult to see), so most examples demonstrating differences in habitat requirements between life stages are situations where gametophyte colonies are found growing independent of sporophytes. For example, sporophytes and gametophytes of _Callistopteris baueriana_ (Endl.) Copel. are found in wet, high altitude forests of the Hawaiian islands, whereas, only gametophytes are found at drier, lower locations [@Dassler1997-vo]. Several other species have gametophytes found over a larger geographic or environmental range than the sporophytes, including _Trichomanes speciosum_ Willd. (Hymenophyllaceae) in the British Isles, Europe and Canary Islands [@Ratcliffe1993-rx; @Rumsey1998-yx; @Rumsey1999-au; @Kingston2005-kn], _Hymenophyllum wrightii_ Bosch (Hymenophyllaceae) on the northwest coast of North America [@Persson1958-vl; @Iwatsuki1961-wa; @Taylor1967-au; @Duffy2015-ol], and _Crepidomanes schmidtianum_ (Zenker ex Taschner) K. Iwats. (Hymenophyllaceae) in Japan and Korea [@Lee2014-df]. All of these ferns have gametophytes that are long-lived and capable of clonal growth and asexual reproduction.

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

50 suspected _C.intricatum_, _D. petersii_, or _V. boschiana_ gametophyte samples, one _D. petersii_ sporophyte sample, and three _V. boschiana_ sporophyte samples collected between 1965 and 2007 were selected to represent much of the known range of _C.intricatum_. Samples included populations from previously glaciated areas, from multiple sites within some geographic regions, and from multiple patches within some sites. In addition, multiple DNA samples were taken from some collections to look for variation within presumed clones (Table 1, Figure 2).

## DNA extraction
Because of the small size of individual gametophytes and their tangled filamentous growth, each sample represents many separate individuals (likely clones) growing in close contact with each other (<1 square-cm of silica-dried gametophyte mat). Bryophytes, lichen, sand, and other contaminants were manually separated from the gametophyte tissue under 20X magnification. DNA was extracted from 2--70 mg of cleaned tissue using a CTAB protocol [@Doyle1987-dp] with the following modifications to the cell disruption process. Samples were ground in CTAB buffer in 1.5mL tubes using a pestle attached to an electric drill on its slowest speed setting. While grinding, the tube was bathed in ice and pressure on the drill was applied in 1 second pulses to reduce heating the sample. For samples with less than 10 mg of tissue, 10--50 mg of autoclaved sand was added to improve grinding. Each sample was ground in three rounds of approximately 100 pulses, with 100 uL of CTAB buffer in the first round and an additional 200uL added in subsequent rounds (500 uL total). After extraction the DNA was quantified using a Qubit fluorometer (Invitrogen, Carlsbad, California, USA).

## Library preparation and sequencing
The GBS library was prepared according to an established double-digest restriction site-assiciated DNA sequencing (ddRADseq) protocol [@Gompert2012-ir; @Parchman2012-qm] using restriction enzymes EcoR1 and Mse1. PCR amplification steps were performed using iproof high-fidelity DNA polymerase (New England Biolabs) to minimize PCR error. To maximize the number of homogeneous loci acrossed samples, pooled samples were size selected using Blue Pippen (Sage Science, Beverly, Massachusetts, USA), retaining loci between 250--350 bp. Samples were run on a single lane of Illumina HiSeq with 100 bp single-end sequencing at the University of Utah DNA Sequencing Core facility.


## Identifying loci and calling genotypes
Raw illumina reads were inspected for quality using fastQC [@Andrews2010-yx] and analyzed with ipyRAD v.0.7.1 [@Eaton2014-rr] using default settings except as noted below. Reads were sorted by barcode allowing up to two mismatched bases in the barcode sequence, filtered to remove low quality bases and reads with excessive low quality bases, and trimmed to remove Illumina adapter sequences and restriction enzyme overhangs.

To determine the appropriate clustering threshold for de novo assembly, clustering was performed over a range of threshold values from 0.95 down to 0.80. Higher values risk splitting alleles into separate clusters, whereas lower values risk combining paralogs into single clusters. At higher threshold values the average number of clusters in _V. boschiana_ sporophyte samples is higher than in suspected _V. boschiana_ gametophyte samples, as would be expected if the ploidy level of the sporophytes is greater than the gametophytes. As the threshold values decrease the average number of clusters in sporophyte and gametophyte samples become similar, suggesting that multiple alleles in the sporophyte samples are being combined into loci. A threshold value of 0.85 was selected because the number of clusters in _V. boschiana_ sporophyte and gametophyte samples are similar (Figure 2).

Because allozyme studies suggest that _C.intricatum_ gametophytes are diploid [@Farrar1985-ht], samples were treated as diploid for estimating heterozygosity and error rates, and genotype calling in ipyRAD.

When ipyRAD generates ".stru" output files (structure file format with 1 randomly selected SNP per locus), some SNPs may not have the requested minimum sample coverage even though the locus they are within does, resulting in higher than expected levels of missing data. Also, because the SNP from each locus is selected randomly at the time the output file is generated, multiple ipyRAD datasets from runs with increasing minimum sample coverage values will have SNPs that are not subsets of each other. To ensure that all the analyses in this study were based on subsets of the same data, we used ipyRAD to generate a dataset of loci with coverage in six samples and filtered that dataset (the "base dataset") to the desired minimum sample coverages using a custom python script.

To group samples by species, we generated three datasets including all 54 samples and SNPs present in >33%, >50%, and >66% of loci. Each dataset was analyzed using Structure [@Pritchard2000-ek] with 3 groups to determine whether each gametophyte sample:
  1. is consistently assigned to a group with the _V. boschiana_ sporophytes or _D. petersii_ sporophyte (suggesting that it is a gametophytes of one of those species),
  2. is consistently assigned to a group without sporophytes (suggesting that it is a gametophyte of _C.intricatum_), or
  3. is not consistently assigned to a species (suggesting that it may include a mixture of more than one species of gametophyte, that it may contain hybrid gametophytes, or that there just is not enough genetic signal to clearly make an assignment).

To further confirm species assignments, neighbor-joining Euclidean distance trees were generated with the adagenet package in R [@Jombart2008-sq; @Jombart2011-zo].

To explore genetic variation in C. intricatum, gametophyte samples assigned as _C.intricatum_ and gametophytes assigned as _C. intricatum_ or mixed/unknown (_C.intricatum_ + Mixed) were further analyzed separately. To see if non-C.intricatum genetic signal in the potentially mixed samples could be removed bioinformatically, loci were identified as "C. intricatum-specific loci" or "possibly non-C. intricatum loci" based on whether they were present in any sample assigned as _D. petersii_ or _V. boschiana_. Datasets were generated from the base dataset with only the samples assigned as _C. intricatum_ and with only the _C. intricatum_ + Mixed samples, including only loci present in 50% of samples, with and without possibly non-C. intricatum loci. Patterns of genetic variation in each dataset were analyzed using Structure and neighbor-joining Euclidean distance trees. Isolation by distance was tested using Mantel tests and Pearson's product-moment correlation with adagenet in R.


## Identifying samples to species
* All-sample analysis to identify species
  * PCR species tests
  * structure
  * Distance trees


## Analyzing _Crepidomanes intricatum_ samples
* Crepidomanes-only analysis
  * Comparison of locus subgroups (Hobs0, Hmax, and 3-genotype loci)
    * BLAST to look for contaminants here? I'd have to be able to trace SNPs back to locus consensus sequences.
  * structure
  * Distance trees/heatmaps
  * Isolation by Distance
    * Over the entire geographic range
    * At smaller geographic scales (just within Southern Illinois?)
    * What is the average genetic distance of samples within a single sample? From a single site? Within a single region? How does that compare to the landscape average?
    * To get distances:
      * Verified lat, lon values for sites
      * Used coordinatepairs.py to get generate all possible pairs of sites with their coordinates
      * Used batch distance calculator to calculate distances between site-pairs.
      * For pairs from the same collection, converted 0 distance to 0.00005 km (5cm)
      * For pairs from the same site but different collections, changed 0 distance to 0.1 km (100m)
    * Do mantel tests for IBD
    * Compare mean distance of within-collection, within-site, within region (<100km) and between region pairwise distance comparisons.



RESULTS
=======
 * A better plot to show the process for deciding on a clustering level would be to plot cluster level on the x and number of clusters on the Y with a set of points for the average of the Vbos sporophytes and set of points for an equal number of Vbos gametophytes with similar numbers of reads.
 * IBD:
   * There appears to be slight isolation by distance, but upon closer examination, it appears to be due to the lower genetic distance in within-collection comparisons. Genetic distance is similar for within-site, within-region, and between region comparisons. So, there is evidence of IBD but only at very small geographic distances.

DISCUSSION
==========
Notes on hypotheses:
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


REFERENCES
==========
