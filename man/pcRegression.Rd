% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pcRegression.R
\name{pcRegression}
\alias{pcRegression}
\title{pcRegression}
\usage{
pcRegression(pca.data, batch, n_top = 20, tol = 1e-16)
}
\arguments{
\item{pca.data}{a list as created by 'prcomp', pcRegression needs
\itemize{
 \item \code{x} -
the principal components (PCs, correctly: the rotated data) and
\item \code{sdev} - the standard deviations of the PCs)
}}

\item{batch}{vector with the batch covariate (for each cell)}

\item{n_top}{the number of PCs to consider at maximum}

\item{tol}{truncation threshold for significance level, default: 1e-16}
}
\value{
List summarising principal component regression
\itemize{
 \item \code{maxVar} - the variance explained by principal component(s)
 that correlate(s) most with the batch effect
 \item \code{PmaxVar} - p-value (returned by linear model) for the
 respective principal components (related to \code{maxVar})
 \item \code{pcNfrac} - fraction of significant PCs among the \code{n_top} PCs
 \item \code{pcRegscale} - 'scaled PC regression', i.e. total variance of PCs which correlate significantly with batch covariate (FDR<0.05) scaled by the total variance of \code{n_top} PCs
 \item \code{maxCorr} - maximal correlation of \code{n_top} PCs with batch covariate
 \item \code{maxR2} - maximal coefficient of determination of \code{n_top} PCs with batch covariate
 \item \code{msigPC} - scaled index of the smallest PC that correlates significantly with batch covariate (FDR<0.05), i.e. \code{msigPC=1} if PC_1 is significantly correlated with the batch covariate and \code{msigPC=0} if none of the \code{n_top} PCs is significantly correlated
 \item \code{maxsigPC} - similar to \code{msigPC}, scaled index of the PC with maximal correlation of \code{n_top} PCs with batch covariate
 \item \code{R2Var} - sum over Var(PC_i)*r2(PC_i and batch) for all i
\item \code{ExplainedVar} - explained variance for each PC
\item \code{r2} - detailed results of correlation (R-Square) analysis
}
}
\description{
pcRegression does a linear model fit of principal components
and a batch (categorical) variable
}
\examples{
    testdata <- create_testset_multibatch(n.genes=1000, n.batch=3, plattform='any')
    pca.data <- prcomp(testdata$data, center=TRUE)
    pc.reg.result <- pcRegression(pca.data, testdata$batch)
}
