# ...............................................................
# main_VaakaR_package_creation.R
# 1) Top-right corner - new project, create folder, create git repo
# ...............................................................
if (!require(devtools)) install.packages("devtools")
library(devtools)

if (!require(testthat)) install.packages("testthat")
library(testthat)

if (!require(pkgdown)) install.packages("pkgdown")
library(pkgdown)

library(Rcpp)

p.path.git <- "C:/Users/talon/vaakaruode-git/" # Asus
p.package.name <- "VaakaR"
setwd(p.path.git)
devtools::document(p.package.name)
pkgdown::build_reference_index(pkg = "VaakaR")
pkgdown::build_news(pkg = "VaakaR")
devtools::check(p.package.name)
devtools::build(p.package.name)
# ...............................................................
base::detach(package:VaakaR, unload = TRUE)
#p.description.version.number <- '0.0.0.9000'
#p.description.version.number <- '0.0.0.9241002'
#p.description.version.number <- '0.02.11'
p.description.version.number <- '0.02.12'
setwd(p.path.git)
path2package <- paste0(p.path.git, p.package.name,"_",p.description.version.number,".tar.gz")
install.packages(path2package, source = TRUE, repos = NULL) # use the same version number as in DESCRIPTION
# ...............................................................
setwd(p.path.git)
pkgdown::build_site("VaakaR") # after build. If failing - install new package
# ...............................................................





# ...............................................................
setwd("C:/Users/talon/vaakaruode-git/")
getwd()
# ...............................................................
# Only once: usethis::create_package("VaakaR")
# ...............................................................
if (FALSE) {
  # create manually (or mkdir) path to libs and run:
  Sys.getenv('R_LIBS')
  .libPaths()
  # .libPaths(c("C:/R/libs", .libPaths() ) )
}
# ...............................................................
.libPaths()
# ...............................................................
if (!require(devtools)) install.packages("devtools")
library(devtools)

if (!require(testthat)) install.packages("testthat")
library(testthat)

if (!require(pkgdown)) install.packages("pkgdown")
library(pkgdown)

library(Rcpp)
# ...............................................................
p.path.git <- "C:/Users/talon/vaakaruode-git/" # Asus
p.package.name <- "VaakaR"
getwd()
setwd(paste0(p.path.git, p.package.name) )
# ...............................................................
setwd(p.path.git)
# ...............................................................
getwd()
setwd(paste0(p.path.git, p.package.name) )

# one time: use_mit_license()
# one time: devtools::create(p.package.name)
# overwrite Rproj.

dir("VaakaR/R")


# Create tutorials ------------------
setwd(paste0(p.path.git, p.package.name) )
if (FALSE) {
  # run only once: usethis::use_vignette("VaakaR-basic-visualization", title = "Basic Ruuvitag visualizations")

}

if (FALSE) {
  # if devtools::document(p.package.name) not working:
  # install.packages('Rcpp') # Error in FUN(X[[i]], ...) : function 'Rcpp_precious_remove' not provided by package 'Rcpp'
  library(Rcpp) # https://stackoverflow.com/questions/68416435/rcpp-package-doesnt-include-rcpp-precious-remove
}

if (FALSE) {

  base::detach(package:VaakaR, unload = TRUE)

  # Rtools -------------------------
  # Please download and install Rtools 4.0 from https://cran.r-project.org/bin/windows/Rtools/.
  # C:\rtools40
  # Windows uses a toolchain bundle called rtools40.
  # You can do this with a text editor, or from R like so (note that in R code you need to escape backslashes):
  if (FALSE) writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
  # RESTART Rstudio ->
  Sys.which("make")
  ## "C:\\rtools40\\usr\\bin\\make.exe" <-- OK
  # ................................
}

if (FALSE) {
  setwd(paste0(p.path.git, p.package.name) )
  # usethis::use_vignette("VaakaR", title = "VaakaR - Get Started")
  usethis::use_vignette("VaakaR_simple_plots", title = "VaakaR - Simple plots")
}


setwd(paste0(p.path.git, p.package.name) )
# use_gpl3_license()



if (FALSE) {
  install.packages('dplyr')
  install.packages('janitor')
  library(pkgdown)

}
# once: pkgdown::build_favicons(pkg = "VaakaR", overwrite = TRUE)
setwd(p.path.git)
devtools::document(p.package.name)
devtools::check(p.package.name)

# pkgdown::build_reference_index(pkg = "VaakaR", lazy = FALSE, run_dont_run = FALSE)
pkgdown::build_reference_index(pkg = "VaakaR")
pkgdown::build_news(pkg = "VaakaR")
# pkgdown::build_site(new_process = FALSE) # https://github.com/r-lib/pkgdown/issues/1158


devtools::build(p.package.name)
getwd()


base::detach(package:VaakaR, unload = TRUE)
p.description.version.number <- '0.0.0.9000'
p.description.version.number <- '0.0.0.9241002'
p.description.version.number <- '0.02.11'
.libPaths()
path2package <- paste0(p.path.git, p.package.name,"_",p.description.version.number,".tar.gz")
path2package
# arguments needed when installing from source:
setwd(p.path.git)
install.packages(path2package, source = TRUE, repos = NULL) # use the same version number as in DESCRIPTION
# library(VaakaR) # do not take into use

# av <- available.packages(filters=list())


setwd(p.path.git)
# finally:
pkgdown::build_site("VaakaR") # after build. If failing - install new package


