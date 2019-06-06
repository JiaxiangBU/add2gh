collect_comments <- function(repo_owner = "JiaxiangBU",
                             repo_name = "analyze-business-data-sql",
                             out_file_path = here::here("output/tmp.Rmd"),
                             set_number = 1) {
    load_path <- here::here("R/load.R")
    if (dir.exists(load_path)) {
        source(load_path)
    } else {
        source(here::here("../imp_rmd/R/load.R"))
    }
    library(projmgr)
    repo <- create_repo_ref(repo_owner, repo_name)
    body <-
        get_issues(repo) %>% parse_issues() %>% filter(number == set_number)
    comments <-
        get_issue_comments(repo, number = set_number) %>% parse_issue_comments()
    bind_rows(body %>% select(body),
              comments %>% select(body)) %>%
        summarise(str_flatten(body, "\n\n")) %>%
        pull %>%
        write_file(out_file_path)
}