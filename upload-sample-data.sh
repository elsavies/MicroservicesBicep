#!/bin/bash

# Variables
storageAccountName="$1"
storageAccountKey="$2"
blobContainerName="$3"
repoBaseUrl="$4"

# Create a unique timestamp for temporary directory
timestamp=$(date +%s)
tempDir="temp_$timestamp"
mkdir "$tempDir"

declare -A urls

urls["green_tripdata_2023-05.parquet"]=${ repoBaseUrl }'green_tripdata_2023-05.parquet'

# Install Azure CLI extension for Data Lake Storage
az config set extension.use_dynamic_install=yes_without_prompt 2>/dev/null

az storage fs directory create -n sample_data_generated -f "$blobContainerName" --account-name "$storageAccountName" --account-key "$accountKey" --auth-mode "key"

# Download files
#for url in ${!urls[@]};
#do
#  outfile=/mnt/azscripts/azscriptinput/${tempDir}/${url}
#  curl -L ${urls[${url}]} -o $outfile
#  output= az storage fs file upload -s $outfile -p sample_data_generated/$url -f "$blobContainerName" --account-name "$storageAccountName" --account-key "$accountKey"  --auth-mode key
#done
