FROM rocker/r-base

RUN apt-get -y --no-install-recommends install \
    ed \
    clang  \
    ccache \
    htop \
    libcurl \

# Install Packages
   && install2.r --error \
        googleComputeEngineR googleCloudStorageR bigrquery tidyverse \

## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
