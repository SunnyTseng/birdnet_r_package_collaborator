

# Download and install BirdNET-Analyzer-setup.exe from BirdNET Analyzer GitHub 

# define the function -----------------------------------------------------
birdnet_analyze <- function(BirdNET_path,
                            i, 
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
  
  
  arg_execute <- paste0(
    " --i ", i,
    " --o ", o)
  
  system2(birdNET_path, args = arg_execute, stdout = TRUE)
  
}
  

# example ----------------------------------------------------------

birdnet_analyze(BirdNET_path = "C:/Users/sunny541.stu/AppData/Local/Programs/BirdNET-Analyzer/BirdNET-Analyzer.exe",
                i = "C:/Users/sunny541.stu/Desktop/test_audio",
                o = "C:/Users/sunny541.stu/Desktop/test_output")






