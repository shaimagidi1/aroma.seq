###########################################################################/**
# @RdocDefault findGATK
# \alias{GATK_HOME}
#
# @title "Locates the GATK executable"
#
# \description{
#  @get "title" on the current system.
# }
# 
# @synopsis
#
# \arguments{
#   \item{mustExists}{If @TRUE, an exception is thrown if the executable
#      could not be located.}
#   \item{...}{Not used.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \details{
#  The GATK tools directory is searched for as follows:
#  \enumerate{
#   \item \code{Sys.getenv("GATK_HOME")}
#  }
# }
#
# @author
#*/###########################################################################
setMethodS3("findGATK", "default", function(mustExists=TRUE, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'mustExists':
  mustExists <- Arguments$getLogical(mustExists);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Locating GATK software");

  command <- "GATK";
  verbose && cat(verbose, "Command: ", command);

  path <- Sys.getenv("GATK_HOME");
  verbose && printf(verbose, "System variable 'GATK_HOME': '%s'\n", path);
  if (path == "") path <- NULL;
 
  if (mustExists && (is.null(path) || !isDirectory(path))) {
    throw(sprintf("Failed to located GATK tools"));
  }

  path <- Arguments$getReadablePath(path);
  verbose && cat(verbose, "Located directory: ", path);

  # Get main GATK jar file
  filename <- "GenomeAnalysisTK.jar";
  pathname <- Arguments$getReadablePathname(filename, path=path);
  verbose && cat(verbose, "Located main jar file: ", pathname);

  verbose && exit(verbose);

  pathname;
}) # findGATK()


############################################################################
# HISTORY:
# 2012-09-28
# o Created.
############################################################################