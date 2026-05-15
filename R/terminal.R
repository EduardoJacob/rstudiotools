#' Send command to new terminal
#'
#' @param command Send command to terminal
#' @param terminal_id Optional terminal_id to send command to, if NULL a new terminal will be created
#' @param caption Optional terminal caption
#'
#' @export
#'
#' @examples
#' \dontrun{
#' terminal("echo 'Hello World'")
#' }
terminal = function(command, terminal_id = NULL, caption = NULL) {

  # Create a new terminal only if none was supplied
  if (is.null(terminal_id)) {
    if (is.null(caption)) {
      terminal_id = rstudioapi::terminalCreate()
    } else {
      terminal_id = rstudioapi::terminalCreate(caption = caption)
    }
  }

  # Ensure command is executed
  command = paste0(command, "\r")

  # Send command to terminal
  rstudioapi::terminalSend(terminal_id,command)

  # Activate terminal
  rstudioapi::terminalActivate(terminal_id)

  # Always return terminal id used
  return(terminal_id)
}
