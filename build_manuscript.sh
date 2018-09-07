#! /bin/bash

# Convert markdown manuscript with citations to docx
pandoc -s -S --reference-doc=./custom-reference.docx --bibliography=citations.bib --csl=ecology.csl -o Builds/Crepidomanes_GBS_manuscript_$(date +%Y%m%d).docx Crepidomanes_GBS_manuscript.md ;

# Convert markdown figures section to docx
pandoc -s -S --reference-doc=./custom-reference-landscape.docx -o Builds/Crepidomanes_GBS_manuscript_figures_$(date +%Y%m%d).docx Crepidomanes_GBS_manuscript_figures.md ;

# Tables are already in doc format...
