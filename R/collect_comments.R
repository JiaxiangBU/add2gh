#' @importFrom dplyr summarise pull
#' @export
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
        library(projmgr)
        repo <- create_repo_ref(repo_owner, repo_name)
        body <-
            get_issues(repo, state = "all") %>% parse_issues() %>% filter(number == set_number)
        comments <-
            get_issue_comments(repo, number = set_number) %>% parse_issue_comments()

        text <- bind_rows(body %>% select(body),
                          comments %>% select(body)) %>%
            dplyr::summarise(str_flatten(body, "\n\n")) %>%
            dplyr::pull()

        if (out_file_path == FALSE) {
            clipr::write_clip(text, allow_non_interactive = TRUE)
            cat(text)
        } else {
            text %>% write_file(out_file_path)
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
