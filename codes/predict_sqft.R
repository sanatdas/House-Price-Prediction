## predict house price given sqft_living, sqft_lot size and are zipcode
predict_houseprice<-function(sqft_living,sqft_lot,zipcode){
        sqft_living=sqft_living
        sqft_lot=sqft_lot
        zipcode=zipcode
        predict_val2 <- predict(cust_model, 
                                newdata=data.frame(sqft_living=sqft_living,sqft_lot=sqft_lot,zipcode=zipcode),
                                interval = "confidence")
        ssqft_living=sqft_living
        sqft_lot=sqft_lot
        zipcode=zipcode
        predict_val2 <- cbind(predict_val,sqftliving,sqft_lot,zipcode)
        predictdf2 <- data.frame(predict_val2)
        print(predictdf2)
}