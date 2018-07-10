FROM rocker/r-base

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    ## clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## Install packages from CRAN
RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    bigrquery \
    jsonlite \
    dplyr \
    magrittr \
    lubridate \
    ngram \
    readr \
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
