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


  * What we know about Crepidomanes intricatum and other filmies in north america. Be sure to include something about how gametophytes found growing near sporophytes are assumed to be the same species as the sporophyte, whereas gametophytes found growing without sporophytes nearby are assumed to be C. intricatum and individual patches are assumed to represent single clones.
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

51 suspected C. intricatum, D. petersii, or V. boschiana gametophyte samples and three D.petersii or V. boschiana sporophyte samples collected between 1965 and 2007 were selected to represent much of the known range of C. intricatum. Samples included populations from previously glaciated areas, from multiple sites in some geographic regions, and from multiple patches in some sites. In addition, multiple DNA samples were taken from some collections to look for variation within presumed clones (Table 1, Figure 2).

## DNA extraction



## Library preparation and sequencing



## Identifying loci and calling genotypes
  * ipyrad analysis
    - read clustering level selection
    - SNP detection and filtering)


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
