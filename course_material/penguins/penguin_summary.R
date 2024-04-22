# Function to calculate summary statistics for a specified numeric variable by species
summarize_species <- function(data, variable) {
        
        require(dplyr)
        
        data %>%
                group_by(species) %>%
                summarise(
                        Count = n(),
                        Mean = mean({{variable}}, na.rm = TRUE),
                        SD = sd({{variable}}, na.rm = TRUE),
                        Min = min({{variable}}, na.rm = TRUE),
                        Max = max({{variable}}, na.rm = TRUE)
                ) %>%
                ungroup()
}

# Example usage:
# Get summary statistics for the 'flipper_length_mm' variable
summarize_species(data = palmerpenguins::penguins,
                  variable = flipper_length_mm)

