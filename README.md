
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rstudiotools <img src="man/figures/logo.png" align="right" height="138" alt="rstudiotools package" />

<!-- badges: start -->

<!-- badges: end -->

This R Package contains a collection of addins for RStudio and some
other functions which deal with rstudioapi Package

take a look at my youtube playlist with R Tutorials:

------------------------------------------------------------------------

<https://www.youtube.com/playlist?list=PLRbCt61PaxX2d0_QXh6Qi6_jAQd66fmcI>

------------------------------------------------------------------------

## Installation

You can install the development version of rstudiotools from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("EduardoJacob/rstudiotools")
```

### Defined Addins

**aligntext** This function cleans up the formatting of the currently
selected text. It splits the selection into individual lines, trims
leading and trailing whitespace from each line using
`stringr::str_trim`, and then re-inserts the cleaned text back into the
RStudio document.

**lowercase** This function converts all characters in the selected text
to lower case. It processes the selection line-by-line, applying the
base R `tolower` transformation before updating the document.

**sentencecase** This function applies sentence-style capitalization to
the selected text. Utilizing `stringr::str_to_sentence`, it ensures the
first letter of each line (or string segment) is capitalized while the
remainder is converted to lower case.

**sortascending** This function reorders the selected lines of text in
ascending alphabetical order (A-Z). It captures the selection, sorts the
lines using R’s internal sorting logic with `decreasing = FALSE`, and
replaces the original selection with the ordered list.

**sortdescending** This function reorders the selected lines of text in
descending alphabetical order (Z-A). Similar to the ascending version,
it sorts the captured lines with `decreasing = TRUE` and overwrites the
active selection in the editor.

**titlecase** This function transforms the selected text into title
case, where the first letter of every major word is capitalized. It
utilizes the `stringr::str_to_title` function to perform the conversion
before re-inserting the text into the active document.

**uppercase** This function converts all characters within the selected
text to upper case. It applies the base R `toupper` function to the
selection, providing a quick way to emphasize or format headers and
constants.

**sortfunctions** This function inserts current Functions loaded on
Global Environment into the active document.

### Defined Functions

**terminal** The `terminal()` function allows users to programmatically
send and execute commands within an RStudio terminal. If no specific
`terminal_id` is provided, the function automatically initializes a new
terminal instance. It ensures the command is executed by appending a
carriage return, activates the target terminal pane so the output is
immediately visible, and returns the ID of the terminal used for future
reference.

**displaymedia** The `displaymedia()` function is a versatile tool for
rendering various media formats directly within the RStudio IDE,
utilizing either the “Plots” or “Viewer” panels. It supports a wide
range of formats including images (JPG, PNG), videos (MP4, WEBM), PDFs,
and YouTube links, from both local directories and remote URLs. When
called without arguments, it scans the current working directory for
compatible media files and presents them in an interactive loop.

**setcwd** The `setcwd()` function provides a quick way to synchronize
the R session’s working directory with the location of the file
currently being edited in the RStudio editor. It utilizes the
`rstudioapi` to retrieve the path of the active document, extracts its
directory, and updates the global working directory using `setwd()`.
This is particularly useful for ensuring relative file paths work
correctly during script development.”“”
