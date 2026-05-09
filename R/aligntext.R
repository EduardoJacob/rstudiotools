#' Align selected text
#'
#' @description
#' Align selected text
#'
#'
#' @export
aligntext = function() {
  context = rstudioapi::getActiveDocumentContext()
  selection = rstudioapi::primary_selection(context)
  sel_text = strsplit(selection$text, "\r?\n", perl = TRUE)[[1]]
  # trim excess spaces in sel_text
  sel_text = stringr::str_trim(sel_text)

  rstudioapi::insertText(location = selection$range, text = paste(sel_text, collapse = "\n"))

}
