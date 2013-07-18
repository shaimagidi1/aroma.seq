library("aroma.seq")
fullTest <- (Sys.getenv("_R_CHECK_FULL_") != "")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup (writable) local data directory structure
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pathD <- system.file("exData", package="aroma.seq")
for (dir in c("annotationData")) {
  copyDirectory(file.path(pathD, dir), to=dir, overwrite=FALSE)
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup FASTA reference file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
path <- file.path("annotationData", "organisms", "LambdaPhage")
fa <- FastaReferenceFile("lambda_virus.fa", path=path)
print(fa)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Build FASTA index file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fai <- buildIndex(fa, verbose=-10)
print(fai)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Build BWA index file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if (fullTest && isCapableOf(aroma.seq, "bwa")) {
  is <- buildBwaIndexSet(fa, method="is", verbose=-10)
  print(is)
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Build Bowtie2 index file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if (fullTest && isCapableOf(aroma.seq, "bowtie2")) {
  is <- buildBowtie2IndexSet(fa, verbose=-10)
  print(is)
}