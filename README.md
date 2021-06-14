# DivNet
# Language: R
# Input: TXT (keyword-value pairs)
# Output: TXT
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: corncob_0.2.0, psadd_0.1.3, ape_5.4-1, microbiome_1.12.0, ggplot2_3.3.3, phyloseq_1.34.0, DivNet_0.3.7

PluMA plugin to run the DivNet algorithm for estimating diversity when taxa co-occur.

The plugin expects as input a tab-delimited parameters file, with the following keys (inputs are phyloseq-formatted)

otufile: Taxa abundances
mapping: Metadata
tree: Taxa phylogeny 

The plugin outputs alpha-diversity in TXT format.

