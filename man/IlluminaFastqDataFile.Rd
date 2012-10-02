%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  IlluminaFastqDataFile.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{IlluminaFastqDataFile}
\docType{class}
\alias{IlluminaFastqDataFile}


 \title{The abstract IlluminaFastqDataFile class}

 \description{
  Package:  aroma.seq \cr
\bold{Class IlluminaFastqDataFile}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.filesets]{FullNameInterface}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.filesets]{GenericDataFile}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[aroma.seq]{FastqDataFile}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\emph{\code{IlluminaFastqDataFile}}\cr

\bold{Directly known subclasses:}\cr
\cr

public abstract static class \bold{IlluminaFastqDataFile}\cr
extends \emph{\link[aroma.seq]{FastqDataFile}}\cr



  A IlluminaFastqDataFile object represents a FASTQ data file.
 }

 \usage{IlluminaFastqDataFile(...)}

 \arguments{
   \item{...}{Arguments passed to \code{\link{FastqDataFile}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{getBarcodeSequence} \tab  -\cr
 \tab \code{getDefaultSamReadGroup} \tab  -\cr
 \tab \code{getFlowcellId} \tab  -\cr
 \tab \code{getInstrumentId} \tab  -\cr
 \tab \code{getLane} \tab  -\cr
 \tab \code{getPlatform} \tab  -\cr
 \tab \code{getPlatformUnit} \tab  -\cr
 \tab \code{getSampleName} \tab  -\cr
}


 \bold{Methods inherited from FastqDataFile}:\cr
as.character, getCommonSeqWidth, getDefaultSamReadGroup, getGeometry, getSamReadGroup, nbrOfSeqs, setSamReadGroup

 \bold{Methods inherited from GenericDataFile}:\cr
getParentName, compareChecksum, copyTo, equals, fromFile, getAlias, getAttribute, getAttributes, getChecksum, getCreatedOn, getDefaultFullName, getExtension, getExtensionPattern, getFilename, getFilenameExtension, getFileSize, getFileType, getLastAccessedOn, getLastModifiedOn, getOutputExtension, getPath, getPathname, gunzip, gzip, hasBeenModified, isFile, readChecksum, renameTo, renameToUpperCaseExt, setAlias, setAttribute, setAttributes, setAttributesBy, setAttributesByTags, setExtensionPattern, testAttributes, validateChecksum, writeChecksum

 \bold{Methods inherited from FullNameInterface}:\cr
appendFullNameTranslator, appendFullNameTranslatorBycharacter, appendFullNameTranslatorBydata.frame, appendFullNameTranslatorByfunction, appendFullNameTranslatorBylist, appendFullNameTranslatorByNULL, appendFullNameTranslatorByTabularTextFile, appendFullNameTranslatorByTabularTextFileSet, clearFullNameTranslator, clearListOfFullNameTranslators, getDefaultFullName, getFullName, getFullNameTranslator, getListOfFullNameTranslators, getName, getTags, hasTag, hasTags, setFullName, setFullNameTranslator, setListOfFullNameTranslators, setName, setTags, updateFullName

 \bold{Methods inherited from Object}:\cr
asThis, getChecksum, $, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, registerFinalizer, save


 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

 \seealso{
   An object of this class is typically part of an
   \code{\link{FastqDataSet}}.
 }
\keyword{classes}