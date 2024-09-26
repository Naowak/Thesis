
# Data Import -------------------------------------------------------------

data <- read.csv(file = '~/Thesis/code/ilcb/shared/pn_features.csv')


# Clean data --------------------------------------------------------------

columns_to_remove = c('X', 'SUBJECT', 'gender', 'item', 'picturefile')
for (i in seq_along(columns_to_remove)) {
  col <- columns_to_remove[i]
  data <- data[,-which(names(data) == col)]
}

# Training ----------------------------------------------------------------


# Test --------------------------------------------------------------------


