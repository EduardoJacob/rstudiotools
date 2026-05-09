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
      setwd(current_directory)
      message("Working directory set to: ", current_directory)
    }
  }
}
