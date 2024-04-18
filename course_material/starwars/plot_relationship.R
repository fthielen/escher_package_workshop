# Define the function
plot_relationship <- function(x, y) {
        
        # Load necessary libraries
        require(ggplot2)
        require(dplyr)
        
        # Ensure the dataset is loaded
        if (!exists("starwars")) {
                starwars <- dplyr::starwars
        }
        
        # Check if the specified variables exist in the dataframe
        if (!(x %in% names(starwars) && y %in% names(starwars))) {
                stop("One or both of the specified variables do not exist in the starwars dataset.")
        }
        
        # Create the plot
        plot <- ggplot(data = starwars, aes(x = !!sym(x), y = !!sym(y))) +
                geom_point(aes(color = species)) +
                labs(title = paste("Relationship between", x, "and", y),
                     x = x,
                     y = y) +
                theme_minimal(base_family = "Helvetica") +
                theme(plot.background = element_rect(fill = "black",
                                                     colour = "black"),
                      panel.background = element_rect(fill = "black"),
                      text = element_text(colour = "white"),
                      axis.text = element_text(colour = "white"),
                      plot.title = element_text(size = 20, face = "bold",
                                                hjust = 0.5, colour = "white"),
                      legend.position = "bottom",
                      legend.text = element_text(size = 6),  # Smaller legend text
                      legend.key.size = unit(0.1, "cm"))  # Smaller legend keys)
        
        # Print the plot
        print(plot)
}

# Example usage:
# plot_relationship(x = "height", y = "mass")
