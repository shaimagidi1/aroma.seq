#!/usr/bin/env Rscript

############################################################################
#
############################################################################
library("aroma.seq");


dataSet <- "AlbertsonD_2012-SCC,bwa,is";
organism <- "Homo_sapiens";

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Annotation data
path <- file.path("annotationData", "organisms", organism);
filename <- "human_g1k_v37.fasta";
fa <- FastaReferenceFile(filename, path=path);
print(fa);

tags <- c("SNPs", "chr1-25");
ugp <- AromaUgpFile$byChipType("GenericHuman", tags=tags);
print(ugp);

# Data set
path <- file.path("bwaData", dataSet, organism);
bs <- BamDataSet$byPath(path);
print(bs);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Count allele for chromosome 22
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ac <- GatkAlleleCounting(bs, targetUgp=ugp, fa=fa);
print(ac);
dsC <- process(ac, verbose=verbose);
print(dsC);


############################################################################
# HISTORY:
# 2012-10-31
# o Created.
############################################################################
