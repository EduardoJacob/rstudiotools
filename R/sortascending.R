#' Sort ascending selected text
#'
#' @description
#' Sort ascending selected text
#'
#'
#' @export
sortascending = function() {
  context = rstudioapi::getActiveDocumentContext()
  selection = rstudioapi::primary_selection(context)
  #print(selection)
  sel_text = strsplit(selection$text, "\r?\n", perl = TRUE)[[1]]
  sel_text = sort(sel_text,decreasing = FALSE)
  rstudioapi::insertText(location = selection$range, text = paste(sel_text, collapse = "\n"))

}




