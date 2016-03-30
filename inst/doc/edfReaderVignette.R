## ------------------------------------------------------------------------
libDir <- system.file ("extdata", package="edfReader")
AFile <- paste (libDir, '/edfAnnonC.edf', sep='') # a file with 2 annotation signals
BFile <- paste (libDir, '/bdfPlusC.bdf' , sep='') # a continuously recorded BDF file
CFile <- paste (libDir, '/edfPlusC.edf' , sep='') # a continuously recorded EDF file
DFile <- paste (libDir, '/edfPlusD.edf' , sep='') # a discontinuously recorded EDF file

## ------------------------------------------------------------------------
require (edfReader)
AHdr  <- readEdfHeader (AFile)
BHdr  <- readEdfHeader (BFile)
CHdr  <- readEdfHeader (CFile)            
DHdr  <- readEdfHeader (DFile)                  

## ------------------------------------------------------------------------
BHdr
summary (AHdr)

## ------------------------------------------------------------------------
AHdr$sHeader
summary (CHdr$sHeader)

## ------------------------------------------------------------------------
ASignals <- readEdfSignals (AHdr)
ASignals

## ------------------------------------------------------------------------
DSignals <- readEdfSignals (DHdr)
DSignals

## ------------------------------------------------------------------------
DSignalsF <- readEdfSignals (DHdr, fragments = TRUE)
DSignalsF

## ------------------------------------------------------------------------
CSignals8 <- readEdfSignals (CHdr, signals=c(8, "8", "sine 8.5 Hz"))
CSignals8

## ------------------------------------------------------------------------
ASignalsPeriod    <- readEdfSignals (AHdr, from=0.7, till=1.8)
ASignalsPeriod

## ------------------------------------------------------------------------
CSignals <- readEdfSignals (CHdr)
summary (CSignals$pulse)         # edfReader names signals after their label

## ------------------------------------------------------------------------
CDSignals <- readEdfSignals (DHdr, from=5.1, till=18)
FDSignals <- readEdfSignals (DHdr, fragments=TRUE)

## ------------------------------------------------------------------------
summary (FDSignals$`sine 8.5 Hz`)         # note the "`" quotes for a name with spaces.

## ------------------------------------------------------------------------
CSignals$`EDF Annotations`
summary(ASignalsPeriod$`EDF Annotations`)

## ------------------------------------------------------------------------
format (AHdr$startTime, format="%Y-%m-%d %H:%M:%OS3",  usetz = FALSE)
ASignalsPlusStartTimes <- readEdfSignals(AHdr, signals='EDF Annotations-1', recordStarts=TRUE)
annots <- ASignalsPlusStartTimes$annotations
annots[annots$isRecordStart==TRUE,'onset'][1]

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
str(ASignals$`EDF Annotations`, max.level=1) 

## ------------------------------------------------------------------------
str(ASignals$`EDF Annotations`$annotations, max.level=1) 

