#!/usr/bin/env Rscript

############################################################################
# DESCRIPTION:
# This script shows how to (1) align single-end DNAseq reads in FASTQ files
# to the human genome (FASTA file), (2) count the aligned reads (BAM files)
# in uniformely distributed 50kb bins (UGP file), (3) normalize the counts
# for amount of GC-content in each bins (UNC file), and (4) finally
# segment the normalized DNAseq total copy-number counts using
# Circular Binary Segmentation (CBS) and (5) generate an interactive
# Chromosome Explorer report viewable in the browser.
#
# REQUIREMENTS:
# fastqData/
#  AlbertsonD_2012-SCC/
#   Homo_sapiens/
#    <sample>_<barcode>_L[0-9]{3}_R[12]_[0-9]{3}.fastq [private data]
#
# annotationData/
#  chipTypes/
#   GenericHuman/
#    GenericHuman,50kb,HB20090503.ugp [1]
#    GenericHuman,50kb,HB20121021.unc [1]
#  organisms/
#   Homo_sapiens/
#    human_g1k_v37.fasta [2]
#
# REFERENCES:
# [1] http://aroma-project.org/data/annotationData/chipTypes/GenericHuman/
# [2] ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/
#                                                   human_g1k_v37.fasta.gz
############################################################################
library("aroma.seq");
verbose <- Arguments$getVerbose(-10, timestamp=TRUE);

dataSet <- "AlbertsonD_2012-SCC";
organism <- "Homo_sapiens"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Reference genome
path <- file.path("annotationData", "organisms", organism);
filename <- "human_g1k_v37.fasta";
fa <- FastaReferenceFile(filename, path=path);
print(fa);

# Binning reference (by 50kb)
ugp <- AromaUgpFile$byChipType("GenericHuman", tags="50kb");
print(ugp);

# Binned nucleotide-content reference
# (created from BSgenome.Hsapiens.UCSC.hg19 Bioconductor reference)
unc <- getAromaUncFile(ugp);
print(unc);

# FASTQ data set
path <- file.path("fastqData", dataSet, organism);
ds <- IlluminaFastqDataSet$byPath(path);
print(ds);


# Work with a subset of all FASTQ files
ds <- extract(ds, 1:3);
print(ds);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Single-end alignment
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Build BWA index set (iff missing)
is <- buildBwaIndexSet(fa, verbose=verbose);
print(is);

# In addition to SAM read group data inferred from the Illumina FASTQ
# files, manual set the library information for the whole data set.
setSamReadGroup(ds, SamReadGroup(LB="MPS-034"));

# BWA with BWA 'aln' options '-n 2' and '-q 40'.
alg <- BwaAlignment(ds, indexSet=is, n=2, q=40);
print(alg);

bs <- process(alg, verbose=verbose);
print(bs);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Count reads per bin
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
bc <- TotalCnBinnedCounting(bs, targetUgp=ugp);
print(bc);

ds <- process(bc, verbose=verbose);
verbose && print(verbose, ds);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Normalize GC content (and rescale to median=2 assuming diploid)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
bgn <- BinnedGcNormalization(ds);
verbose && print(verbose, bgn);

dsG <- process(bgn, verbose=verbose);
verbose && print(verbose, dsG);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Segmentation of tumors and normals independently (without a reference)
# and generation of a Chromosome Explorer report
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
seg <- CbsModel(dsG, ref="constant(2)", maxNAFraction=2/3);
verbose && print(verbose, seg);

ce <- ChromosomeExplorer(seg);
verbose && print(verbose, ce);
process(ce, verbose=verbose);



############################################################################
# HISTORY:
# 2012-10-21
# o Now a self-contained script from FASTQ to segmentation.
# o Now we can do CbsModel(..., ref="constant(2)").
# 2012-10-11
# o Now generating a Chromosome Explorer report.
# o Added TotalCnBinnedCounting() which calculates bin counts centered
#   at target loci specified by an UGP annotation file and outputs an
#   AromaUnitTotalCnBinarySet data set of DNAseq bin counts.
# 2012-10-10
# o Now plotting whole-genome TCN tracks, where data is loaded chromosome
#   by chromosome. Also utilizing generic UGP files.
# 2012-10-02
# o Created.
############################################################################
