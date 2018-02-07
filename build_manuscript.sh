#! /bin/bash

# Convert markdown manuscript with citations to odt
pandoc -s -S --reference-odt=./custom-reference.odt --bibliography=citations.bib --csl=ecology.csl -o Builds/Crepidomanes_GBS_manuscript_$(date +%Y%m%d).odt Crepidomanes_GBS_manuscript.md ;

# Convert markdown figures section to odt
pandoc -s -S --reference-odt=./custom-reference-landscape.odt -o Builds/Crepidomanes_GBS_manuscript_figures_$(date +%Y%m%d).odt Crepidomanes_GBS_manuscript_figures.md ;

# Tables are already in odt format...
