library("aroma.seq")

fullTest <- (Sys.getenv("_R_CHECK_FULL_") != "")
fullTest <- fullTest && isCapableOf(aroma.seq, "bwa")
if (fullTest) {


# Setup (writable) local data directory structure
setupExampleData()

dataSet <- "TopHat-example"
organism <- "Lambda_phage"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup FASTA reference file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fa <- FastaReferenceFile$byOrganism(organism)
print(fa)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup FASTQ set
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fqs <- FastqDataSet$byName(dataSet, organism=organism, paired=FALSE)
print(fqs)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Single-end alignment
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
bams <- doBWA(fqs, reference=fa, verbose=-20)
print(bams)

# Display individual BAM files
for (ii in seq_along(bams)) print(bams[[ii]])


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Single-end alignment on gzip'ed FASTQ files
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Gzip data set
dataSetZ <- sprintf("%s,gz", dataSet);
pathZ <- file.path("fastqData", dataSetZ, organism);
for (ii in seq_along(fqs)) {
  fq <- fqs[[ii]]
  pathnameZ <- file.path(pathZ, sprintf("%s.gz", getFilename(fq)))
  if (!isFile(pathnameZ)) gzip(getPathname(fq), pathnameZ, remove=FALSE)
}
fqsZ <- FastqDataSet$byName(dataSet, tags="gz", organism=organism, paired=FALSE)

bamsZ <- doBWA(fqsZ, reference=fa, verbose=-20)
print(bamsZ)


# Results should be same with and without gzip'ed FASTQ files
stopifnot(length(bamsZ) == length(bams))
stopifnot(identical(getFullNames(bamsZ), getFullNames(bams)))
for (ii in seq_along(bams)) {
  bam <- bams[[ii]]
  bamZ <- bamsZ[[ii]]
  
  ## Index files should be the same
  bai <- getIndexFile(bam)
  baiZ <- getIndexFile(bamZ)
  stopifnot(getChecksum(baiZ) == getChecksum(bai))
  
  ## However, checksums may different because read groups
  ## such as 'CL' contain full system call used, which
  ## includes full pathnames.
  ## stopifnot(getChecksum(bamZ) == getChecksum(bam))
}


} # if (fullTest)


############################################################################
# HISTORY:
# 2013-08-22
# o Created.
############################################################################
