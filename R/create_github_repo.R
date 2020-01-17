#' #' Create a GitHub repository by one function.
#' #' @import devtools
#' #' @import glue
#' #' @param repo_name Character Repository name.
#' #' @param is_project Logical. Whetheer is a R project.
#' #' @param private_token Path to save the private token.
#' #' @param username Github id.
#' #' @export
#' create_github_repo <- function(repo_name, is_project, private_token = private_token, username = "JiaxiangBU") {
#'     glue::glue(
#'         'curl -i -H "Authorization: token {private_token}" -d \'{{"name": "{repo_name}", "auto_init": false, "private": true}}\' https://api.github.com/user/repos'
#'     ) %>%
#'         system(intern = TRUE)
#'     # library(devtools)
#'     if (is_project) {
#'         devtools::create_project(here::here(glue("../{repo_name}")))
#'     } else {
#'         devtools::create_package(here::here(glue("../{repo_name}")))
#'     }
#'     if (sessioninfo::os_name() %>% str_detect("Windows")) {
#'         glue(
#'             "git remote add origin git@github.com:{username}/{repo_name}.git
#'   git push -u origin master"
#'         ) %>% clipr::write_clip()
#'     } else {
#'         glue(
#'             "git remote add origin https://github.com/{username}/{repo_name}.git
#'   git push -u origin master"
#'         ) %>% clipr::write_clip()
#'
#'     }
#'
#'
#'     fs::dir_create(here::here(glue("../{repo_name}/refs")))
#'     fs::dir_create(here::here(glue("../{repo_name}/analysis")))
#'     fs::dir_create(here::here(glue("../{repo_name}/output")))
#'     bib_path <- here::here("../{repo_name}/refs/add.bib")
#'     if(!file.exists(bib_path)) {
#'       file.create(bib_path)
#'     }
#'     if(!dir.exists(dirname(bib_path))) {
#'       dir.create(dirname(bib_path))
#'     }
#'     print("the git code to push github on the clipboard!")
#' }
