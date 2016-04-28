## Using data from ACS I the data will be filtered for the following counties:

## Packages:
library("ggplot2")
library("data.table")

## Load the Data
ACS <- read.csv("~/OneDrive/Work/JG/public_transit/Data/raw_data/ss14pca.csv", head = TRUE)
HD <- read.csv("~/OneDrive/Work/JG/public_transit/Data/raw_data/ss14hca.csv", header = TRUE)
## Clean the data to identify the counties
## 
housing.data <- HD[(HD$PUMA == 7501 | # San Francisco
            HD$PUMA == 7502 |         
            HD$PUMA == 7503 |  
            HD$PUMA == 7504 |
            HD$PUMA == 7505 |
            HD$PUMA == 7506 |
            HD$PUMA == 7507 |
            HD$PUMA == 8101 | # San Matteo
            HD$PUMA == 8102 |
            HD$PUMA == 8103 |
            HD$PUMA == 8104 |
            HD$PUMA == 8105 |
            HD$PUMA == 8106 | 
            HD$PUMA == 4101 | # Marin County 
            HD$PUMA == 4102 |  
            HD$PUMA == 101 |  # Alameda County
            HD$PUMA == 102 |
            HD$PUMA == 103 |
            HD$PUMA == 104 |
            HD$PUMA == 105 |
            HD$PUMA == 106 |
            HD$PUMA == 107 |
            HD$PUMA == 108 |
            HD$PUMA == 109 |
            HD$PUMA == 110 |
            HD$PUMA == 9701 | # Sonoma County
            HD$PUMA == 9702 |
            HD$PUMA == 9703 |
            HD$PUMA == 5500 | # Napa County
            HD$PUMA == 9501 | # Solano
            HD$PUMA == 9502 |
            HD$PUMA == 9503 |
            HD$PUMA == 1301 | # Contra Costa
            HD$PUMA == 1302 |
            HD$PUMA == 1303 |
            HD$PUMA == 1304 |
            HD$PUMA == 1305 |
            HD$PUMA == 1306 |
            HD$PUMA == 1307 |
            HD$PUMA == 1308 |
            HD$PUMA == 1309 |
            HD$PUMA == 8501 | # Santa Clara County
            HD$PUMA == 8502 |
            HD$PUMA == 8503 |
            HD$PUMA == 8504 |
            HD$PUMA == 8505 |
            HD$PUMA == 8506 |
            HD$PUMA == 8507 |
            HD$PUMA == 8508 |
            HD$PUMA == 8509 |
            HD$PUMA == 8510 |
            HD$PUMA == 8511 |
            HD$PUMA == 8512 |
            HD$PUMA == 8513 |
            HD$PUMA == 8514),]

county.data <- ACS[(ACS$PUMA == 7501 | # San Francisco
            ACS$PUMA == 7502 |         
            ACS$PUMA == 7503 |  
            ACS$PUMA == 7504 |
            ACS$PUMA == 7505 |
            ACS$PUMA == 7506 |
            ACS$PUMA == 7507 |
            ACS$PUMA == 8101 | # San Matteo
            ACS$PUMA == 8102 |
            ACS$PUMA == 8103 |
            ACS$PUMA == 8104 |
            ACS$PUMA == 8105 |
            ACS$PUMA == 8106 | 
            ACS$PUMA == 4101 | # Marin County 
            ACS$PUMA == 4102 |  
            ACS$PUMA == 101 |  # Alameda County
            ACS$PUMA == 102 |
            ACS$PUMA == 103 |
            ACS$PUMA == 104 |
            ACS$PUMA == 105 |
            ACS$PUMA == 106 |
            ACS$PUMA == 107 |
            ACS$PUMA == 108 |
            ACS$PUMA == 109 |
            ACS$PUMA == 110 |
            ACS$PUMA == 9701 | # Sonoma County
            ACS$PUMA == 9702 |
            ACS$PUMA == 9703 |
            ACS$PUMA == 5500 | # Napa County
            ACS$PUMA == 9501 | # Solano
            ACS$PUMA == 9502 |
            ACS$PUMA == 9503 |
            ACS$PUMA == 1301 | # Contra Costa
            ACS$PUMA == 1302 |
            ACS$PUMA == 1303 |
            ACS$PUMA == 1304 |
            ACS$PUMA == 1305 |
            ACS$PUMA == 1306 |
            ACS$PUMA == 1307 |
            ACS$PUMA == 1308 |
            ACS$PUMA == 1309 |
            ACS$PUMA == 8501 | # Santa Clara County
            ACS$PUMA == 8502 |
            ACS$PUMA == 8503 |
            ACS$PUMA == 8504 |
            ACS$PUMA == 8505 |
            ACS$PUMA == 8506 |
            ACS$PUMA == 8507 |
            ACS$PUMA == 8508 |
            ACS$PUMA == 8509 |
            ACS$PUMA == 8510 |
            ACS$PUMA == 8511 |
            ACS$PUMA == 8512 |
            ACS$PUMA == 8513 |
            ACS$PUMA == 8514),]

## Filter By Age (23 - 65)
county.data <- county.data[(county.data$AGEP >= 23 & county.data$AGEP <= 65),]
## Filter out those that are unemployed
county.data <- county.data[!(is.na(county.data$COW) | county.data$COW == 9),]
## creating data set to use for analysis
analysis.data <- county.data[,c("SERIALNO","AGEP","COW","JWRIP","JWTR")]
analysis.data2 <- housing.data[,c("SERIALNO","HINCP")]
## merged data set by SERIALNO
analysis.final <- merge(analysis.data,analysis.data2, by = "SERIALNO")
## Every instance of NA for car use is replaced with a 0
analysis.final[is.na(analysis.final$JWRIP),4] <- 0
## 1 vehivle occupency and NA for public transport
analysis.final <- analysis.final[((analysis.final$JWRIP == 1) | (analysis.final$JWRIP == 0)),]
## remove HINC that are na
analysis.final <- analysis.final[!is.na(analysis.final$HINC),]
## remove means of transportation na's
analysis.final <- analysis.final[!is.na(analysis.final$JWTR),]
## boolean column for alternative transit 1 if indicated (Subway, Train, Bus, Bike,Worked at home)
analysis.final$atransit <- as.numeric(!(analysis.final$JWTR == 1 |
                                        analysis.final$JWTR == 12|
                                        analysis.final$JWTR == 6 |
                                        analysis.final$JWTR == 7 |
                                        analysis.final$JWTR == 8|
                                        analysis.final$JWTR == 10))
## mode of transportation
analysis.final$bus    <- as.numeric(analysis.final$JWTR == 2)
analysis.final$SC     <- as.numeric(analysis.final$JWTR == 3)
analysis.final$subway <- as.numeric(analysis.final$JWTR == 4)
analysis.final$rail   <- as.numeric(analysis.final$JWTR == 5)
analysis.final$bike   <- as.numeric(analysis.final$JWTR == 9)
analysis.final$home   <- as.numeric(analysis.final$JWTR == 11)

write.csv(analysis.final, "~/OneDrive/Work/JG/public_transit/Data/modified_data/analysis.final.csv")


