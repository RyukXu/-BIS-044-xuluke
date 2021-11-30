#读取CSV文件

csv_data <- read.csv("d:\\task\\TBQ05.20211116133909.csv", encoding="UTF-8")
print(is.data.frame(csv_data))  # 查看是否是数据框
print(ncol(csv_data))  # 列数
print(nrow(csv_data))  # 行数
View(csv_data) #查看列表
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

#4从英国和爱尔兰北部抵达的季度吨位数据生成散点图 
#过滤港口数据
data9 <- subset(data3, Port!="All Main Irish Ports")
#修改列名
names(data9)[names(data9) == 'VALUE'] <- 'Tonnage'
#View(data9) 
#安装colorspace包,只需安装一次
#install.packages('colorspace', depend=TRUE)
#导入程序包，如果报错，先执行 install.packages('colorspace', depend=TRUE)
library("ggplot2")

# 基函数：colour设置分组
ggplot(data9, aes(x = Quarter, y = Tonnage, colour = Port)) +
# 生成散点图函数
geom_point()+
#生成散点图标题
ggtitle(label = 'Quartely Tonnage Arriving From Great Britain and Northern Ireland')

