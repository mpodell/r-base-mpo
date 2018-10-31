FROM rocker/r-base

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    openssh-client \
    ## clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

## Install packages from CRAN
RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    testthat \
    bigrquery \
    jsonlite \
    future \
    listenv \
    tidyverse \
    magrittr \
    lubridate \
    ngram \
    readr \
    igraph \
    googleComputeEngineR \
    googleAuthR \
    foreach \
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

CMD ["R", "--no-save", "--RS-port 22"]
