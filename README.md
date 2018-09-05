# OpenForensics

This repository is the home of "Open Forensic Science with R". 

## Timeline as of right now (will be updated periodically): 

- Rough draft of each chapter by end of February 2019
- First online availability end of April 2019 

## For authors: 

If you're stuck, start with the Data section of your chapter. The data chapter should answer the following questions: 
    * How are the physical (aka "real-world") data collected?
    * How are the physical data processed to create digital data? 
    * Once converted to digital, what should the data look like before we can analyze it in R? 
        
## For your R packages: 

Please consider submitting them to [ROpenSci](https://github.com/ropensci/onboarding) for peer review. The project is funded by ROpenSci, so it would be nice to have all the packages in the book be part of the ROpenSci collection of packages. I (Sam) will help you with this whenever you need it. They have an online book [here](https://ropensci.github.io/dev_guide/) that walks you through their process. They also recommend following the structure guidelines laid out in Hadley Wickham's R Package [book](http://r-pkgs.had.co.nz/). 


## My running list of open forensics software

### DNA

- [Open Source Biometrics Software (Wiki)](https://en.wikipedia.org/wiki/List_of_open-source_bioinformatics_software)
- http://genometools.org/
- https://www.openhumans.org/

### Firearms/Toolmarks

- [`bulletr`](https://github.com/erichare/bulletr) R package
- Jeremy Hadler's work? 
- [cartridges](https://github.com/xhtai/cartridges) R package 

### Shoe prints / Tire tracks

- Guillermo & Martin's work
- [`solefinder`](https://github.com/CSAFE-ISU/solefinder) R package
- Soyoung's work

### Glass 

- Soyoung's work
- bundle code into R package

### Fingerprints

- Steve's work 
- [Anguli](http://dsl.cds.iisc.ac.in/projects/Anguli/
- [NIST Biometric Image Software (NBIS)](https://www.nist.gov/services-resources/software/nist-biometric-image-software-nbis)

### Handwriting 

- Amy's work
- Steve's work
- Nick's work (?) 

### Steganography

- [stegasaur](https://github.com/richfitz/stegasaur) R package

### Discussion Points

(GUillermo) **Disclaimer** I am aware that this 'section' does not belong here. I just do not know where this should be (if anywhere).

- Would it be possible to include shiny apps or references to them in a project like this? It would be appealing for forensic practitioners or forensic scientists to be able to play with the software via a shiny app, like Eric's app or the one that Martin and I are working on (where you will be able to upload your own images, preprocess them and analyze them).
    - I think that's a great idea! We can have a chapter on interactivity and online resources
- I believe we could convince Alicia and Soyoung to bundle all their code into an R package to be included in the shoeprints and glass sections as well.
    - I think you mean Soyoung ;P But, I agree it's a good idea! 
    - It is also worth considering reaching out to other CSAFE institutions to see what R packages they have. I remember one from CMU that was presented at the all hands meeting. 


