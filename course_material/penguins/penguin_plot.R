# Function to create a histogram for each species based on a specified numeric variable
plot_species_distribution <- function(data, variable_name) {
        
        require(ggplot2)
        
        ggplot(data, aes_string(x = variable_name, fill = "species")) +
                geom_histogram(bins = 30, alpha = 0.6, position = "identity") +
                facet_wrap(~species, scales = "free_y") +
                labs(title = paste("Distribution of", variable_name, "by Species"),
                     x = variable_name,
                     y = "Frequency") +
                theme_minimal()
}

# Example usage:
# Plot the distribution of 'body_mass_g' for each penguin species
plot_species_distribution(palmerpenguins::penguins, "body_mass_g")
