FROM ubuntu
ENV CLIURL=https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz  
ENV SFDX_AUTOUPDATE_DISABLE=false
ENV SFDX_USE_GENERIC_UNIX_KEYCHAIN=true
ENV SFDX_DOMAIN_RETRY=300
ENV SFDX_DISABLE_APP_HUB=true
ENV SFDX_LOG_LEVEL=DEBUG
ENV DEPLOYDIR=src
ENV TESTLEVEL=RunLocalTests
RUN apt-get update && apt-get install wget -y
RUN mkdir sfdx
RUN apt-get install xz-utils -y
RUN wget -qO- $CLIURL | tar xJ -C sfdx --strip-components 1
RUN "./sfdx/install"
ENV PATH=./sfdx/$(pwd):$PATH
RUN sfdx --version
RUN sfdx plugins --core