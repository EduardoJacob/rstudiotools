#' Insert Global Environment Functions in Current Selection
#'
#' @description
#' Insert Global Environment Functions in Current Selection
#'
#' @export
sortfunctions = function() {
  # Sys.sleep(3);
  i = 0

  functions = utils::lsf.str(envir = .GlobalEnv)
  L = length(functions)
  if ( L == 0 ) stop("No functions found in the global environment.")

  # functions = sort(as.character(functions)) Already comes sorted
  tmp_file = tempfile(fileext = ".R")
  dump(functions, file = tmp_file)

  # Read the file as a vector
  dump_data = readLines(tmp_file)
  # Combine into one string, using \n to preserve line breaks
  dump_data = paste(dump_data, collapse = "\n")
  # Perform the replacement
  dump_data = gsub(" <-\nfunction(", " = function(", dump_data, fixed = TRUE)
  # Split by newline character
  dump_data = strsplit(dump_data, "\n")[[1]]

  # Find indices where the pattern exists
  idx = which(grepl(" = function\\(", dump_data))
  # We use a trick: replace the match with a triple-element string and then re-split
  # This is often faster than growing a vector in a loop
  dump_data[idx] = paste0("\n\n", dump_data[idx])
  # Re-split everything by newline to flatten the vector again
  dump_data = c(dump_data,"\n\n")
  dump_data = unlist(strsplit(dump_data, "\n"))

  # Paste all the functions into current selection
  context = rstudioapi::getActiveDocumentContext()
  selection = rstudioapi::primary_selection(context)
  rstudioapi::insertText(location = selection$range, text = paste(dump_data, collapse = "\n"))
  message("Inserted ", L, " functions into current selection.")
}

