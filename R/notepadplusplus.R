#' Open current document in Notepad++
#'
#' @description
#' Open current document in Notepad++
#'
#'
#' @export
notepadplusplus = function() {
  context = rstudioapi::getActiveDocumentContext()
  member = context[["path"]]

  rstudioapi::documentClose()
  system2(
    command = "C:/Program Files/Notepad++/notepad++.exe",
    args = shQuote(member),
    wait = FALSE
  )
}
