## Household Income Comparisons
library("stargazer")
## Summerize household data without controlling for age and employment
AllSummary <- summary(housing.data$HINCP)

Alameda <- HD[(HD$PUMA == 101 |  # Alameda County
               HD$PUMA == 102 |
               HD$PUMA == 103 |
               HD$PUMA == 104 |
               HD$PUMA == 105 |
               HD$PUMA == 106 |
               HD$PUMA == 107 |
               HD$PUMA == 108 |                   
               HD$PUMA == 109 |
               HD$PUMA == 110),]

SanFransisco <- HD[(HD$PUMA == 7501 | # San Francisco
                    HD$PUMA == 7502 |         
                    HD$PUMA == 7503 |  
                    HD$PUMA == 7504 |
                    HD$PUMA == 7505 |
                    HD$PUMA == 7506 |
                    HD$PUMA == 7507),]

SanMatteo <- HD[(HD$PUMA == 8101 | # San Matteo
                 HD$PUMA == 8102 |
                 HD$PUMA == 8103 |                            
                 HD$PUMA == 8104 |
                 HD$PUMA == 8105 |                            
                 HD$PUMA == 8106 ),]

MarineCounty <- HD[HD$PUMA == 4101 | # Marin County 
                  HD$PUMA == 4102),]
