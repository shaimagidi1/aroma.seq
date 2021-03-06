findSamtools <- function(...) {
  # Aroma-specific variable
  path <- getExternalHome("SAMTOOLS_HOME");
  versionPattern <- c(".*Version:[ ]*([0-9.-]+).*");
  findExternal(command="samtools", path=path, versionPattern=versionPattern, ...);
} # findSamtools()


############################################################################
# HISTORY:
# 2012-09-25
# o Created.
############################################################################
