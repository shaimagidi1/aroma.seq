###########################################################################/**
# @RdocDefault systemGenericCmd
#
# @title "Wrapper to call 'command' using system2()"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{command}{Name of command to run}
#   \item{...}{Additional arguments specifying TopHat command line switches.}
#   \item{.fake}{If @TRUE, the executable is not called.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# @author
#*/###########################################################################
setMethodS3("systemGenericCmd", "default", function(command=NULL,
                                                    ...,
                                                    system2ArgsList=list(),  ## For now, explicitly split off arguments to be passed to system2
                                                    .fake=FALSE, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Arguments '...':
  if (is.null(command)) {
    throw("Argument 'command' is null; supply the name of a command to run")
  }

  dotArgs <- list(...);  ## list with one item named 'args'; these are the arguments to *genericCmd*

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, paste("Calling", command, "executable"));

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Locate executable
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  bin <- findCmd(command, verbose=less(verbose, 50));
  verbose && cat(verbose, "Executable: ", bin);

  verbose && cat(verbose, "Arguments passed to system2():");
  verbose && str(verbose, system2ArgsList)
  verbose && cat(verbose, paste("Arguments passed to", command));
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
    cat("<fake run>\n")
    res <- "<fake run>";
  }

  verbose && exit(verbose);
  verbose && exit(verbose);
  res;
}) # systemGenericCmd


############################################################################
# HISTORY:
# 2013-03-08
# o TT:  Created.
############################################################################