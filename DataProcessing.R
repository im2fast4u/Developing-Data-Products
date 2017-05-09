#load the required libraries
library(MASS)
library(ggplot2)
library(markdown)

cardata <- Cars93
# select only the required columns
cardata <- cardata[, c(1:3, 7, 8, 10:13, 25)]
#convert the column data type
cardata$MPG.city <- as.numeric(cardata$MPG.city)
cardata$MPG.highway <- as.numeric(cardata$MPG.highway)
#remove only one record for the 'rotary' type cylinder
cardata <- cardata[!cardata$Cylinders == "rotary",]
#reset the factors for the cylinder column
cardata$Cylinders <- factor(cardata$Cylinders)

##helper functions

#function to resize the data frame based on the 'horsepower' slider selection
hpfunc <- function(data, hp1, hp2){
        data <- cardata[cardata$Horsepower >= hp1 & 
                                cardata$Horsepower <= hp2, ]
        data
}

#function to plot the data using ggplot (Weight-MPG City)
ggplotfuncCity <- function(data){
        g <- ggplot(data, aes(x=Weight, y=MPG.city, label = Model)) +
                geom_text(check_overlap = TRUE, aes(color = Type, fontface="bold")) + 
                scale_color_discrete(l = 40)  + theme_bw() +
                labs(x="Car Weight in Pounds", y="Miles Per Gallon in City", color="Car Type")
        print(g)
}

#function to plot the data using ggplot (Weight-MPG Highway)
ggplotfuncHighway <- function(data){
        g <- ggplot(data, aes(x=Weight, y=MPG.highway, label = Model)) +
                geom_text(check_overlap = TRUE, aes(color = Type, fontface="bold")) + 
                scale_color_discrete(l = 40)  + theme_bw() +
                labs(x="Car Weight in Pounds", y="Miles Per Gallon on Highway", color="Car Type")
        print(g)
}