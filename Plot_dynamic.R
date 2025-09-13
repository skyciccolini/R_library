
# function to generate a simple histogram
trait_plot <- function(trait) {
  D <- tibble(trait) |> drop_na()
  p <- ggplot(D, aes(trait)) +
    geom_histogram(bins = 30)
  return(p)
}

# view plot
trait_plot(M$Forearm)


# 1. Create vector for all vars you want to plot
traits <- names(M) [3:10]

# 2. Create loop

plots <- list() ## create empty list to hold plots

for (ii in 1:length(traits)) { ## iterate through length of vector of vars
  trait <- M |> ## create var from M df
    select(all_of(traits[ii])) |> ## select entire col of var you want
    pull(1) ## convert to vector
  plots[[ii]] <- trait_plot(trait) ## put that var into a plot list
}

# 3. View all plots

wrap_plots(plots)


# use purrr::map() 

plots_map <- map(.x = names(M)[3:10], ## .x is the iterable vector given to function .f
                 .f = trait_plot_map, ## .f is fcn
                 M = M) ## M is df



# fcn that creates a list with a df, a summary table, a plot, and a linear regression
trait_analysis <- function(trait, M) {
  M_no_NA <- M |> ## df
    drop_na(Order, Body_mass, all_of(trait)) |> 
    select(Order, Body_mass, all_of(trait)) |> 
    mutate(across(.cols = where(is.double), .fns = ~ log10(.x + 0.001)))
  
  summary_table <- M_no_NA |> ## summary table
    group_by(Order) |> 
    summarize(across(.cols = where(is.double),
                     .fns = mean))
  
  p <- ggplot(M_no_NA, aes(x = Body_mass, y = .data[[trait]], color = Order)) + ## plot
    geom_point() +
    labs(y = str_replace(trait, "_", " ")) +
    theme(legend.position = "none")
  
  fm <- lm(M_no_NA[[trait]] ~ M_no_NA[["Body_mass"]]) ## linear regression
  
  return(list(trait = trait, p = p, summary_table = summary_table, fm = fm)) ## return in a list
  
  
}


# in a quarto file, create a report for each var in df

#| output: "asis"
for (ii in 1:length(LL)) {
  
  # Make a header
  cat("\n## ", LL[ii], "\n")
  
  # Print formatted table
  knitr::kable(LL[[ii]]$summary_table)
  
  # Print plot
  print(LL[[ii]]$p)
  
  # Print linear model summary
  print(summary(LL[[ii]])$fm)
}


























