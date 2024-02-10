# VaakaR
R package "VaakaR" is specifically focuses on CSV data processing, data flows, and is tailored for law studies and the construction field.


## R Packages

see also:

- readr: A package for reading flat files like CSV and TSV.
- dplyr: Useful for data manipulation and transformation.
- tidyr: For data tidying, particularly reshaping and restructuring data.
- data.table: Offers fast and efficient manipulation of large datasets.
- ggplot2: For data visualization
- [quarto](https://quarto.org/docs/computations/r.html): PDF and HTML
- [DiagrammerR](https://rich-iannone.github.io/DiagrammeR/)https://rich-iannone.github.io/DiagrammeR/

## How To

- create new repo (main) if e.g. R package
- edit read me and issues
- go to correct local path
- clone repo: git clone git@github.com:vaakaruode/VaakaR.git
- changes
- push with correct git account
  - git push git@github-vaakaruode:vaakaruode/vaakaR
- go to Rstudio
  - create new project: e.g. /vaakaruode-git/VaakaR path
    - note create R package was not available for some reason
  - open new Session
  - start coding in project vaakaR.
    - setwd(.. "/vaakaruode-git/")
    - getwd()
    - usethis::create_package("VaakaR")
    - overwrite existing VaakaR.Rproj

  
