#' Convert to Sentence case selected text
#'
#' @description
#' Convert to Sentence case selected text
#'
#'
#' @export
sentencecase = function() {
  context = rstudioapi::getActiveDocumentContext()
  selection = rstudioapi::primary_selection(context)
  sel_text = strsplit(selection$text, "\r?\n", perl = TRUE)[[1]]
  # convert string vector to sentence case
  sel_text = stringr::str_to_sentence(sel_text)

  rstudioapi::insertText(location = selection$range, text = paste(sel_text, collapse = "\n"))

}
