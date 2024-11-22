#### Preamble ####
# Purpose: Simulates a dataset on Canadian groceries.
# Author: Jing Liang
# Date: 13 November 2024
# Contact: jess.liang@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `Canadian groceries analysis` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(1)

#### Simulate data ####
# Vendor names
vendors <- c(
  "Galleria",
  "Loblaws",
  "Metro",
  "NoFrills",
  "SaveOnFoods",
  "TandT",
  "Voila",
  "Walmart"
)

# Generate simulated average current and old prices
simulated_data <- tibble(
  vendor = vendors, # Use predefined vendor names
  avg_current_price = round(runif(length(vendors), 5, 12), 6), # Random current prices between 5 and 12
  avg_old_price = round(avg_current_price * runif(length(vendors), 1.1, 2.0), 6) # Old prices 10% to 100% higher
)

#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
