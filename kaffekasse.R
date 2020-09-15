library(knitr)
#library(rChoiceDialogs)
#setwd(rchoose.dir())
setwd("~/Work/Verwaltung/Kaffeekasse")

as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
einnahmen <- rbind.data.frame(
  c("15.09.2020", "Manuel", 40),
  c("15.09.2020", "Andreas",    50),
  c("15.09.2020", "Willi",      15),
  c("2019", "Andreas",    11+20),
  c("2019", "Friederike", 11+20),
  c("2019", "Hauke",      20),
  c("2019", "Kevin",      35),
  c("2019", "Willi",      20+20),
  c("2018", "Andreas",    10+20+20),			
  c("2018", "Friederike",	10+20),			
  c("2018", "Hauke",      20),
  c("2018", "Kevin",      30+20),
  c("2018", "Manuel",	    10+20),			
  c("2018", "Martina",    10+30),
  c("2018", "Till",       20),
  c("2018", "Willi",      20+30),
  c("2017", "Andreas",    20),			
  c("2017", "Fabian",	    20),
  c("2017", "Friederike", 20),
  c("2017", "Manuel",	    20),			
  c("2017", "Martina",    20),
  c("2017", "Sinem",	    20),			
  c("2017", "Till",	      20+10),			
  c("2017", "Willi",	    30)
)
colnames(einnahmen) <- c("Datum","Name","Betrag")

ausgaben <- rbind.data.frame(
  c("15.09.2020", "Kaffee 10kg (real)", 80),
  c("15.09.2020", "Wasserfilter (real)", 37),
  c("15.09.2020", "Entkalker (amazon)", 10),
  c("2017-2019", "Kaffee+Milch+Reinigungskrams", 109+96+118+20+99+78+30 + 8*9 + 20+19)
)
colnames(ausgaben) <- c("Datum","Ausgabe","Betrag")
stand <- paste("**Aktueller Stand:", sum(as.numeric.factor(einnahmen$Betrag))-sum(as.numeric.factor(ausgaben$Betrag)),
"Euro**")
print(stand)

filenam <- file("README.md")
writeLines(c(stand,"\n",kable(ausgaben,format = "markdown"),"\n",kable(einnahmen,format = "markdown")), filenam)
close(filenam)

