# code to generate glossary
library(dplyr)
library(readr)
library(glue)
#library(googlesheets4)
# change this to a regular old csv eventually and ship it with the book.
#terms <- googlesheets4::sheets_read("1i2yBb5T1Dyxm_gT4oXwjm-5DSkeNftCCdcmPjbeqHx8")

terms <- read_csv("dat/glossary-open-for-sci-r.csv")
terms <- terms %>%
  mutate(source_md = ifelse(is.na(source_link), source_display,
                            paste0("[", source_display, "](", source_link, ")")),
         chapter = ifelse(!is.na(chapter), paste0("## ", chapter, "\n"), NA))
glossary_template <- "{chapter}
```{{definition, label = '{label}'}}
**: {term}** - {definition_with_punc} *Source: {source_md}*
```

"

res <- glue_data(terms, glossary_template, .na = "")

res


header <- "# (APPENDIX) Appendix {-}

# Glossary {#glossary}

Terms are given in the order in which they appear in the body of the text.
"


cat(header, res, sep = "\n", file = "content/glossary.Rmd")
