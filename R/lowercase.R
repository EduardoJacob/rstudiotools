#' Convert to Lower case selected text
#'
#' @description
#' Convert to Lower case selected text
#'
#'
#' @export
lowercase = function() {
  context = rstudioapi::getActiveDocumentContext()
  selection = rstudioapi::primary_selection(context)
  sel_text = strsplit(selection$text, "\r?\n", perl = TRUE)[[1]]
  # convert string vector to lower case
  sel_text = tolower(sel_text)

  rstudioapi::insertText(location = selection$range, text = paste(sel_text, collapse = "\n"))

}


