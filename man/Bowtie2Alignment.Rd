%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  Bowtie2Alignment.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{Bowtie2Alignment}
\docType{class}
\alias{Bowtie2Alignment}


\title{The Bowtie2Alignment class}

\description{
 Package:  aroma.seq \cr
\bold{Class Bowtie2Alignment}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[aroma.core]{ParametersInterface}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[aroma.seq]{AromaSeqTransform}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[aroma.seq]{AbstractAlignment}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.seq]{FileGroupsInterface}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{Bowtie2Alignment}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{Bowtie2Alignment}\cr
extends \link[aroma.seq]{FileGroupsInterface}\cr



 ...
}

\usage{
Bowtie2Alignment(..., groupBy=NULL, indexSet=NULL)
}

\arguments{
 \item{...}{Arguments passed to \code{\link{AbstractAlignment}}.}
 \item{groupBy}{A \code{\link[base]{character}} string or an explicit named \code{\link[base]{list}},
  specifying which input files should be processed together.}
 \item{indexSet}{An \code{\link{Bowtie2IndexSet}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{getOutputDataSet} \tab  -\cr
 \tab \code{process} \tab  -\cr
}


 \bold{Methods inherited from FileGroupsInterface}:\cr
getGroupBy, getGroupNames, getGroups, getInputDataSet, nbrOfGroups, validateGroups

 \bold{Methods inherited from AbstractAlignment}:\cr
as.character, getAcronym, getAsteriskTags, getIndexSet, getOrganism, getOutputDataSet, getRootPath, isPaired

 \bold{Methods inherited from AromaSeqTransform}:\cr
as.character, findFilesTodo, getAcronym, getAsteriskTags, getFlavor, getFullName, getInputDataSet, getName, getOptionalArguments, getOrganism, getOutputDataSet, getParameters, getPath, getRootPath, getTags, isDone, length, process, setTags

 \bold{Methods inherited from ParametersInterface}:\cr
getParameterSets, getParameters, getParametersAsString

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, names, objectSize, print, save, findRspReportTemplate, asThis


}

\section{Supported operating systems}{
  This method is available on Linux, OSX, and Windows [1].
}

\author{Henrik Bengtsson and Pierre Neuvial}

\references{
 [1] Bowtie2, John Hopkins University, 2013.
     \url{http://bowtie-bio.sourceforge.net/bowtie2/}
}
\keyword{classes}
