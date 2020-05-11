#clears global environment
#rm(list =ls())

library("dplyr")

# Hofstede's cultural dimensions
# From: https://geerthofstede.com/research-and-vsm/dimension-data-matrix/
hofstede <- read.csv(
  "https://geerthofstede.com/wp-content/uploads/2016/08/6-dimensions-for-website-2015-08-16.csv", 
  stringsAsFactors = FALSE, 
  sep = ";" #the file isn't separated by commas, but instead semi-colons
)

idv_data_df <- hofstede %>%
  select(country, idv) %>%
  mutate(idv = as.numeric(idv)) %>%
  filter(!is.na(idv)) %>%
  arrange(idv)

idv_summary_df <- idv_data_df %>%
  summarize(avg_idv = mean(idv),
            min_idv = min(idv),
            max_idv = max(idv))

max_country <- idv_data_df %>%
  filter(idv == max(idv)) %>%
  pull(country)

min_country <- idv_data_df %>%
  filter(idv == min(idv)) %>%
  pull(country)