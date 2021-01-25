#Compile

# Compile
a <- getwd()
setwd("C:/Users/JKnulp/Desktop/bookdown-demo-master")


# see https://bookdown.org/yihui/bookdown for the full documentation
if (file.exists("index.Rmd")) bookdown::render_book("index.Rmd")
## Not run:
# will use the default format defined in index.Rmd or _output.yml
bookdown::render_book("index.Rmd")

# will use the options for format defined in YAML metadata
bookdown::render_book("index.Rmd")
# If you pass an output format object, it must have all the options set
bookdown::render_book("index.Rmd", bookdown::pdf_book(toc = FALSE))

## End(Not run)
