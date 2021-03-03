# This function reports the total number of fish caught, the most common fish species caught, and the rarest fish species caught from an inputted .txt file listing all fish caught. User can change default settings to "TRUE" to also display a histogram of the number of fish caught per species.

# fish_data = raw .txt file listing fish that were caught

fish_distribution = function(fish_data, show_plot = FALSE) {
  #add default option to not show histogram
  #convert to vector data
  fish_data_vector = fish_data$x
  # convert to factor
  fish_factor=as.factor(fish_data_vector)

  # calculate total fish caught
  total_fish<-sum(summary(fish_factor))
  # calculate the most commonly caught fish
  most_common_fish <-names(which.max(summary(fish_factor)))
  # calculate the most least caught fish (rarest fish)
  rarest_fish<-names(which.min(summary(fish_factor)))

  # create string that states the total number of fish caught
  plot_title=sprintf("Distribution of %d fish caught", sum(summary(fish_factor)))

  # create a plot showing the number of each fish caught by species
  fish_distribution_plot<-ggplot(data.frame(fish_factor=fish_factor), aes(fish_factor, fill=fish_factor))+
    geom_histogram(stat="count")+labs(title=plot_title, x = "Fish Species", y ="Count")+
    theme_bw()+
    theme(plot.title = element_text(hjust= 0.5,
                                    face = "bold",
                                    size = 16,
                                    margin=margin(0,0,10,0))) +
    theme(axis.title.x = element_text (face = "bold",
                                       size = 14,
                                       margin=margin(10,0,0,0))) +
    theme(axis.title.y = element_text (face = "bold",
                                       size = 14,
                                       margin=margin(0,10,0,0)))+
    theme(legend.title = element_blank())+
    scale_y_continuous(limits=c(0,100),expand = c(0,0))

  # output from function
  if(show_plot == TRUE) {
    return(list("Total Fish"=total_fish, "Most Common Fish"=most_common_fish, "Rarest Fish"=rarest_fish,fish_distribution_plot))
  } else {
    return(list("Total Fish"=total_fish, "Most Common Fish"=most_common_fish, "Rarest Fish"=rarest_fish))
  }

}

