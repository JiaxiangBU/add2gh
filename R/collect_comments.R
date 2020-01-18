globalVariables(c(".", "number"))

#' Collect the body and comments from a Github issue
#' @importFrom dplyr summarise pull
#' @import clipr
#' @import here
#' @import sessioninfo
#' @import stringr
#' @import projmgr
#' @param url The Github issue url.
#' @param repo_owner The Github id of this repository.
#' @param repo_name The Github repository name.
#' @param out_file_path The saved path.
#' @param set_number The Github issue number.
#' @export
#' @examples
#' collect_comments("https://github.com/JiaxiangBU/add2gh/issues/2")
collect_comments <-
    function(url = "https://github.com/JiaxiangBU/add2gh/issues/2",
             repo_owner = "JiaxiangBU",
             repo_name = basename(usethis::proj_path()),
             out_file_path = c(FALSE, here::here("output/tmp.Rmd")),
             set_number = 1) {
        if (url %>% stringr::str_detect(github_url_prefix())) {
            components <- component_from_url(url)
            repo_owner = components$repo_owner
            repo_name = components$repo_name
            set_number = components$set_number
        }
        load_path <- here::here("R/load.R")

        load_path <- if (dir.exists(load_path)) {
            load_path
        } else {
            here::here("../imp_rmd/R/load.R")
        }
        suppressWarnings(suppressMessages(source(load_path)))
        # library(projmgr)
        repo <- create_repo_ref(repo_owner, repo_name)
        body <-
            projmgr::get_issues(repo, state = "all") %>% projmgr::parse_issues() %>% dplyr::filter(number == set_number)
        comments <- if (projmgr::get_issue_comments(repo, number = set_number) == "") {
            data.frame(body = "")
        } else {
            projmgr::get_issue_comments(repo, number = set_number) %>% projmgr::parse_issue_comments()
        }

        text <- dplyr::bind_rows(body %>% dplyr::select(body),
                          comments %>% dplyr::select(body)) %>%
            dplyr::summarise(str_flatten(body, "\n\n")) %>%
            dplyr::pull()

        if (out_file_path == FALSE) {
            clipr::write_clip(text, allow_non_interactive = TRUE)
            cat(text)
            invisible(text)
        } else {
            text %>% readr::write_file(out_file_path)
        }
    }

github_url_prefix <- function()
    "^https://github.com/"

component_from_url <-
    function(url = "https://github.com/JiaxiangBU/add2gh/issues/2") {
        components <-
            url %>%
            stringr::str_remove(github_url_prefix()) %>%
            stringr::str_split("/") %>%
            .[[1]] %>% c() %>%
            setdiff("issues")
        return(list(
            repo_owner = components[1],
            repo_name = components[2],
            set_number = components[3]
        ))
    }
