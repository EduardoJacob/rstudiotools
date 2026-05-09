#' Send current working directory
#'
#' @export
#'
#' @examples
#' \dontrun{
#' setcwd()
#' }
setcwd = function() {
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
