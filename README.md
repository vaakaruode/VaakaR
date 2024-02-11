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

### git

- Check Git Remote: Verify that the remote URL of the Git repository points to the correct GitHub account. You can check this using the following Git command:
  * git remote -v
  * git push git@github.com:correctusername/repositoryname.git
  * refer to the issue e.g.
    * git commit -m "Fix issue #3: percentages are used instead of 200px"
  * To automatically close an issue when the commit is pushed, you can use special keywords such as "closes," "fixes," or "resolves" followed by the issue number. Referencing and Closing Multiple Issues:
    * git commit -m "Fixed issues #123 and #456: Updated CSS styles. Fixes #123, #456"
  * or just one as: git commit -m "Fixed issue #3: Updated CSS styles and git readme. Fixes #3"
  * LF will be replaced by CRLF the next time Git touches it
    * This warning message is indicating that there's a difference in line endings (LF, which stands for Line Feed, versus CRLF, which stands for Carriage Return Line Feed) between what Git expects and what is currently in your file.
    * Git Warning: When you try to commit these changes, Git warns you that it will convert the line endings from LF to CRLF the next time it touches the file, meaning it will change the line endings to match the configured settings of the repository.
    * You can configure Git to handle line endings automatically using the core.autocrlf and core.eol settings.

    

