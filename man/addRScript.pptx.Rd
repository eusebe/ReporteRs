% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/addRScript.pptx.R
\name{addRScript.pptx}
\alias{addRScript.pptx}
\title{Add R script into a pptx object}
\usage{
\method{addRScript}{pptx}(doc, rscript, file, text, append = FALSE, ...)
}
\arguments{
\item{doc}{\code{\link{pptx}} object where expressions have to be added}

\item{rscript}{an object of class \code{RScript}.
Not used if file or text is provided.}

\item{file}{R script file. Not used if text or
rscript is provided.}

\item{text}{character vector. The text to parse.
Not used if file or rscript is provided.}

\item{append}{boolean default to FALSE. If TRUE, paragraphs will be
appened in the current shape instead of beeing sent into a new shape.
Paragraphs can only be appended on shape containing paragraphs (i.e. you
can not add paragraphs after a FlexTable).}

\item{...}{further arguments, not used.}
}
\value{
an object of class \code{\link{pptx}}.
}
\description{
Add R script into a \code{\link{pptx}} object.
}
\details{
You have to one of the following argument: file or text or rscript.
}
\examples{
#START_TAG_TEST
doc.filename = "addRScript_example.pptx"

# set default font size to 24
options( "ReporteRs-fontsize" = 24 )

doc = pptx( title = "title" )

# add a slide with layout "Title and Content"
doc = addSlide( doc, slide.layout = "Title and Content" )

doc = addTitle( doc, "Title example 1" )
doc = addRScript(doc, text = "x = rnorm(100)
plot(density( x ) )" )

# Write the object
writeDoc( doc, file = doc.filename )
#STOP_TAG_TEST
}
\seealso{
\code{\link{pptx}}, \code{\link{addRScript}}
}

