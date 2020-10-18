setwd("C:/Users/dapon/Dropbox/Harvard/dissertation")

library(tidyverse)
library(electoral)
library(haven)

results <- load("data/constituency_level_elections_archive/constituency_level_results_lower_house/clea_lc_20190617.Rdata")
nat <- read_dta("data/constituency_level_elections_archive/party_nationalization_measures/clea_lc_enp_20190617_national.level.dta")
parties <- read_dta("data/constituency_level_elections_archive/party_nationalization_measures/clea_lc_enp_20190617_party.level.dta")
countries <- c("US","Austria","Belgium","Denmark","Finland",
               "Greece","France","Germany","Ireland","Italy","Japan",
               "Netherlands","Norway","Portugal","Spain","Sweden",
               "UK","Australia","Canada","New Zealand","Switzerland")
parties <- parties %>% filter(ctr_n %in% countries) %>% 
  filter(PNS > 0)
nat <- nat %>% filter(ctr_n %in% countries) 
missing <- nat %>% filter(ctr_n == "US" & yr == 1789) %>%
  pull(inflation1)
nat <- nat %>% filter(ENP_nat > 0 & yr > 1980 & PSNS > 0)



ggplot(data = nat, aes(x = yr, y = PSNS)) + 
  geom_point() + 
  geom_smooth(se = FALSE) + 
  facet_wrap(~ctr_n)
            
            