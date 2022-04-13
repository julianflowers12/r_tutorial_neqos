#' devtools::install_github('ropensci/fingertipsR')

#' library(fingertipsR); library(tidyverse)

#' df <- fingertips_data(ProfileID = 18, AreaTypeID = 302)

#' df %>%
#'  count(IndicatorID, IndicatorName)


#' df_filt_2020 <- df %>%
#'  filter(nchar(Timeperiod) == 4,
#'         IndicatorID %in% c(93798),
#'         AreaName == "England",
#'         !Age %in% c("18+ yrs", "18-64 yrs", "15 yrs", "18-24 yrs",
#'                     ">=37 weeks gestational age at birth"),
#'         Sex == "Persons") %>%
#'  dplyr::select(Age, Sex, Value, TimeperiodSortable, contains("95"))

#' df_filt_2019 <- df %>%
#'  filter(nchar(Timeperiod) == 4,
#'         IndicatorID %in% c(92443),
#'         AreaName == "England",
#'         !Age %in% c("18+ yrs", "18-64 yrs", "15 yrs", "18-24 yrs",
#'                   ">=37 weeks gestational age at birth"),
#'         Sex == "Persons") %>%
#'  dplyr::select(Age, Sex, Value, TimeperiodSortable, contains("95"))

#' df_filt_2019 %>%
#'  ggplot(aes(TimeperiodSortable, Value, colour = Age)) +
#'  geom_point(show.legend = F) +
#'  geom_point(data = df_filt_2020, aes(TimeperiodSortable, Value, colour = Age)) +
#'  facet_wrap(~Age)

#' skimr::skim(df_filt)

#' df_filt %>%
#'  count(TimeperiodSortable)

#' df %>%
#'  filter(nchar(Timeperiod) == 4,
#'         AreaName == "England",
#'         !Age %in% c("18+ yrs", "18-64 yrs", "15 yrs", "18-24 yrs",
#'                     ">=37 weeks gestational age at birth"),
#'         Sex == "Persons") %>%
#'  dplyr::select(Age, Sex, Value, TimeperiodSortable, contains("95")) %>%
  #pivot_wider(names_from = c("Timeperiod"), values_from = c("Value", "LowerCI95.0limit", "UpperCI95.0limit"))
#'  ggplot(aes(TimeperiodSortable, Value, colour = Age)) +
#'  geom_line() +
#'  facet_wrap(~Age)



#' count(Age, Timeperiod)
