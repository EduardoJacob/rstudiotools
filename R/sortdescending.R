#' Sort descending selected text
#'
#' @description
#' Sort descending selected text
#'
#'
#' @export
sortdescending = function() {
  context = rstudioapi::getActiveDocumentContext()
  selection = rstudioapi::primary_selection(context)
  sel_text = strsplit(selection$text, "\r?\n", perl = TRUE)[[1]]
  sel_text = sort(sel_text,decreasing = TRUE)
  rstudioapi::insertText(location = selection$range, text = paste(sel_text, collapse = "\n"))

}


