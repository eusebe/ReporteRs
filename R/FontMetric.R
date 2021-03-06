#' @title Font metric
#'
#' @description get font metric from a font name and a size
#' 
#' @param fontfamily font name
#' @param fontsize font size
#' @export 
FontMetric = function( fontfamily, fontsize ){
	#cat("FontMetric(fontfamily='", fontfamily, "', fontsize=", fontsize, ")\n", sep = "" )
	#Could run check.fontfamily(fontname) but has already been done in device call init.
	
	fontMetric = .jnew(class.fontMetric, fontfamily, as.integer( fontsize ) )
	widths = list()
	info = list()
	for(ff in 0:3){
		widths[[ff+1]] = .jcall( fontMetric, "[I", "getWidths", as.integer( ff ) )
		info[[ff+1]] = .jcall( fontMetric, "[I", "getStr", as.integer( ff ) )
	}
	widths = as.integer( unlist( widths ) )
	info = as.integer( unlist( info ) )
	#names(info)=c("ascent", "descent", "height")
	list( info = info, widths = widths )
}

#' @title Compute the width of a string
#'
#' @description Compute the width of a string. Internal use.
#' 
#' @param value string value
#' @param fontfamily font name
#' @param fontsize font size
#' @param fontface font face
#' @export 
reporters_str_width = function( value, fontfamily, fontsize, fontface ){
	fontMetric = .jnew(class.fontMetric, fontfamily, as.integer( fontsize ) )
	width = .jcall( fontMetric, "I", "getWidth", as.integer( fontface ), value )
	list( width = as.integer(width) )
}
