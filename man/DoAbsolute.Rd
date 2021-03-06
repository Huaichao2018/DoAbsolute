% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DoAbsolute.R
\name{DoAbsolute}
\alias{DoAbsolute}
\title{Automate ABSOLUTE calling for multiple samples in parallel way}
\usage{
DoAbsolute(
  Seg,
  Maf = NULL,
  sigma.p = 0,
  max.sigma.h = 0.2,
  min.ploidy = 0.5,
  max.ploidy = 10,
  primary.disease = NA,
  platform = c("SNP_6.0", "Illumina_WES", "SNP_250K_STY"),
  temp.dir = file.path(tempdir(), "Absolute"),
  clean.temp = FALSE,
  results.dir = getwd(),
  max.as.seg.count = 1500,
  max.non.clonal = 0.05,
  max.neg.genome = 0.005,
  copy.num.type = c("total", "allelic"),
  min.mut.af = 0.1,
  min.no.mut = 5,
  verbose = FALSE,
  nThread = 1L,
  keepAllResult = TRUE,
  recover = FALSE
)
}
\arguments{
\item{Seg}{a \code{data.frame} or a file (path) contains columns
"Sample", "Chromosome", "Start", "End", "Num_Probes", "Segment_Mean".}

\item{Maf}{MAF, default is \code{NULL}, can provided as \code{data.frame} or file path.}

\item{sigma.p}{Provisional value of excess sample level variance used for mode search. Default: 0}

\item{max.sigma.h}{Maximum value of excess sample level variance (Eq. 6). Default: 0.2}

\item{min.ploidy}{Minimum ploidy value to consider. Solutions implying lower ploidy values will be discarded. Default: 0.5}

\item{max.ploidy}{Maximum ploidy value to consider. Solutions implying greater ploidy values will be discarded. Default: 10}

\item{primary.disease}{Primary disease of the sample. Default: \code{NA}}

\item{platform}{one of "SNP_6.0", "Illumina_WES", "SNP_250K_STY". Default: "SNP_6.0"}

\item{temp.dir}{directory path used to store tempory files. Default: Absolute subdirectory under \code{tempdir()}}

\item{clean.temp}{if \code{TRUE}, auto-clean temp dir at the end. Default: \code{FALSE}}

\item{results.dir}{directory path used to store result files. Default: work directory}

\item{max.as.seg.count}{Maximum number of allelic segments. Samples with a higher segment count will be flagged as 'failed'. Default: 1500}

\item{max.non.clonal}{Maximum genome fraction that may be modeled as non-clonal (subclonal SCNA). Solutions implying greater values will be discarded. Default: 0.05}

\item{max.neg.genome}{Maximum genome fraction that may be modeled as non-clonal with copy-ratio below that of clonal homozygous deletion. Solutions implying greater values will be discarded. Default: 0.005}

\item{copy.num.type}{The type of copy number to be handled. Either total or allelic. Total is what this package for. Default: "total"}

\item{min.mut.af}{Minimum mutation allelic fraction. Mutations with lower allelic fractions will be filtered out before analysis. Default: 0.1}

\item{min.no.mut}{Minor allele frequency file, or NULL if one is not available. This specifies the data for somatic point mutations to be used by ABSOLUTE. Default: 5}

\item{verbose}{if \code{TRUE}, print extra info. Default: \code{FALSE}}

\item{nThread}{number of cores used for computation. Default: 1L}

\item{keepAllResult}{if \code{TRUE}, clean all results, otherwise clean result directory and keep most important results. Default: \code{TRUE}}

\item{recover}{if \code{TRUE}, recover previous unfinished work.
This is helpful when program stop unexpectedly when \code{clean.temp} is FALSE. Default: \code{FALSE}}
}
\description{
An example can be found at \href{https://github.com/ShixiangWang/DoAbsolute#example}{README}.
If calling for a sample failed, the error message will be written to
\code{error.log} under result directory.
}
\details{
\href{https://www.nature.com/articles/nbt.2203}{ABSOLUTE} is a famous software
developed by Broad Institute, however the \code{RunAbsolute} function is designed for
computing one sample each time and set no default values. \strong{DoAbsolute} help
user set default parameters according to \href{http://software.broadinstitute.org/cancer/software/genepattern/modules/docs/ABSOLUTE}{ABSOLUTE documentation}, provide an uniform interface to
input data easily and run RunAbsolute parallelly.

More detail about how to analyze ABSOLUTE results please see \href{http://software.broadinstitute.org/cancer/software/genepattern/analyzing-absolute-data}{this link}.
}
\references{
Carter, Scott L., et al. "Absolute quantification of somatic DNA alterations in human cancer." Nature biotechnology 30.5 (2012): 413.
}
\author{
Shixiang Wang \href{mailto:w_shixiang@163.com}{w_shixiang@163.com}
}
