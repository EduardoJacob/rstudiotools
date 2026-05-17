#' Send Markdown to RStudio Viewer Pane
#'
#' @description
#' Send Markdown to RStudio Viewer Pane
#' Frequently, the Markdown will be the output of an LLM request
#'
#' @param markdown Markdown variable to be rendered on the Viewer Pane
#'
#' @export
viewmarkdown = function(markdown) {
  html = markdown::mark_html(text = markdown)
  temp_file = tempfile(fileext = ".html")
  writeLines(html, temp_file)
  rstudioapi::viewer(temp_file)
}

