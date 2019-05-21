# *Open Forensic Science in R* <img src="img/openforscir-hex.png" align="right" width="200" />

## About

This project was funded by [rOpenSci](https://ropensci.org/about/) through their [Research Fellowship program](https://ropensci.org/blog/2018/02/14/announcing-2018-ropensci-fellows/).

### Topics Covered

- Validation of DNA Interpretation Systems
- Firearms
    * Bullets
    * Casings
- Toolmarks
- Latent Fingerprints
- Shoe Outsole Impressions
- Trace glass evidence (chemical composition)
- Decision-making in Forensic Identification Tasks

### Contribute 

Please make a pull request or file an issue if you would like to make a contribution to *Open Forensic Science in R*.


## Build the book

To build, clone or download this repository at the "Clone or download" button at the top of the page. Then, open [index.Rmd](index.Rmd) in R or RStudio, then run:

```{r eval = FALSE}
# install bookdown pkg from CRAN
install.packages("bookdown")
# or install dev version from Github
# devtools::install_github("rstudio/bookdown")
rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
```

## Other R Resources

Please see the current draft of the [CRAN Task View for Forensic Science](https://github.com/sctyner/ctv-forsci). Contributuions are welcome!
