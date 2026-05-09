#' Convert to Title case selected text
#'
#' @description
#' Convert to Title case selected text
#'
#'
#' @export
titlecase = function() {
  context = rstudioapi::getActiveDocumentContext()
  selection = rstudioapi::primary_selection(context)
  sel_text = strsplit(selection$text, "\r?\n", perl = TRUE)[[1]]
  # convert string vector to title case
  sel_text = stringr::str_to_title(sel_text)

  rstudioapi::insertText(location = selection$range, text = paste(sel_text, collapse = "\n"))

}

