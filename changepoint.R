library(pacman)
p_load(tidyverse, changepoint)

cases <- read_csv("https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=overview&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22newCasesByPublishDate%22:%22newCasesByPublishDate%22,%22cumCasesByPublishDate%22:%22cumCasesByPublishDate%22%7D&format=csv") %>%
  drop_na()
deaths <- read_csv("https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=overview&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22newDeaths28DaysByPublishDate%22:%22newDeaths28DaysByPublishDate%22,%22cumDeaths28DaysByPublishDate%22:%22cumDeaths28DaysByPublishDate%22%7D&format=csv") %>%
  drop_na()
hospCases <- read_csv("https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=overview&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22hospitalCases%22:%22hospitalCases%22%7D&format=csv") %>%
  drop_na()

cases

cp <- changepoint::cpt.mean(cases$newCasesByPublishDate, method = "BinSeg", Q = 10)
cp1 <- changepoint::cpt.mean(deaths$newDeaths28DaysByDeathDate, method = "BinSeg", Q = 10)
cp2 <- changepoint::cpt.mean(hospCases$hospitalCases, method = "BinSeg", Q = 10)

cp@cpts
cp1@cpts
cp2@cpts

cases[cp@cpts,]

deaths[cp1@cpts,]

hospCases[cp2@cpts,]
