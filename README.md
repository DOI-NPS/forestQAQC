# forestQAQC
This repo contains scripts and R markdown reports that perform weekly checks of MIDN, NCBN, and NETN forest data,
generate reports comparing crew and QAQC visits, and compile data from the previous visit for planning and field checking.

Notes on this repo:
<ul>
<li>Mid-Atlantic and Northeast Coastal and Barrier Network parks are checked using scripts starting with "MIDN".</li>
<li>Northeast Temperate Network parks are checked using scripts starting with "NETN".</li>
<li>For each network, their corresponding R package must be installed and either access to the SQL server or exported views as CSVs 
must be imported. To install the forestNETN package, run `pak::pkg_install('doi-nps/forestNETN')`. For the MIDN/NCBN forest package, 
run `pak::pkg_install('doi-nps/forestMIDN')`</li>
<li>Previous archived versions of this repo can be found at <a href="www.github.com/katemmiller/forestQAQC">
www.github.com/katemmiller/forestQAQC</a></li>
</ul>

This package includes the following main reports: 
<ul>
<li><b>PrevVisit_Plot_Viewer_XXXX_all.Rmd:</b> Generates tabbed HTML report of previous visit data by network. 
  <ul>
  <li>This report uses multiple modules, which are located in the 'PrevVisit_modules' folder. </li>
  <li>The PrevVisit_modules/PrevVisit_5A_Photopoints markdown reports need to be updated to match the 
  server address where photopoints live by network.</li>
  </ul>
<li><b>QAQC_report_XXX.Rmd:</b> generates a QA/QC report comparing crew and QAQC team measurements 
for a given plot, which is specified in the params section at the top of the report. This file depends 
on the following sub-files:</li>
  <ul>
  <li><b>QAQC_report_compile_XXXX.R:</b> generates all the data displayed in the markdown report. 
  This is the place to troubleshoot if the Rmd fails to knit.</li>
  <li><b>QAQC_report_functions.R:</b> stores functions used by the markdown report for either network.</li>
  </ul>
<li><b>Weekly_QC_check_XXXX.Rmd:</b> generates a report that checks records that were collected on or after 
the date specified in the params section at the top of the report. This file depends 
on the following sub-files:</li>
  <ul>
  <li><b>Weekly_QC_compile_XXXX.R:</b> generates all the data displayed in the markdown report. 
  This is the place to troubleshoot if the Rmd fails to knit.</li>
  <li><b>Weekly_QC_functions.R:</b> stores functions used by the markdown report for either network.</li>
  </ul>
</ul>

Helper scripts to iterate generating reports for multiple parks, plots, etc:
<ul>
<li><b>PrevVisit_FieldForms_XXXX_generate_all.R:</b> iterates through generating the tree and quadrat field forms 
(actual files that compile those are in the 'PrevVisit_modules' folder), and Plot Viewers for a given year 
by network.</li>
<li><b>generate_reports_from_script_XXXX.R: </b>generates weekly QC and QA/QC reports using the render function 
and specifying report params.</li>
<li><b></b></li>
<li><b>Generate_annual_forest_plot_list.R:</b> generates the list of plots for each network that will be sampled
in a given year.</li>
</ul>

<b>Note: Because file paths are not allowed through DGEC, there are places within these reports that require paths 
to be updated, particularly where they're referring to files on the MIDN or NETN server (e.g., photo points). If you
try to knit a report, and you get an error about a file path not found, track down where the error occured, and 
update the path.</b> 

<b>Note 2: Several reports connect to a server using a CSV with the SQL server address that is not posted to GitHub, 
and lives in a file at the same level as the repo folder. Kate Miller can send that CSV to folks with access to the 
SQL server.</b>

