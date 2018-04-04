library(knitr)
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
einnahmen <- rbind.data.frame(
  c("07.10.2017", "Till",	      20),
  c("11.10.2017", "Martina",    20),
  c("11.10.2017", "Willi",	    30),	
  c("16.10.2017", "Friederike", 20),
  c("16.10.2017", "Fabian",	    20),
  c("17.10.2017", "Andreas",    20),			
  c("03.11.2017", "Manuel",	    20),			
  c("08.11.2017", "Sinem",	    20),			
  c("30.01.2018", "Martina",    10),			
  c("13.02.2018", "Andreas",    10),			
  c("13.02.2018", "Manuel",	    10),			
  c("13.02.2018", "Friederike",	10),			
  c("15.02.2018", "Till",	      10),			
  c("18.02.2018", "Willi",      20)
)
colnames(einnahmen) <- c("Datum","Name","Betrag")

ausgaben <- rbind.data.frame(
  c("Kaffee", 109),
  c("Milch",  8),
  c("Milch",  8),
  c("Milch",  8),
  c("Kaffee", 96),
  c("Milch",  8)
)
colnames(ausgaben) <- c("Ausgabe","Betrag")
stand <- paste("Aktueller Stand:", sum(as.numeric.factor(einnahmen$Betrag))-sum(as.numeric.factor(ausgaben$Betrag)),
"Euro")
print(stand)

filenam <- file("README.md")
writeLines(c(stand,"\n",kable(ausgaben,format = "markdown"),"\n",kable(einnahmen,format = "markdown")), filenam)
close(filenam)
