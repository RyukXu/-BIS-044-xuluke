#读取CSV文件

csv_data <- read.csv("d:\\task\\TBQ05.20211116133909.csv", encoding="UTF-8")
print(is.data.frame(csv_data))  # 查看是否是数据框
print(ncol(csv_data))  # 列数
print(nrow(csv_data))  # 行数
#View(csv_data)
#head(csv_data)
#1.将值转换为数字。
csv_data[10]=as.numeric(unlist(csv_data[10]))

#2.将所有“NA”值替换为零。
csv_data[is.na(csv_data)] <- 0

#3.在控制台上打印所有季度和所有港口的总吨位的地区贸易明细，如下所示：
#"all regions of trade" 
data1 <- subset(csv_data, Region.of.Trade=="All regions of trade")
paste("tonnage$Region.of.Trade: All regions of trade ",colSums(data1[10]) )

#"Coastal trade" 
data2 <- subset(csv_data, Region.of.Trade=="Coastal trade")
paste("tonnage$Region.of.Trade: Coastal trade " ,colSums(data2[10]) )


#"Foreign trade: Great Britain and Northern Ireland" 
data3 <- subset(csv_data, Region.of.Trade=="Foreign trade: Great Britain and Northern Ireland")
paste("tonnage$Region.of.Trade: Foreign trade: Great Britain and Northern Ireland " ,colSums(data3[10]) )

#"Foreign trade: Non-EU" 
data4 <- subset(csv_data, Region.of.Trade=="Foreign trade: Non-EU")
paste("tonnage$Region.of.Trade: Foreign trade: Non-EU " ,colSums(data4[10]) )

#"Foreign trade: Other EU" 
data5 <- subset(csv_data, Region.of.Trade=="Foreign trade: Other EU")
paste("tonnage$Region.of.Trade: Foreign trade: Other EU " ,colSums(data5[10]) )

#"Foreign trade: Other ports" 
data6 <- subset(csv_data, Region.of.Trade=="Foreign trade: Other ports")
paste("tonnage$Region.of.Trade: Foreign trade: Other ports " ,colSums(data6[10]) )

