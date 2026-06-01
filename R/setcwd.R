#' Set current working directory
#'
#' @description
#' Set current working directory to the directory of the active script in RStudio, or to a specified directory if provided.
#'
#' @param directory Optional. A directory path to set as the working directory.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' setcwd()
#' }
setcwd = function(directory = NULL) {
  if ( !is.null(directory) ) {
    if ( dir.exists(directory) ) {
      setwd(directory)
      message("Working directory set to: ", directory)
    } else {
      message("Directory does not exist: ", directory)
    }
    return(invisible(NULL))
  }

  if (interactive() && requireNamespace("rstudioapi", quietly = TRUE)) {
    if (rstudioapi::isAvailable()) {
      current_directory = dirname(rstudioapi::getActiveDocumentContext()$path)
      if ( current_directory == "" ) {
        message("setcwd() must be run from a script")
      } else {
        setwd(current_directory)
        message("Working directory set to: ", current_directory)
      }

    }
  }
}
