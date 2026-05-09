#' Display media file
#'
#' @description
#' Display media file on Rstudio, either on "Plots" or "Viewer" panels
#' Supported formats: jpg, jpeg, png, webm, mp4, pdf, youtube
#' Local files or Cloud are supported
#'
#'
#' @param filename The filename, either Local or URL
#'
#' @export
#'
#' @examples
#' \dontrun{
#' displaymedia() # Displays all Local media files
#' displaymedia("https://rstudio.github.io/cheatsheets/rstudio-ide.pdf")
#' displaymedia("https://www.w3schools.com/tags/movie.mp4")
#' displaymedia("https://www.youtube.com/watch?v=uXIIk7suD6c")
#' displaymedia("sample.mp4")
#' displaymedia("sample.pdf")
#' }
displaymedia = function(filename="") {
  if ( filename != "" ) {
    message("Displaying: ", filename)
    displaymedialoop(filename)
  } else {
    filenames = list.files(pattern = "\\.(jpg|jpeg|png|pdf|mp4|webm)$", ignore.case = TRUE)
    i = 1
    num = length(filenames)
    if ( num == 0 ) return("No media found")

    for (filename in filenames) {
      message("Displaying file ",i,"/",num," : ",filename)
      i = i + 1
      displaymedialoop(filename)
      answer = ""
      if ( i <= num ) answer = readline(prompt = "Press [Enter] to continue, [c] to Cancel... ")
      if ( tolower(answer) == "c" ) return(invisible(NULL))
    }
  }

}

displaymedialoop = function(filename) {
  if ( grepl("://",filename, ignore.case = TRUE) ) {
    origin = "CLOUD"
  } else {
    origin = "LOCAL"
  }

  extension = tolower( tools::file_ext(filename) )
  if ( extension == "" ) extension = "youtube"

  if ( origin == "LOCAL" && grepl(extension,"jpg,jpeg") ) {
    img = jpeg::readJPEG(filename)
    grid::grid.newpage()
    grid::grid.raster(img)
  }

  if ( origin == "LOCAL" && grepl(extension,"png") ) {
    img = png::readPNG(filename)
    grid::grid.newpage()
    grid::grid.raster(img)
  }

  if ( origin == "LOCAL" && grepl(extension,"pdf,mp4,webm") ) {
    invisible( file.copy(from=filename, to=tempdir(),overwrite=T) )
    rstudioapi::viewer( file.path( tempdir(),filename) )
  }


  if ( origin == "CLOUD" && grepl(extension,"pdf") ) {
    htmltools::html_print(
      htmltools::tags$iframe(
        src = filename,
        style = "width:100%; height:1000px;",
        frameborder = 0
      )
    )
  }

  if ( origin == "CLOUD" && grepl(extension,"jpg,jpeg,png") ) {
    html_file = tempfile(fileext = ".html")
    html_code = htmltools::tags$html(
      htmltools::tags$head(
        htmltools::tags$style(
        "img {
          max-width: 100%;
          height: auto;
          display: block;
          margin-left: auto;
          margin-right: auto;
        }
        body {
          margin: 0;
          padding: 0;
        }"
        )
      ),
      htmltools::tags$body(
        htmltools::tags$img(src = filename)
      )
    )

    htmltools::save_html(html_code, html_file)
    rstudioapi::viewer(html_file)
  }

  if ( origin == "CLOUD" && grepl(extension,"mp4,webm") ) {
    html_file = tempfile(fileext = ".html")
    html_code = sprintf('
      <html>
        <body style="margin:0; background:#000;">
          <video width="100%%" height="100%%" controls autoplay>
            <source src="%s">
            Your browser does not support the video tag.
          </video>
        </body>
      </html>
      ',filename)

    writeLines(html_code, html_file)
    rstudioapi::viewer(html_file)
  }

  # if ( origin == "CLOUD" && grepl(extension,"youtube") ) {
  #   url = filename
  #   url = gsub("watch\\?v=","embed/",url)
  #   url = paste0(url,"?autoplay=1")
  #   html = sprintf('<iframe width="800" height="450" src="%s" frameborder="0" allow="autoplay" allowfullscreen></iframe>', url)
  #   rstudioapi::viewer(htmltools::HTML(html))
  # }

  if ( origin == "CLOUD" && grepl(extension,"youtube") ) {
    url = filename
    url = gsub("watch\\?v=","embed/",url)
    url = paste0(url,"?autoplay=1")
    ui = shiny::fluidPage(
      # Como ocupar automaticamente todo o space do Viewer Pane ???
      htmltools::HTML(paste0('<iframe width="784" height="479" src="',url,'" frameborder="0" allowfullscreen></iframe>'))
    )

    server = function(input, output, session) {}

    shiny::runGadget(
      shiny::shinyApp(ui, server,options=c("launch.browser"=FALSE,"port"=1111)),
      port=1111,
      viewer = shiny::paneViewer()
    )
  }

}


















