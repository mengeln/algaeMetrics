
#' Algae data validation
#' 
#' Checks that required columns are present in algae data frame
#' 
#' @export
#' @examples
#' data(algaeSamples)
#' validator(algaeSamples)


validator <- function(data){
  required.fields <- c("StationCode","SampleDate","Replicate", #Helpful but not really required
                       "SampleTypeCode", #Required, can never be blank
                       "FinalID","BAResult","Result", #Required. Blanks OK
                       "ActualOrganismCount" #Required for QC, but allow calculation if missing or blank
  )
  coltest <- required.fields %in% names(data)
  if(!all(coltest))
    stop(do.call(paste, as.list(c("Missing the following columns:", required.fields[!coltest]))))
  
  if(!is.null(data$SampleID))
      required.fields <- c("SampleID", required.fields) 
  
  numCheck <- sapply(data, is.numeric)[c("BAResult", "Result")]
  if(any(!numCheck))
    stop(do.call(paste, as.list(c("The following fields must be numeric:", names(numCheck)[!numCheck]))))
  
  codeCheck <- data$SampleTypeCode %in% c("Integrated", "Microalgae", "Macroalgae", "Epiphyte", "Qualitative")
  if(any(!codeCheck))
    stop(do.call(paste, as.list(c("Unrecognized SampleTypeCode:", unique(data$SampleTypeCode[!codeCheck])))))
  
  data[, required.fields]  
}