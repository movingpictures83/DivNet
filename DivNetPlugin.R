library(microbiome)
library(ggplot2)
#library(phyloseq)
library(ape)
library(psadd)
library(DivNet)
set.seed(1234)

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1]; 
   # Need to get the three files
   otu.path <<- parameters["otufile", 2]
   tree.path <<- parameters["tree", 2]
   map.path <<- parameters["mapping", 2]
   #HMP <<- import_qiime(otu.path, map.path, tree.path, parseFunction = parse_taxonomy_qiime)
}
run <- function() {
   #samples.to.keep <<- sample_sums(HMP) >= 1000
   #HMP <<- prune_samples(samples.to.keep, HMP)
   #HMP <<- filter_taxa(HMP, function(x) sum(x >3) > (0.01*length(x)), TRUE)
   physeq <<- read_csv2phyloseq(otu.file=otu.path, taxonomy.file=tree.path, metadata.file=map.path)
divnet_phylum <<-  divnet(tax_glom(physeq, taxrank="Phylum"),
                         X = "Description",
                         ncores = 4)
   #print(str(divnet_phylum$shannon))
   #mytree = rtree(ntaxa(physeq), rooted=TRUE, tip.label=taxa_names(physeq))
   #physeq <<- merge_phyloseq(physeq, mytree)
}
output <- function(outputfile) {
  #height = 10*300); #,)
  #result <<- PCoA(physeq)
  #print(summarize_phyloseq(physeq))
  #y <- transform(physeq, transform="shift", shift=0.001)
  #x <- transform(physeq, transform="clr")#, shift=0.001)
  dput(divnet_phylum$shannon, outputfile)
  #write.csv(da_analysis$discriminant_taxa_DV, paste(outputfile,"DV","csv", sep="."))
  #y <- plot_sparsity(p0)
  #print(str(y))
  #print(str(y$data))
  #write.csv(evendata, outputfile)
}
#input("plugins/Bar/example/parameters.txt")
#run()
#output("plugins/Bar/example/yes.pdf")

