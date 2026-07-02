#' Enhanced Session Information
#'
#' @export
#'
#' @examples
#' \dontrun{
#' showinfo()
#' }
showinfo = function() {
  # library("benchmarkme")

  # Complement the information with sessioninfo package
  options(warn = -1)
  info = sessioninfo::session_info(info="platform")
  options(warn = 0)

  cat( cli::rule(left = "showinfo", col = "blue"),"\n" )
  cat("Working Directory :",getwd(),"\n")
  if ( interactive() ) cat("Script Name . . . :",rstudioapi::getActiveDocumentContext()$path,"\n")
  cat("Timestamp . . . . :",as.character(Sys.time()),"\n")
  cat("Interactive . . . :",interactive(),"\n")
  sysinfo = Sys.info()
  user = sysinfo["user"]
  nodename = sysinfo["nodename"]
  machine = info[["platform"]][["os"]]
  cat("User/OS . . . . . :",user,"on",nodename,machine,"\n")
  # cpu = paste(benchmarkme::get_cpu(),collapse=' ' ) # Error: Unable to detect your CPU.
  ram = round(benchmarkme::get_ram() / ( 1024 * 1024 * 1024 ) )
  cat("RAM . . . . . . . :",ram,"GB \n")
  CPU = system2("powershell",c("-Command","Get-CimInstance Win32_Processor | Select-Object Name"),stdout=T)[4]
  cat("CPU . . . . . . . :",CPU,"\n")
  GPU = system2("powershell",c("-Command","Get-CimInstance Win32_VideoController | Select-Object Name"),stdout=TRUE)
  cat("integrated GPU. . :",GPU[4],"\n")
  cat("discrete GPU. . . :",GPU[5],"\n")

  # if R.version.string contains "ucrt" then it is the UCRT version of R, otherwise it is the MSVCRT version
  if ( grepl("ucrt",R.version.string) ) {
    cat("R . . . . . . . . :",R.version.string,"( Universal C Runtime )\n")
  } else {
    cat("R . . . . . . . . :",R.version.string,"\n")
  }

  IDE = info[["platform"]][["ui"]]

  # If not interactive, cannot communicate with rstudioapi
  # if ( IDE == "RStudio" && interactive() ) {
  if ( IDE == "RStudio" ) {
    cat("IDE . . . . . . . : RStudio",as.character(info[["platform"]][["rstudio"]]),"\n")
  } else {
    cat("IDE . . . . . . . :",IDE,"\n")
  }

  if ( interactive() ) cat("R Project . . . . :",rstudioapi::getActiveProject(),"\n")

  cat("Language. . . . . :",info[["platform"]][["language"]],"\n")
  cat("Location. . . . . :",info[["platform"]][["tz"]],"\n")
  cat("CRAN. . . . . . . :",getOption("repos"),"\n")
  cat("Libpath . . . . . :",.libPaths(),"\n")

  # Check for R upgrade available
  # try( invisible( installr::check.for.updates.R(GUI=F) ),silent=F)

  invisible()
} # showinfo

