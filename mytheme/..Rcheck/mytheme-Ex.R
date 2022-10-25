pkgname <- "mytheme"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('mytheme')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("theme_paper")
### * theme_paper

flush(stderr()); flush(stdout())

### Name: theme_paper
### Title: Theme of ggplot2 for scientific paper usage
### Aliases: theme_paper

### ** Examples

theme_paper()



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
