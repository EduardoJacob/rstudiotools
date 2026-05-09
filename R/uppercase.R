#' Convert to Upper case selected text
#'
#' @description
#' Convert to Upper case selected text
#'
#'
#' @export
uppercase = function() {
  context = rstudioapi::getActiveDocumentContext()
  selection = rstudioapi::primary_selection(context)
  sel_text = strsplit(selection$text, "\r?\n", perl = TRUE)[[1]]
  # convert string vector to upper case
  sel_text = toupper(sel_text)

  rstudioapi::insertText(location = selection$range, text = paste(sel_text, collapse = "\n"))

}

