TabulateArea <- function (x, z,digits = 0, na.rm = TRUE) { 
  vals <- getValues(r) 
  zones <- round(getValues(z), digits = digits)
  rDT <- data.table(vals, z=zones)
  Zstat <- count(rDT) 
  colnames(Zstat)<-c("vals", "ID","freq")
  output <- dcast(data=Zstat, ID ~ vals , value.var="freq")
  output[,2:ncol(output)] <- apply(output[,2:ncol(output)], 2, function(i) i/sum(i, na.rm=T))
  return(output)}


