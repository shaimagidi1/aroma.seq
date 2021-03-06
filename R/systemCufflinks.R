###########################################################################/**
# @RdocDefault systemCufflinks
#
# @title "Calls the Cufflinks executable to perform isoform abundance estimation"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{commandName}{A @character string specifying the Cufflinks command.}
#   \item{...}{Arguments specifying the Cufflinks command line.}
#   \item{system2ArgsList}{Named list of arguments to pass to internal system2 call.}
#   \item{.fake}{If @TRUE, the executable is not called.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# @author "TT"
#
# @keyword internal
#*/###########################################################################

## TODO:  Add version restriction on cufflinks (cufflinks2, cuffdiff2); doesn't support --version option though!

setMethodS3("systemCufflinks", "default", function(commandName="cufflinks",
                                                   ...,
                                                   system2ArgsList=list(stdout=FALSE),
                                                   .fake=FALSE, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Arguments '...':
  dotArgs <- list(...);  ## list with one item named 'args'; these are the arguments to *cufflinks*

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Calling Cufflinks executable");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Locate executable
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  bin <- findCmd(commandName, verbose=less(verbose, 50));
  verbose && cat(verbose, "Executable: ", bin);

  verbose && cat(verbose, "Arguments passed to system2():");
  verbose && str(verbose, system2ArgsList)
  verbose && cat(verbose, "Arguments passed to Cufflinks:");
  verbose && str(verbose, dotArgs);

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Setup command line switches
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ## dotArgs <- trim(dotArgs);
  verbose && cat(verbose, "Command line options:");
  verbose && print(verbose, dotArgs);

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # System call
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && cat(verbose, "System call:");
  cmd <- sprintf("%s %s", bin, paste(dotArgs, collapse=" "));
  verbose && print(verbose, cmd);
  verbose && str(verbose, system2ArgsList);

  verbose && enter(verbose, "system2() call");
  callArgs <- list(command=bin, args=paste(names(dotArgs$args), dotArgs$args, sep=" "))
  callArgs <- c(callArgs, system2ArgsList)

  verbose && str(verbose, callArgs);
  if (!.fake) {
    res <- do.call(what=base::system2, args=callArgs);
  } else {
    res <- "<fake run>";
  }

  verbose && exit(verbose);
  verbose && exit(verbose);
  res;
}) # systemCufflinks()


############################################################################
# HISTORY:
# 2013-02-15
# o Created. TAT
############################################################################
