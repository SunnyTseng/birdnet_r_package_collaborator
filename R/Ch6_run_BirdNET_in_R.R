

# Download the BirdNET-Analyzer-setup.exe file from the Github page

# Follow the instructions to install BirdNET Analyzer




# Check out this article: https://www.r-bloggers.com/2021/09/how-to-use-system-commands-in-your-r-script-or-package/


# Global Variables ####
birdNET_path <- "C:/Program Files (x86)/BirdNET-Analyzer/BirdNET-Analyzer.exe" 


birdNET_analyze <- function(i, 
                            o, 
                            lat = -1,
                            lon = -1,
                            week = -1,
                            slist, # optional
                            sensitivity = 1.0,
                            min_conf = 0.1,
                            overlap = 0.0,
                            rtype = "table",
                            threads = 1, # check
                            batchsize = 1,
                            locale = "en",
                            sf_thresh = 0.03,
                            classifier, # optional
                            fmin = 0,
                            fmax = 15000,
                            combine_results, # optional
                            skip_existing_results = FALSE) {
  
  
  to_execute <- paste0(
    " --i ", i,
    " --o ", o
  )
  
  output <- system2(birdNET_path, args = to_execute, stdout = TRUE, stderr = if (show_warnings) "" else NULL)
  
  return(to_execute)
}
  





birdNET_analyze(i = "1", o = "3")




  
  
  # Ensure the output file name is correctly formatted for "r" type exports
  output_file <- if (rtype == "r") {
    sub("\\.csv$", ".BirdNET.results.csv", output)
  } else {
    output
  }
  
  # Prepare the base command with mandatory parameters
  to_execute <- paste0(
    " --i ", input,
    " --o ", output_file,
    " --lat ", lat,
    " --lon ", lon,
    " --week ", week, 
    " --sensitivity ", sensi, 
    " --min_conf ", conf, 
    " --overlap ", overlap, 
    " --rtype ", rtype
  )
  
  # Conditionally add species list and thread count if provided
  if (!is.null(species_list)) to_execute <- paste0(to_execute, " --slist ", species_list)
  if (!is.null(thread_count)) to_execute <- paste0(to_execute, " --threads ", thread_count)
  
  # Display the command to be executed
  cat("Executing command line prompt:\n", birdNET_path, to_execute, "\n")
  
  # Execute the command with or without warnings based on show_warnings
  output <- system2(birdNET_path, args = to_execute, stdout = TRUE, stderr = if (show_warnings) "" else NULL)
  
  # Check if there was an error
  if (!is.null(attr(output, "status")) && attr(output, "status") != 0) {
    cat("Error occurred during execution:\n")
    cat(output, sep = "\n")
  } else {
    cat("Execution completed successfully.\n")
  }
  
  return(output)
}