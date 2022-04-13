library(pacman)
p_load(tidyverse, changepoint, qicharts2)

qicharts2::qic(data = cases %>% filter(date >= "2021-12-01", date <= "2022-01-08"), date, 
               newCasesByPublishDate, 
               chart = "i")
               
               , part = 40)
qicharts2::qic(data = deaths %>% filter(date >= "2021-12-01", date <= "2022-01-08"), date, 
               newDeaths28DaysByPublishDate, part = 28, chart = "i")


qicharts2::qic(data = hospCases %>% filter(date >= "2021-12-01", date <= "2022-01-08"), date, 
               hospitalCases, 
               part = 25,
               chart = "i")
