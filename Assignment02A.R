#Rprogram to find time until end of semester #30/50 -10 date calculation incorrect -10 no rproj file

#difftime function
var.1 <- difftime(Sys.Date(),"2020-12-3",units= "days")
cat("Luke, the number of days until the end of the semester is",var.1)

