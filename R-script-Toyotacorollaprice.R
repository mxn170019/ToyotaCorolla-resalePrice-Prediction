
# settig work directory
setwd("/Users/mandeep/BA with R/Session4_RCodes")

# package to read excel file
install.packages("readxl")
library(readxl)

#Loading data in to R
Toyota_data<- read_excel("ToyotaCorolla.xlsx",sheet =  2)
Toyota_data1<- read.csv("Toyota2.csv",header = TRUE)
Toyota_data<- na.omit(Toyota_data1)
str(Toyota_data)

# package to create dummy binary variables to replace categoricay variables
install.packages("fastDummies")
library(fastDummies)

# Answer 4 data with dummy variables
ANSWER4<- dummy_cols(Toyota_data,select_columns = c("Mfg_Month","Fuel_Type","Color"),remove_first_dummy = FALSE)
names(ANSWER4)


# sample data for Word-assignemt file - to explain relation and concept of dummy variables
Sampledummy<-head(ANSWER4[c("Id","Model","Color","Color_Blue","Color_Silver","Color_Black","Color_White","Color_Grey","Color_Red","Color_Green","Color_Yellow","Color_Violet","Color_Beige")],11)

# Answer5 data for corelation matrix Sample for DOC FILE
Answer5<-Toyota_data[,c('Price','Age_08_04', 'KM',"Gears" ,'HP', 'CC', 'Mfg_Year',
                        'Quarterly_Tax', 'Weight', 'Guarantee_Period')]

cor_mat<-round( cor(Answer5),4)

# relation between Gears and Price
plot(Toyota_data1$Gears,Toyota_data1$Price)


# correlation matrix plot for some selected variables
library(reshape2)
melted_cormat <- melt(cor_mat)

library(ggplot2)
ggplot(melted_cormat, aes(Var1, Var2)) +
  geom_tile(aes(fill = value)) + 
  geom_text(aes(label = round(value, 2))) +
  scale_fill_gradient(low = "white", high = "red") 

ggplot(melted_cormat, aes(Var1, Var2)) +
  geom_tile(aes(fill = value)) + 
  geom_text(aes(label = round(value, 2))) +
  scale_fill_gradient(low = "white", high = "red") 



