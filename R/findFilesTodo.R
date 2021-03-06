###########################################################################/**
# @RdocGeneric findFilesTodo
# @alias findFilesTodo.AromaSeqTransform
# @alias findFilesTodo.TotalCnBinnedCounting
#
# @title "Identifies which files are not yet processed"
#
# \description{
#   @get "title".
# }
#
# \usage{
#  @usage findFilesTodo,AromaSeqTransform
#  @usage findFilesTodo,TotalCnBinnedCounting
# }
#
# \arguments{
#  \item{...}{Not used.}
# }
#
# \value{
#   Returns a @vector of named indices.
# }
#
# \seealso{
#   Internally \code{getOutputDataSet(..., onMissing="NA")} is utilized.
# }
#
# @author "HB"
#
# @keyword internal
#*/###########################################################################
setMethodS3("findFilesTodo", "TotalCnBinnedCounting", function(this, ...) {
  res <- getOutputDataSet(this, onMissing="NA");
  isFile <- unlist(sapply(res, FUN=isFile), use.names=FALSE);
  todo <- !isFile;
  todo <- which(todo);
  if (length(todo) > 0L) {
    ds <- getInputDataSet(this);
    names(todo) <- getNames(ds[todo]);
  }
  todo;
})



############################################################################
# HISTORY:
# 2013-11-16
# o CLEANUP: Replaced several implementations of findFilesTodo() with
#   one for AromaSeqTransform.
# 2013-11-15
# o Extracted all findFilesTodo() methods and document them under the
#   same generic function.
# o Added findFilesTodo() for PicardDuplicateRemoval.
# 2013-11-11
# o Added findFilesTodo() for AbstractAlignment.
############################################################################
