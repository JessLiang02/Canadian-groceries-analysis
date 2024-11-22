#### Preamble ####
# Purpose: Tests the structure and validity of the analysis dataset.
# Author: Jing Liang
# Date: 13 November 2024
# Contact: jess.liang@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - The `tidyverse` and `testthat` packages must be installed and loaded
# - 02-clean_data.sql must have been run with DB Browser for SQLite
# - exported the analysis dataset from DB Browser for SQLite
# Any other information needed? Ensure you are in the `Canadian groceries analysis` rproj

#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")

# Test that the dataset has 8 rows
test_that("dataset has 8 rows", {
  expect_equal(nrow(analysis_data), 8)
})

# Test that the 'vendor' column contains unique values (no duplicates)
test_that("'vendor' column contains unique values", {
  expect_equal(length(unique(analysis_data$vendor)), nrow(analysis_data))
})

# Test that the 'avg_current_price' and 'avg_old_price' columns are numeric types
test_that("'avg_current_price' and 'avg_old_price' are numeric", {
  expect_type(analysis_data$avg_current_price, "double")
  expect_type(analysis_data$avg_old_price, "double")
})
