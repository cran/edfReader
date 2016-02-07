## ------------------------------------------------------------------------
libDir <- system.file ("extdata", package="edfReader")
CFile <- paste (libDir, '/edfPlusC.edf', sep='') # a continuously recorded EDF file
DFile <- paste (libDir, '/bdfPlusD.bdf', sep='') # discontinuously recorded BDF file

## ------------------------------------------------------------------------
library (edfReader)
CHdr  <- readEdfHeader (CFile)            
DHdr  <- readEdfHeader (DFile)                  

## ------------------------------------------------------------------------
CHdr
summary (DHdr)

## ------------------------------------------------------------------------
CHdr$sHeader
summary (DHdr$sHeader)

## ------------------------------------------------------------------------
CSignals <- readEdfSignals (CHdr)
DSignals <- readEdfSignals (DHdr)

## ------------------------------------------------------------------------
someCSignalsPeriod <- readEdfSignals (CHdr, signals=c(3, "5", "sine 8.5 Hz"), from=5.1, till=18)
annoDSignalsPeriod <- readEdfSignals (DHdr, signals='Annotations', from=5.1, till=18)

## ------------------------------------------------------------------------
someCSignalsPeriod
summary (DSignals)

## ------------------------------------------------------------------------
someCSignalsPeriod[[1]]
summary (CSignals$pulse)         # a signals has its label as its name

## ------------------------------------------------------------------------
CDSignals <- readEdfSignals (DHdr, from=5.1, till=18)
FDSignals <- readEdfSignals (DHdr, fragments=TRUE)

## ------------------------------------------------------------------------
CDSignals[[8]]
summary (CDSignals$`sine 8.5 Hz`)      # note the "`" quotes for a name with spaces.

## ------------------------------------------------------------------------
FDSignals[[8]]
summary (FDSignals$`sine 8.5 Hz`) 

## ------------------------------------------------------------------------
CSignals$`EDF Annotations`
summary(annoDSignalsPeriod)

## ------------------------------------------------------------------------
str (CHdr,  max.level=1)

## ------------------------------------------------------------------------
str (CHdr$sHeader, max.level=1)

## ------------------------------------------------------------------------
str(CSignals$pulse, max.level=1) 

## ------------------------------------------------------------------------
str(FDSignals$`sine 8.5 Hz`, max.level=1) 

## ------------------------------------------------------------------------
str(FDSignals$`sine 8.5 Hz`$fragments[[1]], max.level=1) 

## ------------------------------------------------------------------------
str(CSignals$`EDF Annotations`, max.level=1) 

## ------------------------------------------------------------------------
str(CSignals$`EDF Annotations`$annotations, max.level=1) 

