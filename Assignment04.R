##reading an excel file## 
install.packages("readxl")
install.packages ("tidyverse")
install.packages ("writexl")
library("writexl")
library(readxl)
library(tidyverse)
dataset1 <-read_excel("C:/Users/luke1/OneDrive/Desktop/dataset1.xls")
## "Aldermen" with "Alderman" and replaces
dataset1[dataset1 == "Aldermen"] <- "Alderman"
dataset1[dataset1 == "Clerk"] <- "Clerk of Court"
dataset1[dataset1 == "Constable(s)"] <- "Constable"
dataset1[dataset1 == "Mayor-President"] <- "Mayor"
str_count(dataset1, "Council Member") > 0
dataset1[str_count(dataset1, "Council Member") > 0] <- "Council Member"
dataset1[str_count(dataset1, "Councilman") > 0] <- "Council Member"
dataset1[str_count(dataset1, "Judge") > 0] <- "Judge"
dataset1[str_count(dataset1, "Justice of the Peace") > 0] <- "Justice of the Peace"

##Any and all version of "Council Member" or "Councilman" with "Council Member"
##Any and all versions of "Judge" with "Judge"
##Any and all versions of "Justice of the Peace" with "Justice of the Peace"
write_xlsx(dataset1,"abc.xls")