#### Preamble ####
# Purpose: Tests the structure and validity of the simulated dataset.
# Author: Jing Liang
# Date: 13 November 2024
# Contact: jess.liang@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - The `tidyverse` and `testthat` packages must be installed and loaded
# - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `Canadian groceries analysis` rproj


#### Workspace setup ####
library(tidyverse)
library(testthat)

simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test that the dataset has 8 rows
test_that("dataset has 8 rows", {
  expect_equal(nrow(simulated_data), 8)
})

# Test that the 'vendor' column contains unique values (no duplicates)
test_that("'vendor' column contains unique values", {
  expect_equal(length(unique(simulated_data$vendor)), nrow(simulated_data))
})

# Test that the 'avg_current_price' and 'avg_old_price' columns are numeric types
test_that("'avg_current_price' and 'avg_old_price' are numeric", {
  expect_type(simulated_data$avg_current_price, "double")
  expect_type(simulated_data$avg_old_price, "double")
})
