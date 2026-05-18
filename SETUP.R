
# if exists ".Rbuildignore", then add current file to it
if (file.exists(".Rbuildignore")) {
  current_file = basename( rstudioapi::getSourceEditorContext()$path )
  usethis::use_build_ignore(current_file)
  usethis::use_build_ignore("StartLMstudio.ps1")
  usethis::use_build_ignore("images")

}

# No caso de falhar o "Package Check" com Codoc mismatches from Rd file
# devtools::document()

usethis::use_git()

usethis::use_github()

usethis::use_readme_rmd()

usethis::use_mit_license()

usethis::use_roxygen_md()

# devtools::check()

# if removing a function or for any other reason there's an error in the documentation, you can use:
devtools::document()

usethis::browse_github()



# Start LM Studio if needed
terminal_id = rstudiotools::terminal(".\\StartLMstudio.ps1",caption="CLAUDE")
# Start Claude Code if needed
rstudiotools::terminal("claude --model qwen/qwen3.5-9b", terminal_id = terminal_id)

prompt = "Review the project and update claude.md to reflect the current architecture and recent changes."
rstudiotools::terminal(prompt, terminal_id = terminal_id)



# 1. Load all functions in your /R directory into the environment package:rstudiotools
devtools::load_all()

# 2. Now run the check (do not use quotes around the function name)
codetools::checkUsage(aligntext, all = TRUE)


















