library("tibble")
library("DT")
library("scales")
library(RCurl)
house.data <- read.csv("kc_house_data.csv")
set.seed(0)
prob <- c(0.8,0.2)
tags <- c("train", "test")
sample_tag <-  sample(tags,size=length(house.data$id),replace=TRUE,prob=prob)
sales_tag <- cbind(house.data,sample_tag)
train_data <- subset(sales_tag,sample_tag == 'train',select=-sample_tag)
test_data <- subset(sales_tag,sample_tag == 'test',select=-sample_tag)
length(train_data[,1])
length(test_data[,1])

# exploratory analysis
plot(house.data[,c(3:8)])

# creating linear regression model
hlm <- lm(formula = price ~ sqft_living + sqft_lot + bedrooms+zipcode, 
          data = house.data)
summary(hlm)

#Creating & Using a Predictive Model of Best Selling Price
house.price.range <- predict(hlm, data.frame(sqft_living=3000, sqft_lot=4000, bedrooms=3,zipcode=98178), 
                             interval = "confidence")
fit.price = dollar(as.numeric(house.price.range[1]))
lower.fit = dollar(as.numeric(house.price.range[2]))
upper.fit = dollar(as.numeric(house.price.range[3]))

house.price.range <- cbind.data.frame(lower.fit, fit.price, upper.fit)

print(head(house.price.range))