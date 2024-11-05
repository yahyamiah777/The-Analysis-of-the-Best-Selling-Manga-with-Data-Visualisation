#necessary tools and setting correct working directory


install.packages("tidyverse")
install.packages("ggplot2")
library(tidyverse)
library(ggplot2)
setwd("G:\\Data Visualisation Coursework")


#read csv to create dataset
best_selling_manga <- read_csv("best-selling-manga.csv")
best_selling_manga


#Distribution of Best-Selling Manga by Demographic
ggplot(best_selling_manga, aes(x = Demographic)) + geom_bar(fill = "blue") + labs(title = "Manga Sales Brakedown by Demographic", x = "Demographic", y = "Manga Sales in Millions") 


#Shonen investigation
shonen_data <- subset(best_selling_manga, subset = Demographic =="Shōnen")
print(shonen_data)

top_shonen_by_sales <- shonen_data %>% arrange(desc(`Approximate sales in million(s)`)) %>% slice_head(n=5)
ggplot(top_shonen_by_sales, aes(x = `Manga series`, y = `Approximate sales in million(s)`)) + geom_bar(stat = "identity", fill = "green") + labs(title ="Top 5 Best-Selling Shōnen Manga", x = "Manga Titles", y = "Manga Sales in Millions")

top_shonen_by_year <- shonen_data %>% arrange(`Serialized`) %>% slice_head(n = 5)
ggplot(top_shonen_by_year, aes(x = `Serialized`, y = `Manga series`, group = 1)) + geom_line(color = "orange") + labs(title ="Top 5 Oldest Shōnen Manga", x = "Time Period", y = "Manga Titles")

top_shonen_by_volumes <- shonen_data %>% arrange(desc(`No. of collected volumes`)) %>% slice_head(n=5)
ggplot(top_shonen_by_volumes, aes(x = `Manga series`, y = `No. of collected volumes`)) + geom_bar(stat = "identity", fill = "orange") + labs(title ="Top 5 Shōnen Manga with the Most Volumes", x = "Manga Titles", y = "Amount of Volumes")


#Seinen comparison
seinen_data <- subset(best_selling_manga, subset = Demographic =="Seinen")
print(seinen_data )
top_seinen_by_sales <- seinen_data  %>% arrange(desc(`Approximate sales in million(s)`)) %>% slice_head(n=5)
ggplot(top_seinen_by_sales, aes(x = `Manga series`, y = `Approximate sales in million(s)`)) + geom_bar(stat = "identity", fill = "red") + labs(title ="Top 5 Best-Selling Seinen Manga", x = "Manga Titles", y = "Sales in Millions")

top_seinen_by_sales_per_volume <- seinen_data  %>% arrange(desc(`Average sales per volume in million(s)`)) %>% slice_head(n=5)
ggplot(top_seinen_by_sales_per_volume, aes(x = `Manga series`, y = `Average sales per volume in million(s)`)) + geom_bar(stat = "identity", fill = "orange") + labs(title ="Top 5 Seinen Manga by Average Sales per Volume", x = "Manga Titles", y = "Average sales per Volume in Millions")







