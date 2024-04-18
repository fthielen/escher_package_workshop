# Define the function
top_starwars <- function(variable = "height", top = 10) {
        # Load necessary libraries
        require(dplyr)
        
        # Ensure the dataset is loaded
        if (!exists("starwars")) {
                starwars <- dplyr::starwars
        }
        
        # Check if the specified variable exists in the dataframe
        if (!variable %in% names(starwars)) {
                stop("The specified variable does not exist in the starwars dataset.")
        }
        
        # Sort the dataframe based on the specified variable and handle missing values
        ranked_df <- starwars %>% 
                filter(!is.na(variable)) %>%
                arrange(desc(across(all_of(variable)))) %>%
                select(name, all_of(variable)) %>% 
                slice_head(n = top)
        
        # Return the top n entries
        return(ranked_df)
}

# Example usage:
# top_starwars("mass", 5)
