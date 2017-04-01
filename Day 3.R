## let's first find some insight into data set 

library(dplyr)

head(airquality)

dim(airquality)
# # attributes(mtcars)
# row.names(airquality)
str(airquality)
names(airquality)
colnames(airquality)

head(select(airquality, Ozone,Day,Month),4)# first four observation 

head(airquality[,c("Month", "Day","Ozone")],4)

head(select(airquality, Ozone:Temp), 3)

head(select(airquality, -Solar.R), 3)

head(select(airquality, -(Day:Wind)),3)

## select columns that contains "o" charater such as Ozone, Month etc.
head(select(airquality, contains("O")), 3)

head(iris)
str(iris)
levels(iris$Species)

head(select(iris, ends_with("Length")))
head(select(iris, ends_with("s")))
head(select(iris, ends_with("th")))

head(select(iris, starts_with("p")))

head(select(iris, matches(".ta.")))
head(select(iris, matches("th$")))
head(select(iris, matches("^p")))

filter(airquality, Month == 9 | Temp > 90)

## select all rows where day is less than 5 and Solar radiation greater than or equal to 200.
filter(airquality, Day < 5 , Solar.R >= 200)
filter(airquality, Day < 5 & Solar.R >= 200)

## select all rows where days equal to 1 and 2
filter(airquality, Day %in% c(1,2,3))
airquality[, colnames(airquality) %in% c("Day", "Month")]

## select all rows where Month is August OR average Wind speed less than 5 
filter(airquality, Month==8 | Wind < 5)


## We want get only those rows where Ozone is not missing
filter(airquality, !is.na(Ozone))
filter(airquality, complete.cases(Ozone))


## arrange the rows in the ascending order of Day and then in the descending order of Month. 
head(arrange(airquality,desc(Month), Day),10)

## arrange rows in the descending order of Temp
head (arrange(airquality, desc(Temp)), 5) 


## adds a new column that displays the temperature in Celsius
head(mutate(airquality, Temp_celcius= (Temp -32)*5/9, 
            Temp=NULL))
head(mutate(airquality, Temp= (Temp -32)*5/9))

head(rename(airquality, Temperature=Temp))

head(transmute(airquality, temp_celsius= (Temp -32)*5/9))

## add new column that display the deviation of Ozone 
#from mean
a <- na.omit(airquality)

head (mutate(a, Dev_Ozone= Ozone- mean(Ozone)), 20)

head (mutate(airquality,
             Dev_Ozone= Ozone- mean(Ozone, na.rm=T)), 20)

head(airquality,20)

## A group_by function allow to split the data 
#set according to categorical variable. we are going to create temperature categorical variable which indicate whether teperature is hot or cold depending the temperature was over 80 degree or not.
air_quality <- mutate(airquality, 
                      TempCat = factor(Temp > 80,
                                       labels = c("cold", "hot")))
str(air_quality)

hot_cold <- group_by(air_quality, TempCat)

## compute the average number of Ozone
summarise(air_quality, median_Oz = median(Ozone, na.rm = TRUE))

## compute the max and min temerature
summarise(air_quality, max_temp= max(Temp), min_temp = min(Temp))

summarise(hot_cold, mean_Ozone= mean(Ozone, na.rm = TRUE),
          med_solar = median(Solar.R, na.rm = TRUE),
          max_wind = max(Wind, na.rm = TRUE))

Month_Cat <- group_by(air_quality, Month)

summarise (Month_Cat, mean_temp = mean(Temp, na.rm = TRUE), 
           mean_in_celsius = (mean_temp-32)*5/9)

## select Ozone and wind from airquality of data set.
air_quality %>% select(Ozone, Wind) %>% head


## we want to see, what is the average number of Ozone in last 6 days of May Month. 

air_quality %>%
  filter(Month== 5 & Day > 25) %>%
  summarise(Ozone = mean(Ozone, na.rm=TRUE))

## compute mean temperature of month where month starts from May to August. 
air_quality %>%
  group_by(Month) %>%
  filter(Month > 4 & Month <=8) %>%
  summarise(Temp_mean=mean(Temp, na.rm=TRUE)) 

## re-arranging the data set and select all rows that display only hot days in the Temperature category (TempCat). 

air_quality %>%
  arrange(desc(Temp), Day) %>%
  filter(TempCat %in% ("hot")) %>%
  head
## Whether cold days or hot days effect to max wind speed and average solar radiation.
air_quality %>%
  group_by(TempCat)%>%
  summarise(Solar.R= mean(Solar.R, na.rm=TRUE),
            Wind=max(Wind, na.rm=TRUE))

summary(airquality)
