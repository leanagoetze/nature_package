#' Forest thinning function
#'
#' This function allows the user to determine how many days would be needed for a thinning project to reduce YPMC forest from current to historic conditions for a specified number of plots.
#' @param day Day forest thinning project will end. Default starting day is day 0.
#' @param plots Number of plots interested in thinning. Each plot is 1 ha.
#' @param original_density starting average tree density of all plots (trees/ha). Default density is 350 trees/ha.
#' @return Number of days needed to thin all specified plots down to historic densities.
#' @examples
#' thinning(plots=4)
#' thinning(day=0, plots=10, original_density=400)
#' @author Leana Goetze

# Create function
thinning = function(day=0, plots, original_density = 350) {
  # Create error checking--> stop running  function if there are no plots specified, and hence to trees to thin. Note: fractional measures work fine
  if (plots <= 0)
    return("Not enough plots, more than 0 plots needed")

  while ((original_density >= 220) && (day < 500))  {
    # Automatically stop the loop after a given time. Let's say the crews cannot work more than 500 days (error-checking so that the loop does not run forever)
    # Thin 15 trees per day
    original_density = original_density - 15
    # Record time
    day = day + 1
    # Day now equals the number of days to reduce one plot down to historic density conditions
  }

  result = day * plots
  # Multiply the number of days it takes to thin one plot down to historic conditions by the number of plots that need to be thinned
  return(result)
}
