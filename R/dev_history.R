# use_build_ignore("R/dev_history.R")
install()
library(add2gh)


# git ---------------------------------------------------------------------


system("git pull origin master")
backup <- readr::read_lines("../imp_rmd/backup.txt")
system(glue::glue("git pull {backup} master"))

system("git push origin master")
backup <- readr::read_lines("../imp_rmd/backup.txt")
system(glue::glue("git push {backup} master"))
