library("aroma.seq")

fullTest <- isPackageInstalled("qrqc")
if (fullTest) {
  library("qrqc")
  readSeqFile <- aroma.seq::readSeqFile

  path <- system.file("extdata", package="qrqc", mustWork=TRUE)
  struct <- list(pattern=".*/extdata/([^/]*)", replacement=c(dataset="qrqc", organism="foo", sample="\\1"))
  fqs <- FastqDataSet$byPath(path, struct=struct, paired=FALSE)
  print(fqs)

  fq <- fqs[[indexOf(fqs, "test-contam")]]
  print(fq)

  dataR <- readSeqFile(fq)
  print(dataR)

  # Summarize all reads (hash.prop=1)
  dataA <- readSeqFile(fq, hash.prop=1, cache=FALSE)
  dataB <- readSeqFile(fq, hash.prop=1, cache=FALSE)
  stopifnot(all.equal(dataB, dataA))

  # Summarize sampled subset of reads (using identical seeds)
  dataA <- readSeqFile(fq, seed=0xBEEF, cache=FALSE)
  dataB <- readSeqFile(fq, seed=0xBEEF, cache=FALSE)
  stopifnot(all.equal(dataB, dataA))

  # Summarize without any sampling (hash=FALSE + kmer=FALSE)
  dataA <- readSeqFile(fq, hash=FALSE, kmer=FALSE, cache=FALSE)
  dataB <- readSeqFile(fq, hash=FALSE, kmer=FALSE, cache=FALSE)
  stopifnot(all.equal(dataB, dataA))

  # Plotting
  data <- readSeqFile(fq, seed=0xBEEF)
  gg <- basePlot(data)
  print(gg)
  gg <- gcPlot(data)
  print(gg)
  gg <- qualPlot(data)  ## Needs mgcv via ggplot2
  print(gg)
  gg <- seqlenPlot(data)
  print(gg)
  gg <- kmerKLPlot(data)
  print(gg)
} # if (fullTest)
