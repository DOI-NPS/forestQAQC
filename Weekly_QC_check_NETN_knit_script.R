#------------------
# Generate  weekly QC report 
#------------------
library(knitr)
library(rmarkdown)

# Function doesn't recognize params yet. Need to figure out how to make the compile script recognize the params

# Parameters for report
indir <- getwd()
outdir <- paste0("./data/Weekly_QC_checks_NETN/")
rmd <- c("Weekly_QC_check_NETN.Rmd")
bak <- "THING_1" #"THING_2" "All_Visits"

# Render function
render_QC_reports <- function(bak){
  render(input = paste(indir, rmd, sep = "/"),
         params = list(week_start = "2021-06-07", 
                       cycle_latest_num = 4, 
                       locType = "all"),
         output_file = paste0("NETN_FHM_weekly_QC_check_", bak, "_", "2021-06-07", ".html"),
         output_dir = outdir)
  
}

render_QC_reports(bak)
