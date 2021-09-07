FROM node:12.18.4

RUN apt-get -y update && \
    apt-get -qq install -y chromium zip jq bc && \
    npm i --no-save -g license-extractor@1.0.4 && \
    npm i --no-save -g license-checker@25.0.1 && \
    npm i --no-save -g typescript@^3.7.2

# Install Azure CLI
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install Azure Copy CLI
# https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10#download-azcopy
RUN wget -O azcopy_v10.tar.gz https://aka.ms/downloadazcopy-v10-linux && \
    tar -xf azcopy_v10.tar.gz --strip-components=1 && \
    rm azcopy_v10.tar.gz ThirdPartyNotice.txt
RUN mv azcopy /usr/local/bin/azcopy
