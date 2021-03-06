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
\code{~~~~~~~~~~~~+--}\code{\link[aroma.seq]{AromaPathnameInterface}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.seq]{AromaSeqDataFile}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.seq]{FastqDataFile}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~+--}\emph{\code{IlluminaFastqDataFile}}\cr

\bold{Directly known subclasses:}\cr
\cr

public abstract static class \bold{IlluminaFastqDataFile}\cr
extends \emph{\link[aroma.seq]{FastqDataFile}}\cr



 A IlluminaFastqDataFile object represents a FASTQ data file.
}

\usage{
IlluminaFastqDataFile(...)
}

\arguments{
  \item{...}{Arguments passed to \code{\link{FastqDataFile}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{getBarcodeSequence} \tab  -\cr
 \tab \code{getDefaultSamReadGroup} \tab  -\cr
 \tab \code{getFileVersion} \tab  -\cr
 \tab \code{getFlowcellId} \tab  -\cr
 \tab \code{getInstrumentId} \tab  -\cr
 \tab \code{getLane} \tab  -\cr
 \tab \code{getPlatform} \tab  -\cr
 \tab \code{getPlatformUnit} \tab  -\cr
 \tab \code{getReadDirection} \tab  -\cr
 \tab \code{getSampleName} \tab  -\cr
}


 \bold{Methods inherited from FastqDataFile}:\cr
as.character, findMateFile, findRspReportTemplate, getCommonSeqWidth, getDefaultFullName, getDefaultSamReadGroup, getGeometry, getMateFile, getSamReadGroup, isPaired, nbrOfSeqs, readFASTQSummary, readSeqFile, report, setSamReadGroup, splitUp, writeSample

 \bold{Methods inherited from AromaSeqDataFile}:\cr
getDefaultFullName, isCompatibleWith

 \bold{Methods inherited from AromaPathnameInterface}:\cr
directoryStructure, getOrganism

 \bold{Methods inherited from GenericDataFile}:\cr
as.character, clone, compareChecksum, copyTo, equals, fromFile, getAttribute, getAttributes, getChecksum, getChecksumFile, getCreatedOn, getDefaultFullName, getExtension, getExtensionPattern, getFileSize, getFileType, getFilename, getFilenameExtension, getLastAccessedOn, getLastModifiedOn, getOutputExtension, getPath, getPathname, gunzip, gzip, hasBeenModified, is.na, isFile, isGzipped, linkTo, readChecksum, renameTo, renameToUpperCaseExt, setAttribute, setAttributes, setAttributesBy, setAttributesByTags, setExtensionPattern, testAttributes, validate, validateChecksum, writeChecksum, directoryItem, directoryItems, directoryStructure, directoryStructure<-, getDataSetName, getOrganismName, getSampleName, loadCacheFile, loadCacheFileItem, memoizedCall2, saveCacheFile, saveCacheFileItem, getParentName

 \bold{Methods inherited from FullNameInterface}:\cr
appendFullNameTranslator, appendFullNameTranslatorByNULL, appendFullNameTranslatorByTabularTextFile, appendFullNameTranslatorByTabularTextFileSet, appendFullNameTranslatorBycharacter, appendFullNameTranslatorBydata.frame, appendFullNameTranslatorByfunction, appendFullNameTranslatorBylist, clearFullNameTranslator, clearListOfFullNameTranslators, getDefaultFullName, getFullName, getFullNameTranslator, getListOfFullNameTranslators, getName, getTags, hasTag, hasTags, resetFullName, setFullName, setFullNameTranslator, setListOfFullNameTranslators, setName, setTags, updateFullName

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, names, objectSize, print, save, findRspReportTemplate, asThis


}

\author{Henrik Bengtsson}

\seealso{
  An object of this class is typically part of an
  \code{\link{FastqDataSet}}.
}
\keyword{classes}
