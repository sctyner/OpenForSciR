# code to generate glossary

library(googlesheets4)
terms <- googlesheets4::sheets_read("1i2yBb5T1Dyxm_gT4oXwjm-5DSkeNftCCdcmPjbeqHx8")


library(glue)

glossary_template <- "```{{definition, label = '{label}'}}
**: {term}** - {definition_with_punc} *Source: {source_in_md_form}*
```

"

res <- glue_data(terms, glossary_template)

res


header <- "# (APPENDIX) Appendix {-}

# Glossary {#glossary}

Terms are given in the order in which they appear in the body of the text.
"


cat(header, res, sep = "\n", file = "98-glossary.Rmd")

# Don't forget to paste these lines (uncommented of course) at the top of 98-glossary.Rmd before building the book!!!
# (APPENDIX) Appendix {-}

# Glossary {#glossary}

Terms are given in the order in which they appear in the body of the text.
