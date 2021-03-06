#####################################################################

# set default font size to 10
options( "ReporteRs-fontsize" = 10 )

# a summary of mtcars
dataset = aggregate( mtcars[, c("disp", "mpg", "wt")]
  , by = mtcars[, c("cyl", "gear", "carb")]
  , FUN = mean )
dataset = dataset[ order(dataset$cyl, dataset$gear, dataset$carb), ]


# set cell padding defaut to 2
baseCellProp = cellProperties( padding = 2 )

# Create a FlexTable with data.frame dataset
MyFTable = FlexTable( data = dataset
  , body.cell.props = baseCellProp
  , header.cell.props = baseCellProp
  , header.par.props = parProperties(text.align = "right" )
)

# set columns widths (inch)
MyFTable = setFlexTableWidths( MyFTable, 
	widths = c(0.5, 0.5, 0.5, 0.7, 0.7, 0.7) )

# span successive identical cells within column 1, 2 and 3
MyFTable = spanFlexTableRows( MyFTable, j = 1,
	runs = as.character( dataset$cyl ) )
MyFTable = spanFlexTableRows( MyFTable, j = 2, 
	runs = as.character( dataset$gear ) )
MyFTable = spanFlexTableRows( MyFTable, j = 3, 
	runs = as.character( dataset$carb ) )

# overwrites some text formatting properties
MyFTable[dataset$wt < 3, 6] = textProperties( color="#003366")
MyFTable[dataset$mpg < 20, 5] = textProperties( color="#993300")

# overwrites some paragraph formatting properties
MyFTable[, 1:3] = parProperties(text.align = "center")
MyFTable[, 4:6] = parProperties(text.align = "right")


Footnote1 = Footnote(  )

par1 = pot("About this reference", textBold( ) )
par2 = pot("Omni ab coalitos pro malivolus obsecrans graviter 
cum perquisitor perquisitor pericula saepeque inmunibus coalitos ut.", 
  textItalic(font.size = 8) )
Footnote1 = addParagraph( Footnote1, set_of_paragraphs( par1, par2 ), 
  parProperties(text.align = "justify"))

Footnote1 = addParagraph( Footnote1, 
	set_of_paragraphs( "list item 1", "list item 2" ), 
  parProperties(text.align = "left", list.style = "ordered"))

an_rscript = RScript( text = "ls()
x = rnorm(10)" )
Footnote1 = addParagraph( Footnote1, an_rscript )

MyFTable[1, 1, newpar = TRUE] = pot("a note", 
  footnote = Footnote1, format = textBold(color="gray") )

pot_link = pot(" (link example)", textProperties( color = "cyan" ), 
  hyperlink = "http://www.wikipedia.org/" )

MyFTable[1, 1, to = "header"] = pot_link

# applies a border grid on table
MyFTable = setFlexTableBorders( MyFTable, footer=TRUE
  , inner.vertical = borderProperties( color = "#666666" )
  , inner.horizontal = borderProperties( color = "#666666" )
  , outer.vertical = borderProperties( width = 2, color = "#666666" )
  , outer.horizontal = borderProperties( width = 2, color = "#666666" )
)
